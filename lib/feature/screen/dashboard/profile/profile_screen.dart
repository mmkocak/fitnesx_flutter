import 'package:fitnesx_flutter/feature/screen/dashboard/profile/cards/account_cards.dart';
import 'package:fitnesx_flutter/feature/screen/dashboard/profile/cards/other_card.dart';
import 'package:fitnesx_flutter/feature/screen/dashboard/profile/cards/profile_notification_card.dart';
import 'package:fitnesx_flutter/feature/screen/dashboard/profile/widgets/custom_profile_container_widget.dart';
import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';
import 'package:fitnesx_flutter/feature/utils/widgets/custom_appbar_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: CustomAppbarWidget(
        text: "Profile",
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              BlocBuilder<AuthenticationBloc, AuthenticationState>(
                builder: (context, state) {
                  if (state is AuthenticationAuthenticated) {
                    final user = state.user;
                    final firstname =
                        user.displayName?.replaceAll(RegExp(r'[^\w\s]'), '') ??
                            '';
                    return Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: screenHeight * 0.06,
                            height: screenHeight * 0.08,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  colors: <Color>[
                                    AppColors.brandColorTwo,
                                    AppColors.brandColorsOne
                                  ],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                )),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: EdgeInsets.all(screenHeight * 0.01),
                                child: ClipOval(
                                  child: Image.asset(
                                    "assets/images/Layer 2.png",
                                    fit: BoxFit.cover,
                                    width: screenHeight * 0.06,
                                    height: screenHeight * 0.06,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: screenWidth * 0.03,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "$firstname",
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: screenWidth * 0.04,
                                    fontWeight: FontWeight.w800),
                              ),
                              SizedBox(
                                height: screenHeight * 0.01,
                              ),
                              Text(
                                "Lose a Fat Program",
                                style: TextStyle(
                                    fontFamily: "Poppins",
                                    fontSize: screenWidth * 0.03,
                                    color: AppColors.gray_2),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: screenWidth * 0.03,
                          ),
                          Container(
                            width: screenHeight * 0.09,
                            height: screenHeight * 0.04,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              gradient: LinearGradient(
                                colors: <Color>[
                                  AppColors.brandColorTwo,
                                  AppColors.brandColorsOne
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                "Edit",
                                style: TextStyle(
                                    color: AppColors.whiteColor,
                                    fontFamily: "Poppins",
                                    fontSize: screenWidth * 0.03,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return const Center(child: Text('Please login to continue.'));
                  }
                },
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomProfileContainerWidget(
                      text: "180 cm",
                      property: "Height",
                    ),
                    SizedBox(
                      width: screenWidth * 0.03,
                    ),
                    CustomProfileContainerWidget(
                      text: "65 kg",
                      property: "Weight",
                    ),
                    SizedBox(
                      width: screenWidth * 0.03,
                    ),
                    CustomProfileContainerWidget(
                      text: "22 yo",
                      property: "Age",
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              AccountCards(),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              ProfileNotificationCard(),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              OtherCard()
            ],
          ),
        ),
      ),
    );
  }
}
