import 'package:fitnesx_flutter/feature/screen/register/profil_completion_page/cubit/gender_cubit.dart';
import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';
import 'package:fitnesx_flutter/fitnestx_icons.dart';

class ProfileCompletionScreen extends StatelessWidget {
  const ProfileCompletionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    double screenHeight = MediaQuery.sizeOf(context).height;
    const String image = "assets/images/register1.png";
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.02, vertical: screenHeight * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage(image),
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            Text(
              "Let’s complete your profile",
              style: TextStyle(
                fontFamily: "Poppins",
                fontSize: screenWidth * 0.05,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            Text(
              "It will help us to know more about you!",
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: screenWidth * 0.03,
                  color: AppColors.gray_1),
            ),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            Form(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                child: BlocBuilder<GenderCubit, String?>(
                  builder: (context, state) {
                    return Container(
                      width: screenWidth * 0.9,
                      child: DropdownButtonFormField(
                        decoration: InputDecoration(
                          prefixIcon: const Icon(
                            Fitnestx.user_2,
                            color: AppColors.gray_1,
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
                            borderSide: BorderSide(
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
                                color: AppColors.gray_1, fontFamily: "Poppins"),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
