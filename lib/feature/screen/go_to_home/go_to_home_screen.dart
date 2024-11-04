import 'package:fitnesx_flutter/core/bloc/auth/authentication_bloc.dart';
import 'package:fitnesx_flutter/core/bloc/auth/authentication_state.dart';
import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';

class GoToHomeScreen extends StatelessWidget {
  const GoToHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const String imageName = "assets/images/register5.png";
    double screenWidth = MediaQuery.sizeOf(context).width;
    double screenHeight = MediaQuery.sizeOf(context).height;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: screenHeight * 0.1,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
            child: const Image(
              image: AssetImage(imageName),
            ),
          ),
          SizedBox(
            height: screenHeight * 0.03,
          ),
          BlocBuilder<AuthenticationBloc, AuthenticationState>(
            builder: (context, state) {
              return RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: "Welcome, ",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth * 0.05,
                        color: AppColors.blackColor),
                  ),
                  TextSpan(
                    text: "",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth * 0.05,
                        color: AppColors.blackColor),
                  ),
                ]),
              );
            },
          ),
        ],
      ),
    );
  }
}
