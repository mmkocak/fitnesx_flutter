import 'package:fitnesx_flutter/feature/utils/theme/colors.dart';
import 'package:fitnesx_flutter/feature/utils/widgets/custom_gradiant_fab.dart';
import 'package:flutter/material.dart';

class OnboardingThereePage extends StatefulWidget {
  const OnboardingThereePage({Key? key}) : super(key: key);

  @override
  _OnboardingThereePageState createState() => _OnboardingThereePageState();
}

class _OnboardingThereePageState extends State<OnboardingThereePage> {
  static const String onboardin3img = "assets/images/onboarding3.png";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            onboardin3img,
             alignment: Alignment.topLeft,
          ),
          
          const Padding(
            padding: EdgeInsets.only(right: 40, left: 40, top: 65),
            child: Text(
              "Eat Well",
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding:  EdgeInsets.only(top: 40, left: 40, right: 40),
            child: Text(
              "Let's start a healthy lifestyle with us, we can determine your diet every day. healthy eating is fun",
              style: TextStyle(
                fontFamily: "Poppins",
                color: AppColors.gray_1,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height / 15,
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
                          pageBuilder: (context, animation1, animation2) =>
                              const OnboardingThereePage(),
                          transitionDuration: Duration.zero,
                          reverseTransitionDuration: Duration.zero,
                        ),
                      );
                    },
                    icon: Icons.chevron_right,
                    pageIndex: 3),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
