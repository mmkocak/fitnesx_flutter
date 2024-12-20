import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';

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
                      context.SaveProfileData(
                          weight: _weightController.text,
                          height: _heightController.text,
                          nextpage: const RegisterTreeScreen());
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
}
