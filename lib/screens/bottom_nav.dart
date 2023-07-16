import 'package:flutter/material.dart';

import 'bottom_nav_screens/favorite_page.dart';
import 'bottom_nav_screens/profile_page.dart';
import 'bottom_nav_screens/settings_page.dart';
import 'bottom_nav_screens/user_page.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  int _selectedIndex = 0;

  void _navigateBar (int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  final List <Widget> _pages = [
    const UserPage(),
    const FavoritePage(),
    const ProfilePage(),
    const SettingsPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
            currentIndex: _selectedIndex,
            elevation: 0,
            backgroundColor: const Color(0xFFF2F2F2),
            showUnselectedLabels: false,
            showSelectedLabels: false,
            onTap: _navigateBar,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite_border_outlined), label: 'Favorite'),
              BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings_backup_restore), label: 'Settings'),
            ]),
      ),
    );
  }
}
