import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';

extension RegisterTreeExtension on BuildContext {
  Widget getContentForIndex(
      int index, double screenWidth, double screenHeight) {
    final contentList = [
      {
        "image": "assets/images/register2.png",
        "title": "Improve Shape",
        "description":
            "I have a low amount of body fat\n and need / want to build more\n muscle",
      },
      {
        "image": "assets/images/register3.png",
        "title": "Lean & Tone",
        "description":
            "I’m “skinny fat”. look thin but have\n no shape. I want to add learn\n muscle in the right way",
      },
      {
        "image": "assets/images/register4.png",
        "title": "Lose a Fat",
        "description":
            "I have over 20 lbs to lose. I want to\n drop all this fat and gain muscle\n mass",
      }
    ];
    if(index < contentList.length){
       final content = contentList[index];
       return Container(
      width: screenWidth * 0.78,
      height: screenHeight * 0.6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: const LinearGradient(
          colors: <Color>[
            AppColors.brandColorsOne,
            AppColors.brandColorTwo,
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        children: [
          SizedBox(
            height: screenHeight * 0.05,
          ),
          Image(
            image: AssetImage(content["image"]!),
            width: screenWidth * 0.5,
          ),
          SizedBox(
            height: screenHeight * 0.03,
          ),
          Text(
            content["title"]!,
            style: TextStyle(
                fontFamily: "Poppins",
                fontSize: screenWidth * 0.04,
                fontWeight: FontWeight.bold,
                color: AppColors.whiteColor),
          ),
          Divider(
            color: AppColors.whiteColor,
            height: screenHeight * 0.02,
            thickness: screenHeight * 0.002,
            indent: screenWidth * 0.32,
            endIndent: screenWidth * 0.32,
          ),
          SizedBox(
            height: screenHeight * 0.02,
          ),
          Text(
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: screenWidth * 0.03,
                  color: AppColors.whiteColor),
              textAlign: TextAlign.center,
              content["description"]!)
        ],
      ),
    );

    } else{
      return  Container(
      width: screenWidth * 0.78,
      height: screenHeight * 0.6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        gradient: const LinearGradient(
          colors: <Color>[
            AppColors.brandColorsOne,
            AppColors.brandColorTwo,
          ],
          begin: Alignment.topRight,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Text(
          "Invalid content index.",
          style: TextStyle(
            fontFamily: "Poppins",
            fontSize: screenWidth * 0.04,
            color: AppColors.whiteColor,
          ),
        ),
      ),
    );
    }
   
    
  }
}