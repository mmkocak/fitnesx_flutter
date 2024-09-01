import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';

class OnboardingTwoPage extends StatefulWidget {
  const OnboardingTwoPage({Key? key}) : super(key: key);

  @override
  _OnboardingTwoPageState createState() => _OnboardingTwoPageState();
}

class _OnboardingTwoPageState extends State<OnboardingTwoPage> {
  static const String onborading2img = "assets/images/onboarding2.png";

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset(
            width: screenWidth,
            fit: BoxFit.fitWidth,
            onborading2img,
            alignment: Alignment.topLeft,
          ),
          SizedBox(
            height: screenHeight / 12,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).width * 0.1),
            child: Text(
              "Get Burn",
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: screenWidth * 0.06,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.1, vertical: screenWidth / 20),
            child: const Text(
              "Let’s keep burning, to achive yours goals, it hurts only temporarily, if you give up now you will be in pain forever",
              style: TextStyle(
                fontFamily: "Poppins",
                color: AppColors.gray_1,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),
          SizedBox(
            height: screenHeight / 14,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth * 0.1,
                    vertical: screenWidth / 20),
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
                    pageIndex: 2),
              ),
            ],
          )
        ],
      ),
    );
  }
}
