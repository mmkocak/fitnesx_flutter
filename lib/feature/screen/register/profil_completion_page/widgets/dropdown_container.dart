import 'package:fitnesx_flutter/feature/screen/register/profil_completion_page/cubit/gender_cubit.dart';
import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';
import 'package:fitnesx_flutter/fitnestx_icons.dart';

class DropdownDontainerWidget extends StatelessWidget {
  const DropdownDontainerWidget({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth * 0.85,
      child: DropdownButtonFormField(
        dropdownColor: AppColors.borderColor,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Fitnestx.user_2,
            color: AppColors.gray_1,
            size: screenWidth * 0.06,
          ),
          hintText: null,
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
        value: context.watch<GenderCubit>().state,
        items: ['Kadın ', 'Erkek']
            .map((String gender) => DropdownMenuItem(
                  child: Text(
                    gender,
                    style: TextStyle(fontFamily: "Poppins"),
                  ),
                  value: gender,
                ))
            .toList(),
        onChanged: (String? gender) {
          context.read<GenderCubit>().selectGender(gender!);
        },
        hint: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Choose Gender",
            style: TextStyle(
                color: AppColors.gray_1,
                fontFamily: "Poppins",
                fontSize: screenWidth * 0.03),
          ),
        ),
      ),
    );
  }
}
