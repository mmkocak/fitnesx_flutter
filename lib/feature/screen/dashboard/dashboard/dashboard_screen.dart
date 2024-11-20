import 'package:fitnesx_flutter/core/bloc/auth/authentication_bloc.dart';
import 'package:fitnesx_flutter/core/bloc/auth/authentication_state.dart';
import 'package:fitnesx_flutter/feature/screen/dashboard/dashboard/mixins/build_bubble_mixin.dart';
import 'package:fitnesx_flutter/feature/screen/dashboard/dashboard/widgets/mass_index_container.dart';
import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';
import 'package:fitnesx_flutter/fitnestx_icons.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with BuildBubbleMixin {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: screenWidth * 0.01, vertical: screenHeight * 0.01),
          child: Column(
            children: [
              BlocBuilder<AuthenticationBloc, AuthenticationState>(
                builder: (context, state) {
                  if (state is AuthenticationAuthenticated) {
                    final user = state.user;
                    final firstname =
                        user.displayName?.replaceAll(RegExp(r'[^\w\s]'), '') ??
                            '';
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                              top: screenHeight * 0.06,
                              left: screenWidth * 0.04),
                          child: RichText(
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: "Welcome Back,\n",
                                  style: TextStyle(
                                      fontFamily: "Poppins",
                                      color: AppColors.gray_2,
                                      fontSize: screenWidth * 0.03),
                                ),
                                TextSpan(
                                  text: "$firstname".toUpperCase(),
                                  style: TextStyle(
                                      fontFamily: "Poppins",
                                      color: AppColors.blackColor,
                                      fontWeight: FontWeight.bold,
                                      fontSize: screenWidth * 0.06),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: screenHeight * 0.06,
                              right: screenWidth * 0.04),
                          child: Center(
                            child: Container(
                              width: screenWidth * 0.15,
                              height: screenHeight * 0.06,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: AppColors.borderColor,
                              ),
                              child: Icon(
                                Fitnestx.notification,
                                size: screenWidth * 0.06,
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  }
                  return const Scaffold(
                    body: Center(child: Text('Please login to continue.')),
                  );
                },
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                child: Stack(
                  children: [
                    MassIndexContainer(
                        screenHeight: screenHeight, screenWidth: screenWidth),
                    buildBubble(left: -35, top: 140, size: 90),
                    buildBubble(left: 100, top: 10, size: 10),
                    buildBubble(left: 150, top: 130, size: 10),
                    buildBubble(left: 200, top: 20, size: 10),
                    buildBubble(left: 220, top: 150, size: 10),
                    buildBubble(left: 360, top: 120, size: 100),
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              Container(
                width: screenWidth * 0.9,
                height: screenHeight * 0.08,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: <Color>[
                        Color(0x5092A3FD),
                        Color(0x509DCEFF),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(16)),
                child: Padding(
                  padding: EdgeInsets.only(
                      left: screenWidth * 0.02, right: screenWidth * 0.02),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 7,
                        child: Text(
                          "Today Target",
                          style: TextStyle(
                              fontFamily: "Poppins",
                              color: AppColors.blackColor,
                              fontWeight: FontWeight.w600,
                              fontSize: screenWidth * 0.04),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: GestureDetector(
                          onTap: (){
                           debugPrint("Check buton tıklandı");
                          },
                          child: Container(
                            width: screenWidth * 0.01,
                            height: screenHeight * 0.04,
                            decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                    colors: <Color>[
                                      AppColors.brandColorsOne,
                                      AppColors.brandColorTwo
                                    ],
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight),
                                borderRadius: BorderRadius.circular(14)),
                            child: Center(
                                child: Text(
                              "Check",
                              style: TextStyle(
                                  color: AppColors.whiteColor,
                                  fontSize: screenWidth * 0.04,
                                  fontFamily: "Poppins"),
                            )),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
