// lib/widgets/explore_more_image.dart
import 'package:flutter/material.dart';

class ExploreMoreImage extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String designer;
  final String status;
  final String likes;
  final String views;
  final VoidCallback onLike;

  const ExploreMoreImage({
    Key? key,
    required this.imageUrl,
    required this.title,
    required this.designer,
    required this.status,
    required this.likes,
    required this.views,
    required this.onLike,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      width: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 80,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              CircleAvatar(
                radius: 10,
                backgroundImage: NetworkImage(imageUrl),
              ),
              const SizedBox(width: 5),
              Text(designer),
              if (status.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  child: Text(
                    status,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ),
            ],
          ),
          Row(
            children: [
              GestureDetector(
                onTap: onLike,
                child: const Icon(Icons.favorite_border, size: 16, color: Colors.grey),
              ),
              const SizedBox(width: 5),
              Text(likes),
              const SizedBox(width: 10),
              const Icon(Icons.remove_red_eye, size: 16, color: Colors.grey),
              const SizedBox(width: 5),
              Text(views),
            ],
          ),
        ],
      ),
    );
  }
}

class ExploreMoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Dummy data for the example
    final List<Map<String, String>> dummyImages = [
      {
        'url': 'https://via.placeholder.com/150',
        'title': 'Design 1',
        'designer': 'Designer 1',
        'status': 'Completed',
        'likes': '10',
        'views': '100',
      },
      {
        'url': 'https://via.placeholder.com/150',
        'title': 'Design 2',
        'designer': 'Designer 2',
        'status': 'In Progress',
        'likes': '20',
        'views': '200',
      },
      // Add more dummy data as needed
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Explore More Images')),
      body: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: dummyImages.length,
        itemBuilder: (context, index) {
          var imageData = dummyImages[index];
          return GestureDetector(
            onTap: () => _incrementViews(index),
            child: ExploreMoreImage(
              imageUrl: imageData['url']!,
              title: imageData['title']!,
              designer: imageData['designer']!,
              status: imageData['status']!,
              likes: imageData['likes']!,
              views: imageData['views']!,
              onLike: () => _incrementLikes(index),
            ),
          );
        },
      ),
    );
  }

  void _incrementViews(int index) {
    // Placeholder function to simulate incrementing views
    print('Increment views for item at index: $index');
  }

  void _incrementLikes(int index) {
    // Placeholder function to simulate incrementing likes
    print('Increment likes for item at index: $index');
  }
}
