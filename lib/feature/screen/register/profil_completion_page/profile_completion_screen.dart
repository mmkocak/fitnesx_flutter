import 'package:fitnesx_flutter/feature/screen/register/profil_completion_page/cubit/date_cubit.dart';
import 'package:fitnesx_flutter/feature/screen/register/profil_completion_page/cubit/gender_cubit.dart';
import 'package:fitnesx_flutter/feature/screen/register/profil_completion_page/mixin/date_mixin.dart';
import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';
import 'package:fitnesx_flutter/fitnestx_icons.dart';

class ProfileCompletionScreen extends StatelessWidget with DateTimePicker {
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
              child: Column(
                children: [
                  BlocBuilder<GenderCubit, String?>(
                    builder: (context, state) {
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
                          hint: const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Choose Gender",
                              style: TextStyle(
                                  color: AppColors.gray_1,
                                  fontFamily: "Poppins"),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: screenHeight * 0.03,
                  ),
                  GestureDetector(
                    onTap: () => selectDate(context),
                    child: Container(
                      height: screenHeight * 0.05,
                      width: screenWidth * 0.85,
                      decoration: BoxDecoration(
                        color: AppColors.borderColor,
                        border: Border.all(color: AppColors.borderColor),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: screenWidth * 0.02),
                          Icon(
                            Fitnestx.calendars,
                            color: AppColors.gray_1,
                            size: screenWidth * 0.07,
                          ),
                          SizedBox(
                            width: screenWidth * 0.03,
                          ),
                          BlocBuilder<DateCubit, DateTime?>(
                            builder: (context, selectedDate) {
                              return Expanded(
                                child: Text(
                                  selectedDate == null
                                      ? "Date of brith"
                                      : "${selectedDate.toLocal()}"
                                          .split(' ')[0],
                                  style: TextStyle(
                                      fontFamily: "Poppins",
                                      color: selectedDate == null
                                          ? AppColors.gray_1
                                          : AppColors.blackColor),
                                ),
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
