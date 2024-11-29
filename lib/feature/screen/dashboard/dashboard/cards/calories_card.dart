import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';

class CaloriesCard extends StatelessWidget {
  const CaloriesCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    double screenHeight = MediaQuery.sizeOf(context).height;
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
        padding: EdgeInsets.only(
          top: screenHeight * 0.03,
          left: screenWidth * 0.03,
          right: screenWidth * 0.03,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Calories",
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
                "760 Kcal",
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
            Expanded(
              child: Padding(
                padding:  EdgeInsets.only(bottom: screenHeight * 0.01),
                child: Center(
                  child: Container(
                    padding: EdgeInsets.all(6),
                    width: screenWidth * 0.22,
                    height: screenHeight * 0.22,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: <Color>[
                            AppColors.brandColorTwo,
                            AppColors.brandColorsOne,
                            AppColors.borderColor,
                            AppColors.borderColor,
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          stops: [0.50, 0.25, 0.0, 0.25],
                        ),
                        border:
                            Border.all(color: Colors.transparent, width: 0.1)),
                    child: Container(
                      width: screenWidth * 0.14,
                      height: screenHeight * 0.14,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, color: AppColors.whiteColor),
                      child: Center(
                        child: Container(
                          width: screenWidth * 0.17,
                          height: screenHeight * 0.17,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(
                              colors: <Color>[
                                AppColors.brandColorsOne,
                                AppColors.brandColorTwo
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              textAlign: TextAlign.center,
                              "230 Kcal\n Left",
                              style: TextStyle(fontFamily: "Poppins", color: AppColors.whiteColor, fontSize: screenWidth * 0.03),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
