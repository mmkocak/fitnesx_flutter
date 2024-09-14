import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';

class AccounCreateScreen extends StatefulWidget {
  const AccounCreateScreen({super.key});

  @override
  State<AccounCreateScreen> createState() => _AccounCreateScreenState();
}

class _AccounCreateScreenState extends State<AccounCreateScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;
    final String googleIcon = "assets/images/google.png";
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            vertical: screenHeight * 0.05, horizontal: screenWidth * 0.05),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: screenHeight * 0.02,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Hey there,",
                  style: TextStyle(
                      fontFamily: "Poppins", fontSize: screenWidth * 0.04),
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
                  "Create an Account",
                  style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: screenWidth * 0.06,
                      fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: screenHeight * 0.04,
            ),
            Container(
              width: screenWidth * 0.8,
              child: Form(
                child: Column(
                  children: [
                    CustomTextfield(
                      hinText: "First Name",
                      icons: Icons.person_outline_outlined,
                    ),
                    SizedBox(
                      height: screenWidth * 0.04,
                    ),
                    CustomTextfield(
                      hinText: "Last Name",
                      icons: Icons.person_outline_outlined,
                    ),
                    SizedBox(
                      height: screenWidth * 0.04,
                    ),
                    CustomTextfield(
                      hinText: "Email",
                      icons: Icons.email_outlined,
                    ),
                    SizedBox(
                      height: screenWidth * 0.04,
                    ),
                    CustomTextfield(
                      hinText: "Password",
                      icons: Icons.lock_outline,
                    ),
                    SizedBox(
                      height: screenWidth * 0.03,
                    ),
                    const PrivacyPolicyChackbox(),
                    SizedBox(
                      height: screenHeight * 0.17,
                    ),
                  ],
                ),
              ),
            ),
            CustomElevetadButton(
              onPressed: () {},
              text: "Register",
              height: screenHeight * 0.07,
              width: screenWidth * 0.9,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Expanded(
                    child: Divider(
                      color: AppColors.gray_3,
                    ),
                    flex: 2,
                  ),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: screenWidth * 0.02),
                    child: const Text(
                      "Or",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: AppColors.blackColor),
                    ),
                  ),
                  const Expanded(
                    child: Divider(
                      color: AppColors.gray_3,
                    ),
                    flex: 2,
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (){
                    print("Google TIklandı");
                  },
                  child: Container(
                    decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: AppColors.gray_3,
                        width: 2,
                      ),
                    ),
                    height: 50,
                    width: 50,
                    child: Center(
                        child: Image.asset(
                      googleIcon,
                      width: 25,
                      height: 25,
                    )),
                  ),
                ),
                SizedBox(
                  width: screenWidth * 0.02,
                ),
                GestureDetector(
                  onTap: () {
                    print("Face Tıklandı");
                  },
                  child: Container(
                    decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(14),
                      border: Border.all(
                        color: AppColors.gray_3,
                        width: 2,
                      ),
                    ),
                    height: 50,
                    width: 50,
                    child: const Icon(
                      Icons.facebook,
                      color: Colors.blue,
                      size: 30,
                    ),
                  ),
                ),
                
                
              ],
            ),
            SizedBox(height: screenHeight * 0.03,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RichText(text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Already have an account? ",
                      style: TextStyle(fontSize: screenWidth * 0.04, color: AppColors.blackColor),
                    ),
                    WidgetSpan(
                      alignment: PlaceholderAlignment.baseline,
                      baseline: TextBaseline.alphabetic,
                      child: ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return const LinearGradient(
                            colors: <Color>[AppColors.purple_1, AppColors.purple_2], 
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            ).createShader(bounds);
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(fontSize: screenWidth * 0.04, fontWeight: FontWeight.bold, color: Colors.white)
                        ),
                      ),
                    ),
                  ]
                ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
