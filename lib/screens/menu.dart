import 'package:flutter/material.dart';
import '../screens/add_product.dart';
import '../widgets/left_drawer.dart';
import '../widgets/product_card.dart';


void main() {
  runApp(const AoElevenApp());
}

class AoElevenApp extends StatelessWidget {
  const AoElevenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ao Eleven',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 0, 255, 242)),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  final String nama = "Andi Hakim Himawan";
  final String npm = "2406495792";
  final String kelas = "D";

  final List<ItemHomepage> items = const [
    ItemHomepage("All Products", Icons.inventory_2_rounded, Color.fromARGB(255, 0, 90, 226)),
    ItemHomepage("Create Product", Icons.add, Color.fromARGB(255, 247, 0, 0)),
    ItemHomepage("Logout", Icons.logout,Colors.yellow),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Ao Eleven',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        foregroundColor: Colors.white,
      ),
      drawer: const LeftDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(child: InfoCard(title: 'NPM', content: npm)),
                  Expanded(child: InfoCard(title: 'Name', content: nama)),
                  Expanded(child: InfoCard(title: 'Class', content: kelas)),
                ],
              ),

              const SizedBox(height: 24),

              const Text(
                'Selamat datang di Ao Eleven!',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),

              const SizedBox(height: 16),

              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 3,
                childAspectRatio: 1.4,
                children: items.map((item) => ItemCard(item)).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String content;

  const InfoCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text(content),
          ],
        ),
      ),
    );
  }
}

