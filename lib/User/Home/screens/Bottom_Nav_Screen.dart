import 'package:eternal_tie/User/Home/screens/home_screen.dart';
import 'package:eternal_tie/User/Ideas/screens/Ideas_Screen.dart';
import 'package:eternal_tie/User/Profile/screens/Profile_Screen.dart';
import 'package:eternal_tie/User/Vendors/screens/Vendor_Screen.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  static const String routename = '/nav';
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int index = 0;
  List<Widget> screens = [
    const HomeScreen(),
    const VendorScreen(),
    const IdeasScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        unselectedItemColor: Colors.black,
        selectedItemColor: Colors.red,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop),
            label: 'Vendors',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Ideas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          )
        ],
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
      ),
    );
  }
}
