import 'dart:async';

import 'package:fitnesx_flutter/feature/screen/onboarding/onboarding_page.dart';
import 'package:fitnesx_flutter/feature/theme/colors.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
    void initState(){
    super.initState();
   _navigateOnboarding();
    }

    void _navigateOnboarding()async {
    await Future.delayed(const Duration(seconds: 5));
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> const OnboardingPage()));
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(
        children: [
          Center(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                    text: "fitnest",
                    style: TextStyle(
                        color: AppColors.blackColor,
                        fontSize: MediaQuery.sizeOf(context).width / 10,
                        fontFamily: "Poppions",
                        fontWeight: FontWeight.bold),
                  ),
                  WidgetSpan(
                    alignment: PlaceholderAlignment.baseline,
                    baseline: TextBaseline.alphabetic,
                    child: ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return const LinearGradient(
                          colors: <Color>[
                            AppColors.brandColorsOne,
                            AppColors.brandColorTwo
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ).createShader(bounds);
                      },
                      child: Text(
                        "X",
                        style: TextStyle(
                            fontSize: MediaQuery.sizeOf(context).width / 9,
                            fontFamily: "Poppions",
                            color: AppColors.whiteColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: MediaQuery.sizeOf(context).height / 20,
            left: 0,
            right: 0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "from",
                  style: TextStyle(
                      fontSize: MediaQuery.sizeOf(context).width / 30,
                      fontFamily: "Poppions",
                      color: AppColors.blackColor,
                      fontWeight: FontWeight.w300),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height / 60,
                ),
                ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return const LinearGradient(colors: <Color>[
                        AppColors.brandColorsOne,
                        AppColors.brandColorTwo
                      ], begin: Alignment.topLeft, end: Alignment.bottomRight)
                          .createShader(bounds);
                    },
                    child: Text(
                      textAlign: TextAlign.center,
                      "Mirze Muhammet \nKoçak",
                      style: TextStyle(
                          color: AppColors.whiteColor,
                          fontFamily: "Poppions",
                          fontWeight: FontWeight.w500,
                          fontSize: MediaQuery.sizeOf(context).width / 24),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
