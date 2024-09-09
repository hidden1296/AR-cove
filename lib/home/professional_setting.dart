import 'package:flutter/material.dart';

class ProfessionalSettingPage extends StatelessWidget {
  const ProfessionalSettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Professional Settings'),
      ),
      body: ListView(
        children: const [
          UserHeader(),
          MenuItem(icon: Icons.business, text: 'Join ARcove Pro'),
          MenuItem(icon: Icons.account_balance_wallet, text: 'ARcove Trade Program'),
          MenuItem(icon: Icons.add, text: 'Add Project'),
          MenuItem(icon: Icons.folder, text: 'Your Projects', trailingText: '0'),
          MenuItem(icon: Icons.favorite, text: 'Ideabooks'),
          MenuItem(icon: Icons.chat, text: 'Advice & Stories'),
          MenuItem(icon: Icons.shopping_basket, text: 'Your Orders'),
          MenuItem(icon: Icons.person_add, text: 'Following', trailingText: '0'),
          MenuItem(icon: Icons.group, text: 'Followers', trailingText: '0'),
          MenuItem(icon: Icons.update, text: 'Your Updates'),
          MenuItem(icon: Icons.show_chart, text: 'Activity'),
          Divider(),
          MenuItem(icon: Icons.settings, text: 'Settings'),
          MenuItem(icon: Icons.notifications, text: 'Notifications'),
          MenuItem(icon: Icons.help, text: 'Help & Support'),
          MenuItem(icon: Icons.info, text: 'About'),
          MenuItem(icon: Icons.logout, text: 'Logout'),
        ],
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
              const Text('Professional Name', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
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
