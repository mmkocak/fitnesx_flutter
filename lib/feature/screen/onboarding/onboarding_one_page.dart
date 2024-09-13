import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';
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
         Image(
           image: AssetImage(anaResim),
           alignment: Alignment.topLeft,
           width: screenWidth,
           fit: BoxFit.fitWidth,
         ),
          SizedBox(height: screenHeight /12,),
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: screenWidth * 0.1),
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
                      Navigator.pushReplacement(
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
