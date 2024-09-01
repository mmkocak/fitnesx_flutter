import 'package:fitnesx_flutter/feature/screen/onboarding/onboarding_two_page.dart';
import 'package:fitnesx_flutter/feature/utils/theme/colors.dart';
import 'package:fitnesx_flutter/feature/utils/widgets/custom_gradiant_fab.dart';
import 'package:flutter/material.dart';

class OnboardingOnePage extends StatefulWidget {
  const OnboardingOnePage({Key? key}) : super(key: key);

  @override
  _OnboardingOnePageState createState() => _OnboardingOnePageState();
}

class _OnboardingOnePageState extends State<OnboardingOnePage> {
  static const String anaResim = "assets/images/oboarding1.png";
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;

    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
         const AspectRatio(
            aspectRatio: 0.9,
            child: Image(
              image: AssetImage(anaResim),
              alignment: Alignment.topLeft,
            ),
          ),
          SizedBox(height: screenHeight /12,),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).width * 0.1),
            child:  Text(
              "Track Your Goal",
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: screenWidth * 0.06,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.1,
                vertical: screenWidth / 20),
            child: const Text(
              "Don't worry if you have trouble determining your goals, We can help you determine your goals and track your goals",
              style: TextStyle(
                  fontFamily: "Poppins",
                  color: AppColors.gray_1,
                  fontStyle: FontStyle.normal),
            ),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height / 14,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery.sizeOf(context).width * 0.1,
                    vertical: MediaQuery.sizeOf(context).width / 20),
                child: CustomGradiantFab(
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                              pageBuilder: (context, animation1, animation2) =>
                                  const OnboardingTwoPage(),
                              transitionDuration: Duration.zero,
                              reverseTransitionDuration: Duration.zero));
                    },
                    icon: Icons.chevron_right,
                    pageIndex: 1),
              )
            ],
          )
        ],
      ),
    );
  }
}
