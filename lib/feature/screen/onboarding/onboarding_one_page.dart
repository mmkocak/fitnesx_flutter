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
         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Image(
              image: const AssetImage(anaResim),
              alignment: Alignment.topLeft,
             
            height: MediaQuery.of(context).size.height * 0.52,
            ),
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height / 15),
           Padding(
            padding: EdgeInsets.symmetric(horizontal:  MediaQuery.sizeOf(context).width * 0.1),
            child: const Text(
              "Track Your Goal",
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 28,
                  fontWeight: FontWeight.bold),
            ),
          ),
           Padding(
            padding: EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).width * 0.1, vertical:  MediaQuery.sizeOf(context).width /20),
            child: const Text(
              "Don't worry if you have trouble determining your goals, We can help you determine your goals and track your goals",
              style: TextStyle(
                  fontFamily: "Poppins",
                  color: AppColors.gray_1,
                  fontStyle: FontStyle.normal),
            ),
          ),
          SizedBox(
            height: MediaQuery.sizeOf(context).height / 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: MediaQuery.sizeOf(context).width * 0.1, vertical:  MediaQuery.sizeOf(context).width /20 ),
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
