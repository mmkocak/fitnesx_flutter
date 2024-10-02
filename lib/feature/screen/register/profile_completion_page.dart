import 'package:fitnesx_flutter/feature/utils/bloc/gender_bloc.dart';
import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';
import 'package:fitnesx_flutter/feature/utils/widgets/custom_complate_profile_textfield.dart';
import 'package:fitnesx_flutter/feature/utils/widgets/custom_linear_purple_container.dart';
import 'package:flutter/cupertino.dart';

class ProfileCompletionPage extends StatelessWidget {
  const ProfileCompletionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String imageName = "assets/images/register1.png";
    final double screenHeight = MediaQuery.sizeOf(context).height;
    final double screenWidth = MediaQuery.sizeOf(context).width;
    DateTime selectedDate = DateTime.now();

    Future<void> _selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
      );
      if (picked != null && picked != selectedDate) {
        selectedDate = picked;
      }
    }

    return BlocProvider(
      create: (context) => GenderBloc(),
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.01, vertical: screenHeight * 0.01),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(imageName),
              SizedBox(
                height: screenHeight * 0.04,
              ),
              Text(
                "Let's complate your profile",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: screenWidth * 0.05,
                    fontWeight: FontWeight.bold,
                    color: AppColors.blackColor),
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              Text(
                "it will help us to know more about you!",
                style: TextStyle(
                    color: AppColors.gray_1,
                    fontFamily: "Poppins",
                    fontSize: screenWidth * 0.03),
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              Form(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                  child: Column(
                    children: [
                      BlocBuilder<GenderBloc, String?>(
                        builder: (context, selectedGdender) {
                          return Container(
                            width: screenWidth * 0.9,
                            child: DropdownButtonFormField(
                              menuMaxHeight: screenHeight * 0.1,
                              isExpanded: false,
                              dropdownColor: AppColors.borderColor,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(
                                  Icons.supervised_user_circle,
                                  color: AppColors.gray_1,
                                ),
                                hintText: "Choose Gender",
                                hintStyle: TextStyle(
                                  color: AppColors.gray_2,
                                  fontFamily: "Poppins",
                                  fontSize: screenWidth * 0.03,
                                ),
                                filled: true,
                                fillColor: AppColors.borderColor,
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: AppColors.borderColor),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: AppColors.borderColor),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                    color: AppColors.borderColor,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              value: context.watch<GenderBloc>().state,
                              items: ['Erkek', 'Kadın']
                                  .map((String gender) => DropdownMenuItem(
                                        child: Text(
                                          gender,
                                          style: TextStyle(
                                            fontFamily: "Poppins",
                                            fontSize: screenWidth * 0.04,
                                          ),
                                        ),
                                        value: gender,
                                      ))
                                  .toList(),
                              onChanged: (String? newvalue) {
                                context
                                    .read<GenderBloc>()
                                    .SelectGender(newvalue!);
                              },
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: screenHeight * 0.03,
                      ),
                      GestureDetector(
                        onTap: () => _selectDate(context),
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              vertical: screenHeight * 0.015,
                              horizontal: screenWidth * 0.04),
                          decoration: BoxDecoration(
                            color: AppColors.borderColor,
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: AppColors.borderColor),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.today_outlined,
                                color: AppColors.gray_1,
                              ),
                              SizedBox(
                                width: screenWidth * 0.03,
                              ),
                              Expanded(
                                child: Text(
                                  selectedDate == DateTime.now()
                                      ? "Date Of Brith"
                                      : "${selectedDate.toLocal()}"
                                          .split(' ')[0],
                                  style: TextStyle(
                                    color: AppColors.gray_2,
                                    fontFamily: "Poppins",
                                    fontSize: screenWidth * 0.03,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: screenHeight * 0.03,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: screenWidth * 0.7,
                            child: CustomComplateProfileTextField(  hinText: "Your Weight", screenWidth: screenWidth),
                          ),
                          SizedBox(
                            width: screenWidth * 0.05,
                          ),
                          Expanded(
                            child: CustomLinearPurpleContainer( text: "KG",  screenWidth: screenWidth, screenHeight: screenHeight),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: screenHeight * 0.03,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: screenWidth * 0.7,
                            child: CustomComplateProfileTextField(  hinText: "Your Height", screenWidth: screenWidth),
                          ),
                          SizedBox(
                            width: screenWidth * 0.05,
                          ),
                          Expanded(
                            child: CustomLinearPurpleContainer( text: "CM", screenWidth: screenWidth, screenHeight: screenHeight),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




