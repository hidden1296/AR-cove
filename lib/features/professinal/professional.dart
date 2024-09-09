import 'package:flutter/material.dart';
import 'professional_chat.dart';

class ProfessionalPage extends StatelessWidget {
  final List<Professional> professionals = [
    Professional(
      imageUrl: 'assets/placeholder.png',
      name: 'John Michael',
      phone: '025-561-2546',
      agency: 'Delux Property',
      lastMessage: 'Last message from John',
    ),
    Professional(
      imageUrl: 'assets/placeholder.png',
      name: 'Jane Doe',
      phone: '025-561-2546',
      agency: 'Delux Property',
      lastMessage: 'Last message from Jane',
    ),
    Professional(
      imageUrl: 'assets/placeholder.png',
      name: 'Alice Johnson',
      phone: '025-561-2546',
      agency: 'Delux Property',
      lastMessage: 'Last message from Alice',
    ),
    Professional(
      imageUrl: 'assets/placeholder.png',
      name: 'Robert Brown',
      phone: '025-561-2546',
      agency: 'Delux Property',
      lastMessage: 'Last message from Robert',
    ),
  ];

  final List<String> uploadedImages = [
    'assets/upload1.png',
    'assets/upload2.png',
    'assets/upload3.png',
    'assets/upload4.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Professionals'),
        backgroundColor: const Color(0xFFB46146),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Add search functionality
            },
          ),
        ],
      ),
      backgroundColor: const Color(0xFFB46146),
      body: ListView(
        children: [
          // Uploads Section
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Uploads',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: uploadedImages.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(uploadedImages[index]),
                  ),
                );
              },
            ),
          ),
          const Divider(color: Colors.white),
          // Professional Section
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Professional',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: professionals.length,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.white,
                margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 4,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(professionals[index].imageUrl),
                  ),
                  title: Text(professionals[index].name, style: const TextStyle(color: Color(0xFFB46146))),
                  subtitle: Text(professionals[index].lastMessage),
                  trailing: const Icon(Icons.arrow_forward_ios, size: 16, color: Color(0xFFB46146)),
                  onTap: () {
                    // Navigate to professional's chat page
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProfessionalChatPage(
                          name: professionals[index].name,
                          imageUrl: professionals[index].imageUrl,
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
          const Divider(color: Colors.white),
          // Follow More Section
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Follow More',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: professionals.length,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.white,
                margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 4,
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(professionals[index].imageUrl),
                  ),
                  title: Text(professionals[index].name, style: const TextStyle(color: Color(0xFFB46146))),
                  subtitle: Text(professionals[index].agency),
                  trailing: const Icon(Icons.add_circle, color: Colors.green),
                  onTap: () {
                    // Follow the professional
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class Professional {
  final String imageUrl;
  final String name;
  final String phone;
  final String agency;
  final String lastMessage;

  Professional({
    required this.imageUrl,
    required this.name,
    required this.phone,
    required this.agency,
    required this.lastMessage,
  });
}
