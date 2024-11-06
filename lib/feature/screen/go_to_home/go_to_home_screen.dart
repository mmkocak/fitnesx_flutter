import 'package:fitnesx_flutter/core/bloc/auth/authentication_bloc.dart';
import 'package:fitnesx_flutter/core/bloc/auth/authentication_state.dart';
import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';

class GoToHomeScreen extends StatefulWidget {
  GoToHomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<GoToHomeScreen> createState() => _GoToHomeScreenState();
}

class _GoToHomeScreenState extends State<GoToHomeScreen> {
  @override
  @override
  Widget build(BuildContext context) {
    const String imageName = "assets/images/register5.png";
    double screenWidth = MediaQuery.sizeOf(context).width;
    double screenHeight = MediaQuery.sizeOf(context).height;

    return BlocBuilder<AuthenticationBloc, AuthenticationState>(
      builder: (context, state) {
        if (state is AuthenticationAuthenticated) {
          final user = state.user;
          final firstName = user.displayName?.split(' ').first ?? 'User';
          return Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: screenHeight * 0.14,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                  child: Image(
                    width: screenWidth * 0.9,
                    image: AssetImage(
                      imageName,
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.03,
                ),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Welcome, ",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: screenWidth * 0.05,
                            fontWeight: FontWeight.bold,
                            color: AppColors.blackColor),
                      ),
                      TextSpan(
                        text: "$firstName",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: screenWidth * 0.05,
                            fontWeight: FontWeight.bold,
                            color: AppColors.blackColor),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.01,
                ),
                Text(
                  textAlign: TextAlign.center,
                  "You are all set now, let’s reach your\n goals together with us",
                  style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: screenWidth * 0.03,
                    color: AppColors.gray_1,
                  ),
                ),
                SizedBox(height: screenHeight * 0.17,),
                CustomElevetadButton(
                    onPressed: () {},
                    text: "Go To  Home",
                    height: screenHeight * 0.07,
                    width: screenWidth * 0.9)
              ],
            ),
          );
        }
        return Scaffold(
          body: Center(child: Text('Please login to continue.')),
        );
      },
    );
  }
}
