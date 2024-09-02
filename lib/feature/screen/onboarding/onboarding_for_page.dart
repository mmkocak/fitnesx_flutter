import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';

class OnboardingForPage extends StatefulWidget {
  const OnboardingForPage({Key? key}) : super(key: key);

  @override
  _OnboardingForPageState createState() => _OnboardingForPageState();
}

class _OnboardingForPageState extends State<OnboardingForPage> {
  static const String onboardin3img = "assets/images/onboarding4.png";
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
              "Improve Sleep  Quality",
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
              "Improve the quality of your sleep with us, good quality sleep can bring a good mood in the morning",
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
                              const OnboardingForPage(),
                          transitionDuration: Duration.zero,
                          reverseTransitionDuration: Duration.zero,
                        ),
                      );
                    },
                    icon: Icons.chevron_right,
                    pageIndex: 4),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
