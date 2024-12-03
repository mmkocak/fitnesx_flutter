import 'package:fitnesx_flutter/bottom_navigation_icons.dart';
import 'package:fitnesx_flutter/feature/screen/dashboard/dashboard/dashboard_screen.dart';
import 'package:fitnesx_flutter/feature/utils/theme/colors.dart';
import 'package:flutter/material.dart';

class RouterScreen extends StatefulWidget {
  @override
  _RouterScreenState createState() => _RouterScreenState();
}

class _RouterScreenState extends State<RouterScreen> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    DashboardScreen(),
    Container(),
    Container(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _pages[_currentIndex],
      bottomNavigationBar: SizedBox(
        height: 80,
        child: BottomNavigationBar(
          showSelectedLabels: false,
          showUnselectedLabels: false,
          backgroundColor: Colors.white,
          
          type: BottomNavigationBarType.fixed,
          selectedItemColor: const Color(0xFF7165D6),
          unselectedItemColor: Colors.black26,
          selectedLabelStyle:
              const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: _buildGradientIcon(BottomNavigation.home, 0),
              label: "Home"
            ),
            BottomNavigationBarItem(
              icon: _buildGradientIcon(BottomNavigation.activity,1),
               label: "Activity"
            ),
            BottomNavigationBarItem(
              icon: _buildGradientIcon(BottomNavigation.camera ,2),
               label: "Camera"
            ),
            BottomNavigationBarItem(
              icon: _buildGradientIcon(BottomNavigation.profile,3),
               label: "Profile"
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGradientIcon(IconData icon, int index) {
    bool isSelected = _currentIndex == index;

    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          colors: isSelected
              ? [AppColors.purple_1, AppColors.purple_2]
              : [AppColors.blackColor, AppColors.blackColor],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ).createShader(bounds);
      },
      child: Icon(
        icon,
        size: 28, 
      ),
    );
  }
}
