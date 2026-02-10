import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Flutter layout demo';

    return MaterialApp(
      title: appTitle,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: ListView(
          children: const [
            // وضعنا رابط الصورة الخاص بك هنا
            ImageSection(image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSYxvpsdhetUWKgzQx6lV-9UH-boqFn2D1Hvg&s'),
            TitleSection(
              name: 'Oeschinen Lake Campground',
              location: 'Kandersteg, Switzerland',
            ),
            ButtonSection(),
            TextSection(
              description:
                  'Lake Oeschinen lies at the foot of the Blüemlisalp in the '
                  'Bernese Alps. Situated 1,578 meters above sea level, it is '
                  'one of the larger Alpine Lakes. A gondola ride from '
                  'Kandersteg, followed by a half-hour walk through surfaces '
                  'and pine forest, leads you to the lake, which warms to 20 '
                  'degrees Celsius in the summer.',
            ),
          ],
        ),
      ),
    );
  }
}

// --- قسم الصورة المعدل ---
class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.network(
      image,
      width: double.infinity, // لجعل الصورة تأخذ عرض الشاشة بالكامل
      height: 240,
      fit: BoxFit.cover,
      // هذا الجزء يضمن عدم ظهور علامة X في حال فشل الاتصال
      errorBuilder: (context, error, stackTrace) {
        return Container(
          height: 240,
          color: Colors.grey[200],
          child: const Center(child: Icon(Icons.broken_image, size: 50)),
        );
      },
    );
  }
}

// --- قسم العنوان ---
class TitleSection extends StatelessWidget {
  const TitleSection({super.key, required this.name, required this.location});

  final String name;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text(location, style: TextStyle(color: Colors.grey[500])),
              ],
            ),
          ),
          Icon(Icons.star, color: Colors.red[500]),
          const Text('41'),
        ],
      ),
    );
  }
}

// --- قسم الأزرار ---
class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).primaryColor;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ButtonWithText(color: color, icon: Icons.call, label: 'CALL'),
        ButtonWithText(color: color, icon: Icons.near_me, label: 'ROUTE'),
        ButtonWithText(color: color, icon: Icons.share, label: 'SHARE'),
      ],
    );
  }
}

class ButtonWithText extends StatelessWidget {
  const ButtonWithText({
    super.key,
    required this.color,
    required this.icon,
    required this.label,
  });

  final Color color;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400, color: color),
          ),
        ),
      ],
    );
  }
}

// --- قسم النص ---
class TextSection extends StatelessWidget {
  const TextSection({super.key, required this.description});

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Text(description, softWrap: true),
    );
  }
}
