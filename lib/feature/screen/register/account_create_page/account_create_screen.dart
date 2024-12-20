import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';

class AccounCreateScreen extends StatefulWidget {
  const AccounCreateScreen({super.key});

  @override
  State<AccounCreateScreen> createState() => _AccounCreateScreenState();
}

class _AccounCreateScreenState extends State<AccounCreateScreen> {
  // Google SignIn Function
  Future<void> SignInWithGoogle() async {
    context.read<AuthenticationBloc>().add(GoogleSignInRequested());
  }

// Facebook SignIn Function
  Future<void> signInWithFacebook() async {
    context.read<AuthenticationBloc>().add(FacebookSignInRequested());
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.sizeOf(context).height;
    double screenWidth = MediaQuery.sizeOf(context).width;
    final TextEditingController _firstnameController = TextEditingController();
    final TextEditingController _lastnameController = TextEditingController();
    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();
    const String googleIcon = "assets/images/google.png";
    return Scaffold(
      body: BlocListener<AuthenticationBloc, AuthenticationState>(
        listener: (context, state) {
          state.handleAuthenticationState(context);
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: screenHeight * 0.05, horizontal: screenWidth * 0.05),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Hey there,",
                      style: TextStyle(
                          fontFamily: "Poppins", fontSize: screenWidth * 0.04),
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
                      "Create an Account",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: screenWidth * 0.06,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                SizedBox(
                  height: screenHeight * 0.04,
                ),
                Container(
                  width: screenWidth * 0.8,
                  child: Form(
                    child: Column(
                      children: [
                        CustomTextfield(
                          controller: _firstnameController,
                          hinText: "First Name",
                          icons: Icons.person_outline_outlined,
                        ),
                        SizedBox(
                          height: screenWidth * 0.04,
                        ),
                        CustomTextfield(
                          controller: _lastnameController,
                          hinText: "Last Name",
                          icons: Icons.person_outline_outlined,
                        ),
                        SizedBox(
                          height: screenWidth * 0.04,
                        ),
                        CustomTextfield(
                          controller: _emailController,
                          hinText: "Email",
                          icons: Icons.email_outlined,
                        ),
                        SizedBox(
                          height: screenWidth * 0.04,
                        ),
                        CustomTextfield(
                          controller: _passwordController,
                          hinText: "Password",
                          icons: Fitnestx.lock,
                        ),
                        SizedBox(
                          height: screenWidth * 0.03,
                        ),
                        const PrivacyPolicyChackbox(),
                        SizedBox(
                          height: screenHeight * 0.17,
                        ),
                      ],
                    ),
                  ),
                ),
                BlocBuilder<PrivacyPolicyCubit, bool>(
                  builder: (context, state) {
                    return CustomElevetadButton(
                      onPressed: state
                          ? () {
                              context.read<AuthenticationBloc>().add(
                                  EmailSignUpRequested(
                                      firstname: _firstnameController.text,
                                      lastname: _lastnameController.text,
                                      email: _emailController.text,
                                      password: _passwordController.text));
                            }
                          : null,
                      text: "Register",
                      height: screenHeight * 0.07,
                      width: screenWidth * 0.9,
                    );
                  },
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Expanded(
                        child: Divider(
                          color: AppColors.gray_3,
                        ),
                        flex: 2,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.02),
                        child: const Text(
                          "Or",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: AppColors.blackColor),
                        ),
                      ),
                      const Expanded(
                        child: Divider(
                          color: AppColors.gray_3,
                        ),
                        flex: 2,
                      )
                    ],
                  ),
                ),
                BlocBuilder<PrivacyPolicyCubit, bool>(
                  builder: (context, state) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Opacity(
                          opacity: state ? 1.0 : 0.5,
                          child: GestureDetector(
                            onTap: state
                                ? () async {
                                    print("Google TIklandı");
                                    await SignInWithGoogle();
                                  }
                                : null,
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
                        ),
                        SizedBox(
                          width: screenWidth * 0.04,
                        ),
                        Opacity(
                          opacity: state ? 1.0 : 0.5,
                          child: GestureDetector(
                            onTap: state
                                ? () async {
                                    print("Face Tıklandı");
                                    await signInWithFacebook();
                                  }
                                : null,
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
                        ),
                      ],
                    );
                  },
                ),
                SizedBox(
                  height: screenHeight * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                        text: "Already have an account? ",
                        style: TextStyle(
                            fontSize: screenWidth * 0.04,
                            color: AppColors.blackColor),
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
                                          LoginScreen(),
                                      transitionDuration: Duration.zero,
                                      reverseTransitionDuration:
                                          Duration.zero));
                            },
                            child: Text("Login",
                                style: TextStyle(
                                    fontSize: screenWidth * 0.04,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white)),
                          ),
                        ),
                      ),
                    ]))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
