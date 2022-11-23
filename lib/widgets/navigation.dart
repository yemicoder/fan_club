import 'package:fan_club/screens/buddies_screen.dart';
import 'package:fan_club/screens/profile_screen.dart';
import 'package:fan_club/screens/signup_screen.dart';
import 'package:flutter/material.dart';

import '../screens/discover_screen.dart';
import '../screens/home_screen.dart';
import '../screens/login_screen.dart';
import '../screens/settings_screen.dart';

class Navigation extends StatefulWidget {
  const Navigation({Key? key}) : super(key: key);

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int _selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    List<Widget> _pages = [
      const HomeScreen(),
      const ProfileScreen(),
      const DiscoverScreen(),
      const BuddiesScreen(),
      const SettingsScreen(),
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.black54,
        unselectedFontSize: 12,
        selectedFontSize: 12,
        currentIndex: _selectedItem,
        onTap: (index) {
          setState(() {
            _selectedItem = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_baseball),
            label: 'Discover',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.people), label: 'Buddies'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
      body: SafeArea(
        child: _pages[_selectedItem],
      ),
    );
  }
}
