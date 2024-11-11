import 'package:fitnesx_flutter/core/bloc/auth/authentication_bloc.dart';
import 'package:fitnesx_flutter/core/bloc/auth/authentication_state.dart';
import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(),
          child: Column(
            children: [
              BlocBuilder<AuthenticationBloc, AuthenticationState>(
                builder: (context, state) {
                  if(state is AuthenticationAuthenticated){
                    final user = state.user;
                    final firstname = user.displayName?.split( ' ');
                    return Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                            top: screenHeight * 0.06, left: screenWidth * 0.04),
                        child: RichText(
                          text: TextSpan(children: [
                            TextSpan(
                              text: "Welcome Back,\n",
                              style: TextStyle(
                                  fontFamily: "Poppins",
                                  color: AppColors.gray_2,
                                  fontSize: screenWidth * 0.03),
                            ),
                            
                            TextSpan(text: "$firstname", style: TextStyle(
                                  fontFamily: "Poppins",
                                  color: AppColors.blackColor,
                                  fontSize: screenWidth * 0.05),),
                          ]),
                        ),
                      )
                    ],
                  );
                  }
                   return Scaffold(
          body: Center(child: Text('Please login to continue.')),
        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
