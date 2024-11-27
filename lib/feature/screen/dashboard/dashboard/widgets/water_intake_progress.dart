import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';

class WaterIntakeProgress extends StatelessWidget {
  const WaterIntakeProgress({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    double screenHeight = MediaQuery.sizeOf(context).height;
    return Container(
      height: screenHeight * 0.4,
      width: screenWidth * 0.04,
      decoration: BoxDecoration(
        color: AppColors.borderColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
             
              height: screenHeight * 0.3,
              width: screenWidth * 0.04,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                gradient: LinearGradient(
                  colors: <Color>[AppColors.brandColorTwo, AppColors.brandColorsOne],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
