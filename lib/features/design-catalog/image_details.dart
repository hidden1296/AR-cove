import 'package:flutter/material.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ImageDetailPage extends StatefulWidget {
  final String imagePath;
  final String title;
  final String description;
  final List<Map<String, String>> relatedImages;

  const ImageDetailPage({
    Key? key,
    required this.imagePath,
    required this.title,
    required this.description,
    required this.relatedImages,
  }) : super(key: key);

  @override
  _ImageDetailPageState createState() => _ImageDetailPageState();
}

class _ImageDetailPageState extends State<ImageDetailPage> {
  bool _isLiked = false;

  // Function to handle image downloading
  Future<void> _downloadImage() async {
    try {
      // Downloads the image to the user's device
      await ImageDownloader.downloadImage(widget.imagePath);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Image downloaded!")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Failed to download image.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Details'),
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
                // Save button
                ElevatedButton.icon(
                  onPressed: _downloadImage,
                  icon: const Icon(Icons.download),
                  label: const Text('Save'),
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
                            builder: (context) => ImageDetailPage(
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
