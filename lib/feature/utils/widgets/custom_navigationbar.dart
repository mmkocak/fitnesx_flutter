import 'package:fitnesx_flutter/feature/screen/dashboard/dashboard/dashboard_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CustomNavigationbar extends StatefulWidget {
  const CustomNavigationbar({super.key});

  @override
  State<CustomNavigationbar> createState() => _NavbarRootsState();
}

class _NavbarRootsState extends State<CustomNavigationbar> {
  int _selectedindex = 0;
  final _screens = [
    // Home Screen
    DashboardScreen(),
    // Messages Screen
    DashboardScreen(),
    // Schedule Screen
  Container(),
    // Settings Screen
    Container(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _screens[_selectedindex],
      bottomNavigationBar: SizedBox(
        height: 80,
        child: BottomNavigationBar(
          backgroundColor: Colors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color(0xFF7165D6),
          unselectedItemColor: Colors.black26,
          selectedLabelStyle:
              const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          currentIndex: _selectedindex,
          onTap: (index) {
            setState(() {
              _selectedindex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_filled), label: "Anasayfa"),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.chat_bubble_text_fill),
                label: "Mesajlar"),
            BottomNavigationBarItem(
                icon: Icon(Icons.calendar_month), label: "Takvim"),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: "Ayarlar"),
          ],
        ),
      ),
    );
  }
}