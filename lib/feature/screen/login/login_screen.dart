import 'package:fitnesx_flutter/feature/screen/register/profil_completion_page/widgets/custom_textformfield.dart';
import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';
import 'package:fitnesx_flutter/feature/utils/widgets/custom_password_textfield.dart';
import 'package:fitnesx_flutter/fitnestx_icons.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    double screenHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: screenHeight * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Hey there,",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: screenWidth * 0.04,
                      color: AppColors.blackColor),
                ),
              ],
            ),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome Back",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: screenHeight * 0.03,
            ),
            Form(
              child: Column(
                children: [
                  Container(
                    width: screenWidth * 0.9,
                    child: CustomTextformfield(
                        hinText: "Email",
                        icon: Icon(Fitnestx.message),
                        size: screenWidth * 0.03,
                        controller: emailController),
                  ),
                  SizedBox(height:  screenHeight * 0.03,),
                  Container(
                    width: screenWidth * 0.9,
                    child: CustomPasswordTextfield(
                        hinText: "Password",
                        icon: Icon(Fitnestx.lock),
                        size: screenWidth * 0.03,
                        controller: passwordController),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
