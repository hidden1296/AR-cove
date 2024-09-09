import 'package:arcovefinal/home/agents/property.dart';
import 'package:flutter/material.dart';

class PropertyDetailsPage extends StatelessWidget {
  final Property property;

  const PropertyDetailsPage({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(property.title),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Large Property Image
              ClipRRect(
                borderRadius: BorderRadius.circular(20.0),
                child: Image.network(
                  property.imageUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 250,
                  errorBuilder: (context, error, stackTrace) {
                    return Image.asset('assets/error_image.png', height: 250, fit: BoxFit.cover);
                  },
                ),
              ),
              const SizedBox(height: 16),

              // Property Price and Location
              Text(
                property.price,
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Color(0xFFB46146)),
              ),
              const SizedBox(height: 8),
              Text(
                property.address,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 16),

              // Property Description
              const Text(
                'Description',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'This is a beautiful property located at ${property.address}. It features ${property.bedrooms} bedrooms, '
                    '${property.bathrooms} bathrooms, and a spacious area of ${property.area} sqft. The property is ideal '
                    'for families looking for a modern and luxurious living space.',
                style: const TextStyle(fontSize: 16, color: Colors.black54),
              ),
              const SizedBox(height: 16),

              // Discounts
              const Text(
                'Discounts',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Get a 10% discount if you book this property before the end of the month!',
                style: TextStyle(fontSize: 16, color: Colors.green),
              ),
              const SizedBox(height: 16),

              // Property Owner Information
              const Text(
                'Property Owner',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(property.agentImageUrl),
                    radius: 30,
                  ),
                  const SizedBox(width: 16),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'John Doe', // Placeholder for agent name
                        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.phone, size: 16, color: Colors.grey),
                          const SizedBox(width: 4),
                          const Text(
                            '+1 234 567 890', // Placeholder for agent phone number
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Contact and Save buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      // Handle contact button tap
                    },
                    icon: const Icon(Icons.phone),
                    label: const Text('Contact Owner'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      // Handle save button tap
                    },
                    icon: const Icon(Icons.bookmark),
                    label: const Text('Save'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

