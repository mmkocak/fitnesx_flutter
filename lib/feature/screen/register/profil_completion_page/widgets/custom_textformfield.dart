import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';

class CustomTextformfield extends StatelessWidget {
  final String hinText;
  final Widget icon;
  final double size;
  const CustomTextformfield({Key? key, required this.hinText, required this.icon , required this.size}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hinText,
        hintStyle: TextStyle(
          color: AppColors.gray_1,
          fontFamily: "Poppins",
          fontSize: size ,
        ),
        prefixIcon: icon,
        prefixIconColor: AppColors.gray_1,
        fillColor: AppColors.borderColor,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide:  const BorderSide(
            color: AppColors.borderColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const  BorderSide(
            color: AppColors.borderColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: AppColors.borderColor,
          ),
        ),
      ),
    );
  }
}
