import '../common/common_imports.dart';

class CustomTextfield extends StatelessWidget {
  String hinText;
  CustomTextfield({super.key, required this.hinText});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;
    return TextFormField(
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.borderColor,
        hintText: hinText,
        hintStyle: TextStyle(
          color: AppColors.gray_2,
          fontSize: screenWidth * 0.03,
          fontFamily: "Poppins",
          fontStyle: FontStyle.normal,
        ),
        prefixIcon: Icon(Icons.person_outline,
            color: AppColors.gray_1, size: screenWidth * 0.06),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(screenWidth * 0.04),
          borderSide: BorderSide(
            color: AppColors.borderColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(screenWidth * 0.04),
          borderSide: BorderSide(
            color: AppColors.borderColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(screenWidth * 0.04),
          borderSide: BorderSide(
            color: AppColors.borderColor,
          ),
        ),
      ),
    );
  }
}
