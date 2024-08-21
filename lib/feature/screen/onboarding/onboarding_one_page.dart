import 'package:fitnesx_flutter/feature/utils/theme/colors.dart';
import 'package:fitnesx_flutter/feature/utils/widgets/custom_gradiant_fab.dart';
import 'package:flutter/material.dart';

class OnboardingOnePage extends StatefulWidget {
  const OnboardingOnePage({Key? key}) : super(key: key);

  @override
  _OnboardingOnePageState createState() => _OnboardingOnePageState();
}

class _OnboardingOnePageState extends State<OnboardingOnePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 60),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomGradiantFab(
                onPressed: () {},
                icon: Icons.back_hand,
                borderWidth: 8.0,
                gradient: LinearGradient(
                  colors: <Color>[
                    AppColors.brandColorsOne,
                    AppColors.brandColorTwo
                  ],
                  stops:[ 0.25, 0.25,],
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                ))
          ],
        ),
      ),
    );
  }
}
