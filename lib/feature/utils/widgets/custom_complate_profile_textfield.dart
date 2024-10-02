/* 

This page is the text field where the height and kilogram measurements used on the +++ complete your profile +++ page are written.
 */
import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';

class CustomComplateProfileTextField extends StatelessWidget {
  const CustomComplateProfileTextField({
    super.key,
    required this.screenWidth,
    required this.hinText,
  });

  final double screenWidth;
  final String hinText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
          contentPadding:
              EdgeInsets.all(screenWidth * 0.04),
          filled: true,
          fillColor: AppColors.borderColor,
          hintText: hinText,
          hintStyle: TextStyle(
            color: AppColors.gray_2,
            fontSize: screenWidth * 0.03,
            fontFamily: "Poppins",
            fontStyle: FontStyle.normal,
          ),
          prefixIcon:
              const Icon(Icons.width_wide_outlined),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                  screenWidth * 0.04),
              borderSide: BorderSide(
                color: AppColors.borderColor,
              )),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
                screenWidth * 0.04),
            borderSide: BorderSide(
                color: AppColors.borderColor),
          ),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(
                  screenWidth * 0.04),
              borderSide: BorderSide(
                color: AppColors.borderColor,
              ))),
    );
  }
}