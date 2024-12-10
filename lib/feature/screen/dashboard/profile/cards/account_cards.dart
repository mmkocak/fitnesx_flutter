import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';
import 'package:fitnesx_flutter/profile_screen_icon_icons.dart';

/// Account cart in [ProfileScreen]
class AccountCards extends StatelessWidget {
  const AccountCards({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
        child: Container(
          width: screenWidth * 0.9,
          height: screenHeight * 0.2,
          decoration: BoxDecoration(
            color: AppColors.whiteColor,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 5,
                spreadRadius: 2,
                offset: Offset(0, 3),
              ),
            ],
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: screenWidth * 0.04, top: screenHeight * 0.02),
                child: Text(
                  "Account",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.w700),
                ),
              ),
              AccountListItem(
                icon: ProfileScreenIcon.profile,
                title: "Personal Data",
              ),
              AccountListItem(
                icon: ProfileScreenIcon.document,
                title: "Achievement",
              ),
              AccountListItem(
                icon: ProfileScreenIcon.graph,
                title: "Activity History",
              ),
              AccountListItem(
                icon: ProfileScreenIcon.chart,
                title: "Workout Progress",
              ),
            ],
          ),

        ),
      ),
    );
  }
}

class AccountListItem extends StatelessWidget {
  final IconData icon;
  final String title;

  const AccountListItem({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(vertical: 6.0, horizontal: 20), // Elemanlar arası boşluk
      child: Row(
        children: [
          ShaderMask(
            shaderCallback: (Rect bounds) {
              return LinearGradient(
                colors: <Color>[
                  AppColors.brandColorTwo,
                  AppColors.brandColorsOne
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ).createShader(bounds);
            },
            child: Icon(
              icon,
              color: Colors.white,
              size: 24,

            ),
          ),
          SizedBox(width: 16),

          Expanded(
            child: Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: AppColors.gray_1,
              ),
            ),
          ),
          // Sağdaki ok
          Icon(
            Icons.chevron_right,
            color: AppColors.gray_1,
          ),
        ],
      ),
    );
  }
}
