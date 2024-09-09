import 'package:flutter/material.dart';
import '../navbar/bottom_nav_bar.dart';
import 'chat_details.dart';

class consult extends StatefulWidget {
  const consult({super.key});

  @override
  _consult createState() => _consult();
}
  class _consult extends State<consult> {
  int _selectedIndex = 3; // Default index for Consult page

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats'),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.camera_alt),
            onPressed: () {
              // Add camera action
            },
          ),
          const SizedBox(width: 16),
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              // Add edit action
            },
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: ListView(
        children: List.generate(
          8,
              (index) => ChatTile(
            avatarUrl: 'https://via.placeholder.com/150',
            name: 'user',
            message: 'price?',
            time: '10:39 AM',
            unreadCount: index + 1,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class ChatTile extends StatelessWidget {
  final String avatarUrl;
  final String name;
  final String message;
  final String time;
  final int unreadCount;

  const ChatTile({super.key, 
    required this.avatarUrl,
    required this.name,
    required this.message,
    required this.time,
    required this.unreadCount,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChatDetailPage(
              name: name,
              avatarUrl: avatarUrl,
            ),
          ),
        );
      },
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(avatarUrl),
        ),
        title: Text(name),
        subtitle: Text(message),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(time),
            if (unreadCount > 0)
              Container(
                margin: const EdgeInsets.only(top: 4),
                padding: const EdgeInsets.all(4), // Decrease padding
                decoration: const BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                ),
                child: Text(
                  unreadCount.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 10, // Decrease font size
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
