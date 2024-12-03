import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';

class WaterIntakeCard extends StatelessWidget {
  const WaterIntakeCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    double screenHeight = MediaQuery.sizeOf(context).height;
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: AppColors.whiteColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 5,
              spreadRadius: 2,
              offset: Offset(0, 3),
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(flex: 2, child: WaterIntakeProgress()),
              Expanded(
                  flex: 8,
                  child: Column(
                    children: [
                      Text(
                        "Water Intake",
                        style: TextStyle(
                            color: AppColors.blackColor,
                            fontFamily: "Poppins",
                            fontWeight: FontWeight.w600,
                            fontSize: screenWidth * 0.04),
                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return LinearGradient(
                            colors: <Color>[
                              AppColors.brandColorsOne,
                              AppColors.brandColorTwo
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ).createShader(bounds);
                        },
                        child: Text(
                          "4 Liters",
                          style: TextStyle(
                            fontFamily: "Poppins",
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.w600,
                            fontSize: screenWidth * 0.04,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.02,
                      ),
                      Text(
                        "Real Time Updates",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            color: AppColors.gray_1,
                            fontSize: screenWidth * 0.03),
                      ),
                      SizedBox(
                        height: screenHeight * 0.01,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: screenWidth * 0.03,
                          ),
                          Expanded(child: TimeUpdates())
                        ],
                      ),
                    ],
                  ))
            ],
          ),
        ],
      ),
    );
  }
}
