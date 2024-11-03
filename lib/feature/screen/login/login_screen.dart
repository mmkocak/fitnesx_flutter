import 'dart:math';

import 'package:fitnesx_flutter/core/bloc/auth/authentication_bloc.dart';
import 'package:fitnesx_flutter/core/bloc/auth/authentication_event.dart';
import 'package:fitnesx_flutter/core/bloc/auth/authentication_state.dart';
import 'package:fitnesx_flutter/feature/screen/go_to_home/go_to_home_screen.dart';
import 'package:fitnesx_flutter/feature/screen/register/profil_completion_page/widgets/custom_textformfield.dart';
import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';
import 'package:fitnesx_flutter/feature/utils/widgets/custom_password_textfield.dart';
import 'package:fitnesx_flutter/fitnestx_icons.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Future<void> SignInWithGoogle() async {
    context.read<AuthenticationBloc>().add(GoogleSignInRequested());
  }

  Future<void> signInWithFacebook() async {
    context.read<AuthenticationBloc>().add(FacebookSignInRequested());
  }

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  String googleIcon = "assets/images/google.png";

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    double screenHeight = MediaQuery.sizeOf(context).height;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: screenHeight * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Hey there,",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: screenWidth * 0.04,
                        color: AppColors.blackColor),
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Welcome Back",
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: screenWidth * 0.05,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              BlocListener<AuthenticationBloc, AuthenticationState>(
                listener: (context, state) {
                  if (state is AuthenticationAuthenticated) {
                    WidgetsBinding.instance.addPersistentFrameCallback((_) {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                            pageBuilder:
                                (context, animation, secondaryAnimation) =>
                                    const GoToHomeScreen(),
                            transitionDuration: Duration.zero,
                            reverseTransitionDuration: Duration.zero),
                      );
                    });
                  } else if (state is AuthenticationFailure) {
                    WidgetsBinding.instance.addPersistentFrameCallback((_) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Login Failed  ${state.error}")));
                    });
                  }
                },
                child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
                  builder: (context, state) {
                    if (state is AuthenticationLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return Form(
                      child: Column(
                        children: [
                          Container(
                            width: screenWidth * 0.9,
                            child: CustomTextformfield(
                                hinText: "Email",
                                icon: const Icon(Fitnestx.message),
                                size: screenWidth * 0.03,
                                controller: _emailController),
                          ),
                          SizedBox(
                            height: screenHeight * 0.03,
                          ),
                          Container(
                            width: screenWidth * 0.9,
                            child: CustomPasswordTextfield(
                                hinText: "Password",
                                icon: const Icon(Fitnestx.lock),
                                size: screenWidth * 0.03,
                                controller: _passwordController),
                          ),
                          SizedBox(
                            height: screenHeight * 0.01,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              "Forgot your password ? ",
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: screenWidth * 0.03,
                                color: AppColors.gray_1,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: screenHeight * 0.3,
              ),
              BlocBuilder<AuthenticationBloc, AuthenticationState>(
                builder: (context, state) {
                  return CustomElevetadButton(
                    onPressed: () {
                      context.read<AuthenticationBloc>().add(
                          EmailSignInRequested(
                              email: _emailController.text,
                              password: _passwordController.text));
                    },
                    text: "Login",
                    height: screenHeight * 0.07,
                    width: screenWidth * 0.9,
                  );
                },
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Divider(color: AppColors.gray_1),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
                      child: Text(
                        "or",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: screenWidth * 0.04),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Divider(color: AppColors.gray_1),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () async {
                      print( "Google TIklandı");
                      await SignInWithGoogle();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: AppColors.gray_3,
                          width: 2,
                        ),
                      ),
                      height: 50,
                      width: 50,
                      child: Center(
                          child: Image.asset(
                        googleIcon,
                        width: 25,
                        height: 25,
                      )),
                    ),
                  ),
                  SizedBox(
                    width: screenWidth * 0.04,
                  ),
                  GestureDetector(
                    onTap: () async {
                      print("Face Tıklandı");
                      await signInWithFacebook();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: AppColors.gray_3,
                          width: 2,
                        ),
                      ),
                      height: 50,
                      width: 50,
                      child: const Icon(
                        Icons.facebook,
                        color: Colors.blue,
                        size: 30,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Don't have an account yet? ",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: screenWidth * 0.04,
                        color: AppColors.blackColor,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    WidgetSpan(
                      alignment: PlaceholderAlignment.baseline,
                      baseline: TextBaseline.alphabetic,
                      child: ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return const LinearGradient(
                            colors: <Color>[
                              AppColors.purple_1,
                              AppColors.purple_2
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ).createShader(bounds);
                        },
                        child: TextButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                PageRouteBuilder(
                                    pageBuilder: (context, animation,
                                            secondaryAnimation) =>
                                        const AccounCreateScreen(),
                                    transitionDuration: Duration.zero,
                                    reverseTransitionDuration: Duration.zero));
                          },
                          child: Text(
                            "Register?",
                            style: TextStyle(
                                color: AppColors.whiteColor,
                                fontFamily: "Poppins",
                                fontSize: screenWidth * 0.04),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
