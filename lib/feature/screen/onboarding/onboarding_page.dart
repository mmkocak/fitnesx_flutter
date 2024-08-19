import 'package:fitnesx_flutter/feature/theme/colors.dart';
import 'package:fitnesx_flutter/feature/utils/widgets/custom_elevetad_button.dart';
import 'package:flutter/material.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Stack(children: [
        Center(
          child: RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Fitnest",
                  style: TextStyle(
                      color: AppColors.blackColor,
                      fontSize: MediaQuery.sizeOf(context).width / 10,
                      fontFamily: "Poppins",
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
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                      ).createShader(bounds);
                    },
                    child: Text(
                      "X",
                      style: TextStyle(
                          fontSize: MediaQuery.sizeOf(context).width / 9,
                          fontFamily: "Poppins",
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          top: MediaQuery.sizeOf(context).height / 10,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "everybody can train",
                style: TextStyle(
                    color: AppColors.gray_1,
                    fontFamily: "Poppins",
                    fontStyle: FontStyle.normal,
                    fontSize: MediaQuery.sizeOf(context).width / 30),
              ), 
            ],
          ),
        ),
        Positioned(
          bottom: MediaQuery.sizeOf(context).height / 20,
          right: 0,
          left: 0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             
             CustomElevetadButton(onPressed: (){}, text: "Get Started"),
            ],
          ),
        )
      ],),
    );
  }
}
