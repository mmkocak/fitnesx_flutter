import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';

/// Containers in the 2nd [Row] widget located just below the [Row] widget at the top of the [ProfileScreen]

class CustomProfileContainerWidget extends StatelessWidget {
  final String text;
  final String property;
  const CustomProfileContainerWidget({Key? key,   required this.text , required this.property}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Container(
      width: screenWidth * 0.22,
      height: screenHeight * 0.07,
      decoration: BoxDecoration(
          color: AppColors.whiteColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 5,
              spreadRadius: 2,
              offset: Offset(0, 3),
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ShaderMask(
            shaderCallback: (Rect bounds) {
              return LinearGradient(colors: <Color>[
                AppColors.brandColorsOne,
                AppColors.brandColorTwo
              ], begin: Alignment.topLeft, end: Alignment.bottomRight)
                  .createShader(bounds);
            },
            child: Text(
              text,
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: screenWidth * 0.035,
                  fontWeight: FontWeight.w700,
                  color: AppColors.whiteColor),
            ),
          ),
          SizedBox(
            height: screenHeight * 0.01,
          ),
          Text(
            property,
            style: TextStyle(
                fontFamily: "Poppins",
                fontSize: screenWidth * 0.03,
                color: AppColors.gray_1),
          )
        ],
      ),
    );
  }
}
