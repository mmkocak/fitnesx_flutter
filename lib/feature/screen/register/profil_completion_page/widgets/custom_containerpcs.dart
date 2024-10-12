import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';

class CustomContainerpcs extends StatelessWidget {
  final double width;
  final double height;
  final String text;
  final double fontSize;
  const CustomContainerpcs(
      {Key? key,
      required this.height,
      required this.width,
      required this.text,
      required this.fontSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        gradient: const LinearGradient(
            colors: <Color>[AppColors.purple_2, AppColors.purple_1],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
              fontFamily: "Poppins",
              fontWeight: FontWeight.bold,
              fontSize: fontSize, color: AppColors.whiteColor),
        ),
      ),
    );
  }
}
