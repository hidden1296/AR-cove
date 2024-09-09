import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class OfficesDesignPage extends StatelessWidget {
  const OfficesDesignPage({Key? key}) : super(key: key);

  final List<Map<String, String>> officeImagePaths = const [
    {'path': 'assets/office-designs/office1.jpg', 'title': 'Modern Office Design'},
    {'path': 'assets/office-designs/office2.jpg', 'title': 'Luxury Office Interiors'},
    {'path': 'assets/office-designs/office3.jpg', 'title': 'Minimalist Office Setup'},
    {'path': 'assets/office-designs/office4.jpg', 'title': 'Office with Open Plan'},
    {'path': 'assets/office-designs/office5.jpg', 'title': 'Creative Workspaces'},
    // Add more office designs...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Office Designs'),
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
          itemCount: officeImagePaths.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => OfficeImageDetailPage(
                      imagePath: officeImagePaths[index]['path']!,
                      title: officeImagePaths[index]['title']!,
                      description: 'This is a detailed description of the office design.',
                      relatedImages: officeImagePaths,
                    ),
                  ),
                );
              },
              child: Column(
                children: [
                  Expanded(
                    child: Image.asset(
                      officeImagePaths[index]['path']!,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    officeImagePaths[index]['title']!,
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

class OfficeImageDetailPage extends StatefulWidget {
  final String imagePath;
  final String title;
  final String description;
  final List<Map<String, String>> relatedImages;

  const OfficeImageDetailPage({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.relatedImages,
  }) : super(key: key);

  @override
  _OfficeImageDetailPageState createState() => _OfficeImageDetailPageState();
}

class _OfficeImageDetailPageState extends State<OfficeImageDetailPage> {
  bool _isLiked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Office Design Detail'),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Display the full image
            Image.asset(
              widget.imagePath,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 16),
            // Display title and description
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    widget.description,
                    style: const TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            // Like and Save options
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // Like button
                IconButton(
                  icon: Icon(
                    _isLiked ? Icons.favorite : Icons.favorite_border,
                    color: _isLiked ? Colors.red : Colors.black,
                    size: 30,
                  ),
                  onPressed: () {
                    setState(() {
                      _isLiked = !_isLiked;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Related images grid
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
                children: List.generate(widget.relatedImages.length, (int index) {
                  return StaggeredGridTile.fit(
                    crossAxisCellCount: 2,
                    child: GestureDetector(
                      onTap: () {
                        // Navigate to this related image detail page
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => OfficeImageDetailPage(
                              imagePath: widget.relatedImages[index]['path']!,
                              title: widget.relatedImages[index]['title']!,
                              description: "This is a related image description.",
                              relatedImages: widget.relatedImages,
                            ),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          Image.asset(
                            widget.relatedImages[index]['path']!,
                            fit: BoxFit.cover,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            widget.relatedImages[index]['title']!,
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
