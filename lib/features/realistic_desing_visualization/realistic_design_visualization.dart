import 'package:flutter/material.dart';


class RealisticDesignVisualization extends StatelessWidget {
  final List<Design> designs = [
    Design(
      imageUrl: 'https://images.unsplash.com/photo-1560185127-6f9d66d8b5e5',
      title: 'Modern Living Room',
    ),
    Design(
      imageUrl: 'https://images.unsplash.com/photo-1600573472474-16d94c240e35',
      title: 'Elegant Bedroom',
    ),
    // Add more designs here...
  ];

   RealisticDesignVisualization({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Design Visualization'),
        backgroundColor: const Color(0xFFB46146),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            childAspectRatio: 0.8,
          ),
          itemCount: designs.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DesignDetailPage(design: designs[index]),
                  ),
                );
              },
              child: DesignTile(design: designs[index]),
            );
          },
        ),
      ),
    );
  }
}

class Design {
  final String imageUrl;
  final String title;

  Design({required this.imageUrl, required this.title});
}

class DesignTile extends StatelessWidget {
  final Design design;

  const DesignTile({super.key, required this.design});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      elevation: 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15.0)),
            child: Image.network(
              design.imageUrl,
              height: 150,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              design.title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}

class DesignDetailPage extends StatelessWidget {
  final Design design;

  const DesignDetailPage({super.key, required this.design});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(design.title),
        backgroundColor: const Color(0xFFB46146),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.network(
                  design.imageUrl,
                  height: 300,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                design.title,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                icon: const Icon(Icons.shopping_cart),
                label: const Text('Buy with Apple Pay'),
                onPressed: () {
                  // Handle Apple Pay button tap
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}