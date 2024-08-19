import 'package:fitnesx_flutter/feature/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomElevetadButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const CustomElevetadButton({required this.onPressed, required this.text})
      : super();

  @override
  Widget build(BuildContext context) {
    return Container(
     height: 60,
     width: 400,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(60),
        child: Ink(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: <Color>[AppColors.brandColorsOne, AppColors.brandColorTwo],
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
            ),
            borderRadius: BorderRadius.circular(90),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.sizeOf(context).width/20               
                ),
              ),
      
            ),
          ),
        ),
      ),
    );
  }
}
