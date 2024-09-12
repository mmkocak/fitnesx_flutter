import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';
class CustomElevetadButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const CustomElevetadButton({required this.onPressed, required this.text})
      : super();

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    double screenHeight = MediaQuery.sizeOf(context).height;
    return Container(
     height: screenHeight * 0.06,
     width: screenWidth * 1.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(80),
        gradient: const  LinearGradient(
          colors: <Color>[AppColors.brandColorsOne, AppColors.brandColorTwo],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          ),
      ),
      child: ElevatedButton(
        onPressed: onPressed, 
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(80)
          )
        ),
        child: Text(text,
        style: TextStyle(
          fontSize: MediaQuery.sizeOf(context).width/20,
          fontFamily: "Poppins",
          color: AppColors.whiteColor,
          fontWeight: FontWeight.bold,
        ),
        ),

        ),
    );
  }
}
