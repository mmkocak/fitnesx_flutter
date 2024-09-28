import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';

class ProfileCompletionPage extends StatelessWidget {
  const ProfileCompletionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String imageName = "assets/images/register1.png";
    final double screenHeight = MediaQuery.sizeOf(context).height;
    final double screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.01, vertical: screenHeight * 0.01),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(imageName),
            SizedBox(
              height: screenHeight * 0.04,
            ),
            Text(
              "Let's complate your profile",
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: screenWidth * 0.05,
                  fontWeight: FontWeight.bold,
                  color: AppColors.blackColor),
            ),
            SizedBox(height: screenHeight * 0.01,),
            Text(
              "it will help us to know more about you!",
              style: TextStyle(
                  color: AppColors.gray_1,
                  fontFamily: "Poppins",
                  fontSize: screenWidth * 0.03),
            )
          ],
        ),
      ),
    );
  }
}
