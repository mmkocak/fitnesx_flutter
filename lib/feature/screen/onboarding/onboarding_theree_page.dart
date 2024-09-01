import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';

class OnboardingThereePage extends StatefulWidget {
  const OnboardingThereePage({Key? key}) : super(key: key);

  @override
  _OnboardingThereePageState createState() => _OnboardingThereePageState();
}

class _OnboardingThereePageState extends State<OnboardingThereePage> {
  static const String onboardin3img = "assets/images/onboarding3.png";
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AspectRatio(
            aspectRatio: 0.9,
            child: Image.asset(
              onboardin3img,
              width: screenWidth,
               alignment: Alignment.topLeft,
               fit: BoxFit.fill,
            ),
          ),
          SizedBox(height: screenHeight /12,),
           Padding(
             padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.1),
            child: Text(
              "Eat Well",
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
              "Let's start a healthy lifestyle with us, we can determine your diet every day. healthy eating is fun",
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
                    vertical:screenWidth / 20),
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
