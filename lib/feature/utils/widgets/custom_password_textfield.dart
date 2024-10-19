import 'package:fitnesx_flutter/core/bloc/passowrd_visibility.dart/password_visibility_bloc.dart';
import 'package:fitnesx_flutter/core/bloc/passowrd_visibility.dart/password_visibility_event.dart';
import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';

class CustomPasswordTextfield extends StatelessWidget {
  final String hinText;
  final Widget icon;
  final double size;
  final TextEditingController controller;
  const CustomPasswordTextfield(
      {Key? key,
      required this.hinText,
      required this.icon,
      required this.size,
      required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PasswordVisibilityBloc, bool>(
      builder: (context, abscureText) {
        return TextFormField(
          
          obscureText: abscureText,
          controller: controller,
          decoration: InputDecoration(
            suffixIcon: IconButton(
             
              onPressed: () {
                context
                    .read<PasswordVisibilityBloc>()
                    .add(TogglePasswordVisibility());
              },
              icon: Icon(abscureText ? Icons.visibility_off : Icons.visibility),
            ),
            hintText: hinText,
            hintStyle: TextStyle(
              color: AppColors.gray_1,
              fontFamily: "Poppins",
              fontSize: size,
            ),
            prefixIcon: icon,
            prefixIconColor: AppColors.gray_1,
            fillColor: AppColors.borderColor,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
                color: AppColors.borderColor,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(
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
      },
    );
  }
}
