import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';

class PrivacyPolicyChackbox extends StatelessWidget {
  const PrivacyPolicyChackbox({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: EdgeInsets.all(screenWidth * 0.01),
      child: Row(
        children: [
          BlocBuilder<PrivacyPolicyCubit, bool>(
            builder: (context, state) {
              return Checkbox(
                value: state,
                onChanged: (bool? value) {
                  context.read<PrivacyPolicyCubit>().toggleCheckbox();
                },
              );
            },
          ),
          Expanded(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "By continuing you accept our ",
                    style: TextStyle(
                        fontFamily: "Poppins", color: AppColors.gray_2, fontSize: screenWidth * 0.026),
                  ),
                  
                  TextSpan(
                    text: "Privacy Policy ",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        color: AppColors.gray_2,
                        decoration: TextDecoration.underline,  fontSize: screenWidth * 0.026),
                  ),
                  TextSpan(
                    text: "and ",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        color: AppColors.gray_2,
                        fontSize: screenWidth * 0.026),
                  ),
                   TextSpan(
                    text: "Term of use ",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        color: AppColors.gray_2,
                        decoration: TextDecoration.underline,
                        fontSize: screenWidth * 0.026),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
