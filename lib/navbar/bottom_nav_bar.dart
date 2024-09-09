import 'package:flutter/material.dart';
import '../features/Trending/trending.dart';
import '../home/home.dart';
import '../home/setting.dart'; // Import your SettingsPage here
import '../home/message_consultation.dart';
class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;

  const BottomNavBar({super.key, required this.currentIndex, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          onTap(index);

          // Navigate to the corresponding page when an icon is clicked
          if (index == 0) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()), // Navigate to HomePage
            );
          }else if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TrendingPage()), // Navigate to TrendingPage
            );
          } /*else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ARPage()), // Navigate to ARPage
            );
          } */else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const consult()), // Navigate to ChatConsultationPage
            );
          } else if (index == 4) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const SettingPage()), // Navigate to SettingsPage
            );
          }
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.transparent,
        elevation: 0,
        showUnselectedLabels: true,
        showSelectedLabels: true,
        selectedItemColor: const Color(0xFFB46146),
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(color: Color(0xFFB46146)),
        unselectedLabelStyle: const TextStyle(color: Colors.grey),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.home, 0),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.whatshot, 1),
            label: 'Trending',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.view_in_ar, 2),
            label: 'AR',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.message_outlined, 3),
            label: 'Consult',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(Icons.settings, 4),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  Widget _buildIcon(IconData icon, int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      margin: EdgeInsets.only(top: currentIndex == index ? 0 : 10),
      child: Icon(
        icon,
        size: currentIndex == index ? 30 : 24,
        color: currentIndex == index ? const Color(0xFFB46146) : Colors.grey,
      ),
    );
  }
}
