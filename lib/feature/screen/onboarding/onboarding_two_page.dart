import 'package:fitnesx_flutter/feature/utils/theme/colors.dart';
import 'package:fitnesx_flutter/feature/utils/widgets/custom_gradiant_fab.dart';
import 'package:flutter/material.dart';

class OnboardingTwoPage extends StatefulWidget {
  const OnboardingTwoPage({Key? key}) : super(key: key);

  @override
  _OnboardingTwoPageState createState() => _OnboardingTwoPageState();
}

class _OnboardingTwoPageState extends State<OnboardingTwoPage> {
  static const String onborading2img = "assets/images/onboarding2.png";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            onborading2img,
            width: MediaQuery.sizeOf(context).width / 1,
            height: MediaQuery.sizeOf(context).height / 2,
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height / 16),
          const Padding(
            padding: const EdgeInsets.only(right: 40, left: 40, top: 40),
            child: Text(
              "Get Burn",
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const Padding(
            padding: const EdgeInsets.only(top: 40, left: 40, right: 40),
            child: Text(
              "Let’s keep burning, to achive yours goals, it hurts only temporarily, if you give up now you will be in pain forever",
              style: TextStyle(
                fontFamily: "Poppins",
                color: AppColors.gray_1,
                fontStyle: FontStyle.normal,
              ),
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
                    onPressed: () {}, icon: Icons.chevron_right, pageIndex: 2),
              ),
            ],
          )
        ],
      ),
    );
  }
}
