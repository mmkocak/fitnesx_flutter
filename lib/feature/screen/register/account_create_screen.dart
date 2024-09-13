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
                      fontFamily: "Poppins", fontSize: screenWidth * 0.03),
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
                      fontSize: screenWidth * 0.05,
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
                      height: screenHeight * 0.2,
                    ),
                    CustomElevetadButton(onPressed: () {}, text: "Register", height: screenHeight * 0.6, width: screenWidth * 0.09,),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: screenHeight * 0.01),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                         const Expanded(
                            child:  Divider(
                              color: AppColors.gray_3,
                            ),
                            flex: 2,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: screenWidth * 0.02),
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
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
