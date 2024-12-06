import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';
import 'package:flutter/cupertino.dart';

class TodayTargetContainerWidget extends StatelessWidget {
  const TodayTargetContainerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth * 0.9,
      height: screenHeight * 0.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        gradient: LinearGradient(colors: <Color>[
          AppColors.brandColorsOne.withOpacity(0.3),
          AppColors.brandColorTwo.withOpacity(0.3)
        ], begin: Alignment.topLeft, end: Alignment.bottomRight),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: screenWidth * 0.05, top: screenHeight * 0.02),
                child: Text(
                  "Today Target",
                  style: TextStyle(
                      color: AppColors.blackColor,
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w600,
                      fontSize: screenWidth * 0.04),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                    right: screenWidth * 0.05, top: screenHeight * 0.02),
                child: Container(
                  width: screenWidth * 0.08,
                  height: screenHeight * 0.03,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    gradient: LinearGradient(colors: <Color>[
                      AppColors.brandColorsOne,
                      AppColors.brandColorTwo
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                  ),
                  child: Center(
                    child: Icon(
                      CupertinoIcons.plus,
                      color: Colors.white,
                      size: screenWidth * 0.04,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: screenHeight * 0.03,
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.06),
                  child: Container(
                    width: screenWidth * 0.01,
                    height: screenHeight * 0.09,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.whiteColor,
                    ),
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Row(children: [
                          Expanded(
                            flex: 2,
                            child: SizedBox(
                              width: screenWidth * 0.01,
                              height: screenHeight * 0.05,
                              child: Image(
                                image: AssetImage("assets/images/glass 1.png"),
                              ),
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.04 ,),
                          Expanded(
                            flex: 8,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ShaderMask(
                                  shaderCallback: (bounds) => LinearGradient(
                                          colors: <Color>[
                                        AppColors.brandColorsOne,
                                        AppColors.brandColorTwo
                                      ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight)
                                      .createShader(bounds),
                                  child: Text(
                                    "8L",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.bold,
                                        fontSize: screenWidth * 0.04),
                                  ),
                                ),
                                Text(
                                  "Water Intake",
                                  style: TextStyle(
                                      color: AppColors.gray_1,
                                      fontFamily: "Poppins",
                                      fontSize: screenWidth * 0.03),
                                ),
                              ],
                            ),
                          ),
                        ])
                      ]),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: screenWidth * 0.04,
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(right: screenWidth * 0.06),
                  child: Container(
                    width: screenWidth * 0.01,
                    height: screenHeight * 0.09,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: AppColors.whiteColor,
                    ),
                    child: Padding(
                      padding:  EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Row(children: [
                          Expanded(
                            flex: 2,
                            child: SizedBox(
                              width: screenWidth * 0.1,
                              height: screenHeight * 0.06,
                              child: Image(
                                image: AssetImage("assets/images/boots 1.png"),
                              ),
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.04 ,),
                          Expanded(
                            flex: 8,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ShaderMask(
                                  shaderCallback: (bounds) => LinearGradient(
                                          colors: <Color>[
                                        AppColors.brandColorsOne,
                                        AppColors.brandColorTwo
                                      ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight)
                                      .createShader(bounds),
                                  child: Text(
                                    "2400",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Poppins",
                                        fontWeight: FontWeight.bold,
                                        fontSize: screenWidth * 0.04),
                                  ),
                                ),
                                Text(
                                  "Food Steps",
                                  style: TextStyle(
                                      color: AppColors.gray_1,
                                      fontFamily: "Poppins",
                                      fontSize: screenWidth * 0.03),
                                ),
                              ],
                            ),
                          ),
                        ])
                      ]),
                    ),
                  ),
                ),
                  
                
              ),
            ],
          ),
        ],
      ),
    );
  }
}
