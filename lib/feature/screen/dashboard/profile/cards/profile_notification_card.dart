import 'package:fitnesx_flutter/core/cubit/notification_switch_cubit.dart';
import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';

class ProfileNotificationCard extends StatelessWidget {
  const ProfileNotificationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
      child: Container(
        width: screenWidth * 0.9,
        height: screenHeight * 0.1,
        decoration: BoxDecoration(
          color: AppColors.whiteColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 5,
              spreadRadius: 2,
              offset: Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:  EdgeInsets.only(left:  screenWidth * 0.04, top: screenHeight * 0.01),
              child: Text(
                "Notification",
                style: TextStyle(
                    fontFamily: "Poppins",
                    fontSize: screenWidth * 0.04,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: screenHeight * 0.01,
            ),
            BlocBuilder<NotificationSwitchCubit, bool>(
              builder: (context, state) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
                  child: Row(
                   
                    children: [
                      ShaderMask(
                        shaderCallback: (Rect bounds) {
                          return LinearGradient(
                            colors: <Color>[
                              AppColors.brandColorTwo,
                              AppColors.brandColorsOne
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ).createShader(bounds);
                        },
                        child: Icon(
                          Fitnestx.notification,
                          color: AppColors.whiteColor,
                        ),
                      ),
                      SizedBox(
                        width: screenWidth * 0.01,
                      ),
                      Text(
                        "Pop-up Notification",
                        style: TextStyle(
                            fontFamily: "Poppins",
                            color: AppColors.gray_1,
                            fontSize: screenWidth * 0.03),
                      ),
                       SizedBox(
                        width: screenWidth * 0.3,
                      ),
                      Switch(
                        
                          activeColor: AppColors.whiteColor,
                          activeTrackColor: AppColors.purple_2,
                          inactiveTrackColor: AppColors.brandColorsOne,
                          inactiveThumbColor: AppColors.whiteColor,
                          value: context.watch<NotificationSwitchCubit>().state,
                          onChanged: (value) {
                            context
                                .read<NotificationSwitchCubit>()
                                .toggleSwitch();
                          })
                    ],
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
