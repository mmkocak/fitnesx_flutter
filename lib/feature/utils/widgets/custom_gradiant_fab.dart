import 'package:fitnesx_flutter/feature/utils/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomGradiantFab extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final double borderWidth;
  final LinearGradient gradient;
  const CustomGradiantFab(
      {Key? key,
      required this.onPressed,
      required this.icon,
      required this.borderWidth,
      required this.gradient})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 70,
      height: 70,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: gradient,
      ),
      child: Center(
        child: Container(
          width: 70 - borderWidth,
          height: 70 -borderWidth,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.whiteColor,
          ),
          child: FloatingActionButton(
            onPressed: onPressed,
            elevation: 0,
            backgroundColor: Colors.transparent,
            child: Icon(icon, color: AppColors.blackColor,),
            ),
        ),
      ),
    );
  }
}
