import 'package:fitnesx_flutter/feature/utils/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomGradiantFab extends StatelessWidget {
  final VoidCallback onPressed;
const CustomGradiantFab({ Key? key, required this.onPressed}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Container(
      height: 70,
      width: 70,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient
        (colors: <Color>[AppColors.brandColorsOne, AppColors.brandColorTwo],
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        ),
      ),
      child: FloatingActionButton(
        child: Icon(Icons.chevron_right, color: Colors.white, size: 40,),
        backgroundColor: Colors.transparent,
        elevation: 0,
        onPressed: onPressed,
        ),
    );
  }
}