import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';

class SleepCard extends StatelessWidget {
  const SleepCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    double screenHeight = MediaQuery.sizeOf(context).height;
    const String sleepGraph = "assets/images/Sleep-Graph.png";
    return Container(
      height: screenHeight * 0.21,
      width: screenWidth * 0.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: AppColors.whiteColor,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
            spreadRadius: 2,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Padding(
        padding:  EdgeInsets.only(top: screenHeight * 0.03, left: screenWidth * 0.03, right: screenWidth * 0.03,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Sleep",
              style: TextStyle(
                  fontFamily: "Poppins",
                  color: AppColors.blackColor,
                  fontSize: screenWidth * 0.04,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            ShaderMask(
              shaderCallback: (Rect bounds) {
                return LinearGradient(colors: <Color>[
                  AppColors.brandColorsOne,
                  AppColors.brandColorTwo
                ], begin: Alignment.topLeft, end: Alignment.bottomRight)
                    .createShader(bounds);
              },
              child: Text(
                "8h 20m",
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontFamily: "Poppins",
                  fontSize: screenWidth * 0.04,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            Image(
              width: screenWidth * 0.4,
              height: screenHeight * 0.1,
              image: AssetImage(sleepGraph),
            ),
          ],
        ),
      ),
    );
  }
}
