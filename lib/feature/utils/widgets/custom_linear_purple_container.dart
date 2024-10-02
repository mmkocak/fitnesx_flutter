import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';

class CustomLinearPurpleContainer extends StatelessWidget {
  const CustomLinearPurpleContainer({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
    required this.text,
  });
  final String text;
  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth * 0.01,
      height: screenHeight * 0.06,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
            colors: <Color>[
              AppColors.purple_2,
              AppColors.purple_1,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white,
              fontSize: screenWidth * 0.04, fontFamily: "Poppins", fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}