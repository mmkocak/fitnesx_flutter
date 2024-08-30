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
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            width: MediaQuery.sizeOf(context).width / 1,
            height: MediaQuery.sizeOf(context).height / 2,
            image: const AssetImage(anaResim),
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height / 11),
          const Padding(
            padding: EdgeInsets.only(left: 40, right: 40),
            child: Text(
              "Track Your Goal",
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 40, right: 40, top: 30),
            child: Text(
              "Don't worry if you have trouble determining your goals, We can help you determine your goals and track your goals",
              style: TextStyle(
                  fontFamily: "Poppins",
                  color: AppColors.gray_1,
                  fontStyle: FontStyle.normal),
            ),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height / 7,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 30),
                child: CustomGradiantFab(
                    onPressed: () {
                      Navigator.push(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation1, animation2) =>const OnboardingTwoPage(),
                            transitionDuration: Duration.zero,
                            reverseTransitionDuration: Duration.zero
                      ));
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
