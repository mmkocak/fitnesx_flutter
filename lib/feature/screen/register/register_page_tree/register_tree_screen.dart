import 'package:fitnesx_flutter/core/bloc/register_container/register_tree_bloc.dart';
import 'package:fitnesx_flutter/feature/screen/login/login_screen.dart';
import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';

class RegisterTreeScreen extends StatelessWidget {
  const RegisterTreeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    double screenHeight = MediaQuery.sizeOf(context).height;
    const String image = "assets/images/register2.png";
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: screenHeight * 0.08),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "What is your goal? ",
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: screenWidth * 0.06,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            Text(
              textAlign: TextAlign.center,
              "It will help us to choose a best\n program for you ",
              style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: screenWidth * 0.03,
                  color: AppColors.gray_1),
            ),
            SizedBox(
              height: screenHeight * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(22),
                      bottomRight: Radius.circular(22),
                    ),
                    gradient: LinearGradient(
                      colors: <Color>[
                        AppColors.brandColorTwo,
                        AppColors.brandColorsOne,
                      ],
                      begin: Alignment.topRight,
                      end: Alignment.bottomRight,
                      stops: [1.0, 0.0],
                    ),
                  ),
                  width: screenWidth * 0.06,
                  height: screenHeight * 0.5,
                ),
                BlocBuilder<RegisterTreeBloc, RegisterTreeState>(
                    builder: (context, state) {
                  if (state is RegisterTreeContent) {
                    final content = _getContentForIndex(
                        state.currentIndex, screenWidth, screenHeight);
                    return content;
                  } else if (state is RegisterTreeNavigate) {
                    Future.microtask(
                      () => Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  LoginScreen(),
                                  reverseTransitionDuration: Duration.zero,
                                  transitionDuration: Duration.zero
                        ),
                      ),
                    );
                    return SizedBox.shrink();
                  }else{
                    return const SizedBox.shrink();
                  }
                },
                ),
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(22),
                      bottomLeft: Radius.circular(22),
                    ),
                    gradient: LinearGradient(
                      colors: <Color>[
                        AppColors.brandColorTwo,
                        AppColors.brandColorsOne,
                      ],
                      begin: Alignment.topRight,
                      end: Alignment.bottomRight,
                      stops: [1.0, 0.0],
                    ),
                  ),
                  width: screenWidth * 0.06,
                  height: screenHeight * 0.5,
                ),
              ],
            ),
            SizedBox(
              height: screenHeight * 0.06,
            ),
            CustomElevetadButton(
                onPressed: () {
                  context.read<RegisterTreeBloc>().add(ConfirmButtonPressed());
                },
                text: "Confirm",
                height: screenHeight * 0.07,
                width: screenWidth * 0.9)
          ],
        ),
      ),
    );
  }

  Widget _getContentForIndex(
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
