import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitnesx_flutter/feature/screen/register/profil_completion_page/cubit/date_cubit.dart';
import 'package:fitnesx_flutter/feature/screen/register/profil_completion_page/cubit/gender_cubit.dart';
import 'package:fitnesx_flutter/feature/screen/register/profil_completion_page/mixin/date_mixin.dart';
import 'package:fitnesx_flutter/feature/screen/register/profil_completion_page/widgets/custom_containerpcs.dart';
import 'package:fitnesx_flutter/feature/screen/register/profil_completion_page/widgets/custom_textformfield.dart';
import 'package:fitnesx_flutter/feature/screen/register/profil_completion_page/widgets/date_container.dart';
import 'package:fitnesx_flutter/feature/screen/register/profil_completion_page/widgets/dropdown_container.dart';
import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';
import 'package:fitnesx_flutter/fitnestx_icons.dart';

class ProfileCompletionScreen extends StatelessWidget with DateTimePicker {
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();
  ProfileCompletionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    double screenHeight = MediaQuery.sizeOf(context).height;
    const String image = "assets/images/register1.png";
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
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
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                child: Form(
                  child: Column(
                    children: [
                      BlocBuilder<GenderCubit, String?>(
                        builder: (context, state) {
                          return DropdownDontainerWidget(
                              screenWidth: screenWidth);
                        },
                      ),
                      SizedBox(
                        height: screenHeight * 0.03,
                      ),
                      GestureDetector(
                        onTap: () => selectDate(context),
                        child: DateContainerWidget(
                            screenHeight: screenHeight,
                            screenWidth: screenWidth),
                      ),
                      SizedBox(
                        height: screenHeight * 0.03,
                      ),
                      Row(
                        children: [
                          Expanded(
                              flex: 8,
                              child: CustomTextformfield(
                                controller: _weightController,
                                size: screenWidth * 0.03,
                                hinText: "Your Weight",
                                icon: Icon(Fitnestx.weightScale_1),
                              )),
                          SizedBox(
                            width: screenWidth * 0.05,
                          ),
                          Expanded(
                            flex: 2,
                            child: CustomContainerpcs(
                              fontSize: screenWidth * 0.05,
                              height: screenHeight * 0.06,
                              width: screenWidth * 0.04,
                              text: "KG",
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: screenHeight * 0.03,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 8,
                            child: CustomTextformfield(
                              controller: _heightController,
                              size: screenWidth * 0.03,
                              hinText: "Your Height",
                              icon: Icon(Fitnestx.swaps),
                            ),
                          ),
                          SizedBox(
                            width: screenWidth * 0.05,
                          ),
                          Expanded(
                            flex: 2,
                            child: CustomContainerpcs(
                              fontSize: screenWidth * 0.05,
                              height: screenHeight * 0.06,
                              width: screenWidth * 0.04,
                              text: "CM",
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: screenHeight * 0.03),
                child: CustomElevetadButton(
                    onPressed: () {
                      _saveProfileData(context);
                    },
                    text: "NEXT",
                    height: screenHeight * 0.07,
                    width: screenWidth * 0.9),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _saveProfileData(BuildContext context) async {
    final String weight = _weightController.text;
    final String height = _heightController.text;
    final String? gender = context.read<GenderCubit>().state;
    final DateTime? dob = context.read<DateCubit>().state;
    if (weight.isEmpty || height.isEmpty || gender == null || dob == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please complete all fields")),
      );
      return;
    }
    try {
      await FirebaseFirestore.instance.collection('users').add({
        'weight': weight,
        'height': height,
        'gender': gender,
        'date_of_brith': dob.toIso8601String(),
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Profil saved data succesfully!")),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Failed to save profile data ${e} ")));
    }
  }
}
