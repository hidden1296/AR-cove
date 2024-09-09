import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ExteriorDesignPage extends StatelessWidget {
  const ExteriorDesignPage({Key? key}) : super(key: key);

  final List<Map<String, String>> exteriorImagePaths = const [
    {'path': 'assets/exterior-designs/exterior1.jpg', 'title': 'Modern Exterior Design'},
    {'path': 'assets/exterior-designs/exterior2.jpg', 'title': 'Traditional House Exterior'},
    {'path': 'assets/exterior-designs/exterior3.jpg', 'title': 'Contemporary Villa'},
    {'path': 'assets/exterior-designs/exterior4.jpg', 'title': 'Outdoor Patio Ideas'},
    {'path': 'assets/exterior-designs/exterior5.jpg', 'title': 'Front Yard Landscape'},
    // Add more exterior designs...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exterior Designs'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: exteriorImagePaths.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ExteriorImageDetailPage(
                      imagePath: exteriorImagePaths[index]['path']!,
                      title: exteriorImagePaths[index]['title']!,
                      description: 'This is a detailed description of the exterior design.',
                      relatedImages: exteriorImagePaths,
                    ),
                  ),
                );
              },
              child: Column(
                children: [
                  Expanded(
                    child: Image.asset(
                      exteriorImagePaths[index]['path']!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    exteriorImagePaths[index]['title']!,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class ExteriorImageDetailPage extends StatelessWidget {
  final String imagePath;
  final String title;
  final String description;
  final List<Map<String, String>> relatedImages;

  const ExteriorImageDetailPage({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.relatedImages,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exterior Design Detail'),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              imagePath,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    description,
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: const Text(
                'Related Images',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: StaggeredGrid.count(
                crossAxisCount: 4,
                mainAxisSpacing: 8.0,
                crossAxisSpacing: 8.0,
                children: List.generate(relatedImages.length, (int index) {
                  return StaggeredGridTile.fit(
                    crossAxisCellCount: 2,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ExteriorImageDetailPage(
                              imagePath: relatedImages[index]['path']!,
                              title: relatedImages[index]['title']!,
                              description: "This is a related image description.",
                              relatedImages: relatedImages,
                            ),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            relatedImages[index]['path']!,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            relatedImages[index]['title']!,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
