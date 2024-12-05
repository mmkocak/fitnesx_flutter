import 'package:fitnesx_flutter/core/cubit/go_back_cubit.dart';
import 'package:fitnesx_flutter/feature/screen/dashboard/activity/activity_screen.dart';
import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';

class RouterScreen extends StatefulWidget {
  @override
  _RouterScreenState createState() => _RouterScreenState();
}

class _RouterScreenState extends State<RouterScreen> {

  final List<Widget> _pages = [
    DashboardScreen(),
    ActivityScreen(),
    Container(),
    Container(),
  ];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: BlocBuilder<NavigationCubit, int>(
        builder: (context, currentIndex) {
          return _pages[currentIndex];
        },
      ),
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        children: [
          // BottomNavigationBar
          BottomNavigationBar(
            showSelectedLabels: false,
            showUnselectedLabels: false,
            currentIndex: context.watch<NavigationCubit>().state,
            onTap: (index) {
              context.read<NavigationCubit>().changeIndex(index);
            },
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.purple,
            unselectedItemColor: AppColors.gray_2,
            items: [
              BottomNavigationBarItem(
                icon: _buildGradientIcon(BottomNavigation.home, 0),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(right: screenWidth * 0.0),
                  child: _buildGradientIcon(BottomNavigation.activity, 1),
                ),
                label: "Activity",
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.0),
                  child: _buildGradientIcon(BottomNavigation.camera, 2),
                ),
                label: "Camera",
              ),
              BottomNavigationBarItem(
                icon: _buildGradientIcon(BottomNavigation.profile, 3),
                label: "Profile",
              ),
            ],
          ),

          Positioned(
            bottom: 30, // Adjusted bottom position to avoid overlapping
            left: screenWidth / 2 - 35, // Center it horizontally
            child: GestureDetector(
              onTap: () {
                print("Search button pressed!");
              },
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: <Color>[
                    AppColors.brandColorTwo,
                    AppColors.brandColorsOne
                  ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Icon(
                  BottomNavigation.search,
                  color: Colors.white,
                  size: 28,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGradientIcon(IconData icon, int index) {
    bool isSelected = context.watch<NavigationCubit>().state  == index;

    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (Rect bounds) {
        return LinearGradient(
          colors: isSelected
              ? [AppColors.purple_1, AppColors.purple_2]
              : [AppColors.gray_2, AppColors.gray_2],
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
