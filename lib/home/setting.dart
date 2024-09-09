import 'package:flutter/material.dart';

import '../navbar/bottom_nav_bar.dart';


class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  int _selectedIndex = 4; // Default index for Settings page

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: const [
          UserHeader(),
          MenuItem(icon: Icons.person, text: 'Account'),
          MenuItem(icon: Icons.notifications, text: 'Notifications'),
          MenuItem(icon: Icons.security, text: 'Privacy'),
          MenuItem(icon: Icons.lock, text: 'Password'),
          MenuItem(icon: Icons.language, text: 'Language'),
          MenuItem(icon: Icons.help, text: 'Help & Support'),
          MenuItem(icon: Icons.info, text: 'About'),
          MenuItem(icon: Icons.logout, text: 'Logout'),
        ],
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}

class UserHeader extends StatelessWidget {
  const UserHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage('https://via.placeholder.com/150'),
          ),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('User Name', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              GestureDetector(
                onTap: () {
                  // Handle profile edit action
                },
                child: const Row(
                  children: [
                    Icon(Icons.edit, size: 16, color: Colors.blue),
                    SizedBox(width: 4),
                    Text('Edit Profile', style: TextStyle(color: Colors.blue)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final String? trailingText;

  const MenuItem({super.key, required this.icon, required this.text, this.trailingText});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(text),
      trailing: trailingText != null ? Text(trailingText!) : null,
      onTap: () {
        // Handle menu item tap
      },
    );
  }
}
