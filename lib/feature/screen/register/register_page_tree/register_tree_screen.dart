import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';

class RegisterTreeScreen extends StatelessWidget {
  const RegisterTreeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    double screenHeight = MediaQuery.sizeOf(context).height;
    const String image = "assets/images/register2.png";
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: screenHeight * 0.08),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "What is your goal? ",
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: screenWidth * 0.06,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            Text(
              textAlign: TextAlign.center,
              "It will help us to choose a best\n program for you ",
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: screenWidth * 0.03,
                  color: AppColors.gray_1),
            ),
            SizedBox(
              height: screenHeight * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(22),
                      bottomRight: Radius.circular(22),
                    ),
                    gradient: LinearGradient(
                      colors: <Color>[
                        AppColors.brandColorTwo,
                        AppColors.brandColorsOne,
                      ],
                      begin: Alignment.topRight,
                      end: Alignment.bottomRight,
                      stops: [1.0, 0.0],
                    ),
                  ),
                  width: screenWidth * 0.06,
                  height: screenHeight * 0.5,
                ),
                Container(
                  width: screenWidth * 0.78,
                  height: screenHeight * 0.6,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    gradient: const LinearGradient(
                      colors: <Color>[
                        AppColors.brandColorsOne,
                        AppColors.brandColorTwo,
                      ],
                      begin: Alignment.topRight,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: screenHeight * 0.05,
                      ),
                      Image(
                        image: AssetImage(image),
                        width: screenWidth * 0.5,
                      ),
                      SizedBox(
                        height: screenHeight * 0.03,
                      ),
                      Text(
                        "Improve Shape",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: screenWidth * 0.04,
                            fontWeight: FontWeight.bold,
                            color: AppColors.whiteColor),
                      ),
                      Divider(color: AppColors.whiteColor, height: screenHeight * 0.02, thickness: screenHeight * 0.002, indent: screenWidth * 0.32, endIndent: screenWidth * 0.32,),
                    ],
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(22),
                      bottomLeft: Radius.circular(22),
                    ),
                    gradient: LinearGradient(
                      colors: <Color>[
                        AppColors.brandColorTwo,
                        AppColors.brandColorsOne,
                      ],
                      begin: Alignment.topRight,
                      end: Alignment.bottomRight,
                      stops: [1.0, 0.0],
                    ),
                  ),
                  width: screenWidth * 0.06,
                  height: screenHeight * 0.5,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
