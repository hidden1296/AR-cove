import 'package:arcovefinal/home/agents/property%20details.dart';
import 'package:flutter/material.dart';


class PropertyPage extends StatelessWidget {
  final List<Property> properties = [
    Property(
      agentImageUrl: 'https://via.placeholder.com/150',
      title: 'Nacary Elite House',
      address: '2328 Despard Street, Atlanta, GA',
      price: '\$250,125',
      bedrooms: 2,
      bathrooms: 2,
      area: 350,
      imageUrl: 'https://images.unsplash.com/photo-1600573472474-16d94c240e35',
    ),
    Property(
      agentImageUrl: 'https://via.placeholder.com/150',
      title: 'Modern Apartment',
      address: '1234 Elm Street, New York, NY',
      price: '\$350,000',
      bedrooms: 3,
      bathrooms: 2,
      area: 450,
      imageUrl: 'https://images.unsplash.com/photo-1598928506312-11b7a64d6bcd',
    ),
    Property(
      agentImageUrl: 'https://via.placeholder.com/150',
      title: 'Luxury Villa',
      address: '5678 Oak Avenue, Miami, FL',
      price: '\$450,000',
      bedrooms: 4,
      bathrooms: 3,
      area: 550,
      imageUrl: 'https://images.unsplash.com/photo-1600585154537-988a6b326ec4',
    ),
  ];

  PropertyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Row(
          children: [
            Expanded(
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search by location',
                  border: InputBorder.none,
                  prefixIcon: Icon(Icons.search),
                ),
              ),
            ),
            Icon(Icons.filter_list, color: Colors.black),
          ],
        ),
      ),
      body: Column(
        children: [
          // Filters Row
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Row(
              children: [
                FilterChip(label: const Text('All Filters'), onSelected: (val) {}),
                const SizedBox(width: 8),
                FilterChip(label: const Text('2 Bedrooms'), onSelected: (val) {}),
                const SizedBox(width: 8),
                FilterChip(label: const Text('Area'), onSelected: (val) {}),
                const SizedBox(width: 8),
                FilterChip(label: const Text('Price'), onSelected: (val) {}),
              ],
            ),
          ),
          // Sorting and View Options
          Container(
            color: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text('Sorting: '),
                    Text(
                      'Recent first',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Icon(Icons.arrow_drop_down),
                  ],
                ),
                Row(
                  children: [
                    Icon(Icons.view_list, color: Colors.green),
                    Icon(Icons.view_module),
                  ],
                ),
              ],
            ),
          ),
          // Properties List
          Expanded(
            child: ListView.builder(
              itemCount: properties.length,
              itemBuilder: (context, index) {
                return PropertyTile(property: properties[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class PropertyTile extends StatelessWidget {
  final Property property;

  const PropertyTile({super.key, required this.property});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // Navigate to PropertyDetailsPage
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PropertyDetailsPage(property: property),
          ),
        );
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Column(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(20.0)),
                    child: FadeInImage.assetNetwork(
                      placeholder: 'assets/placeholder_image.png', // Add a placeholder image in your assets
                      image: property.imageUrl,
                      height: 150,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      imageErrorBuilder: (context, error, stackTrace) {
                        return Image.asset(
                          'assets/error_image.png', // Add an error image in your assets
                          height: 150,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        );
                      },
                    ),
                  ),
                  const Positioned(
                    top: 8,
                    right: 8,
                    child: Icon(Icons.favorite_border, color: Color(0xFFB46146)),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: NetworkImage(property.agentImageUrl),
                    ),
                    const SizedBox(width: 16.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            property.title,
                            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 8.0),
                          Text(property.address),
                          const SizedBox(height: 8.0),
                          Text(
                            property.price,
                            style: const TextStyle(fontSize: 16, color: Color(0xFFB46146)),
                          ),
                          const SizedBox(height: 8.0),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(Icons.king_bed, size: 16),
                                  const SizedBox(width: 4),
                                  Text('${property.bedrooms}'),
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.bathtub, size: 16),
                                  const SizedBox(width: 4),
                                  Text('${property.bathrooms}'),
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.square_foot, size: 16),
                                  const SizedBox(width: 4),
                                  Text('${property.area} sqft'),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.more_vert),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Property {
  final String agentImageUrl;
  final String title;
  final String address;
  final String price;
  final int bedrooms;
  final int bathrooms;
  final int area;
  final String imageUrl;

  Property({
    required this.agentImageUrl,
    required this.title,
    required this.address,
    required this.price,
    required this.bedrooms,
    required this.bathrooms,
    required this.area,
    required this.imageUrl,
  });
}
