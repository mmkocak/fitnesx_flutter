import 'package:fitnesx_flutter/core/bloc/auth/authentication_bloc.dart';
import 'package:fitnesx_flutter/core/bloc/auth/authentication_state.dart';
import 'package:fitnesx_flutter/core/cubit/workout_progress_cubit.dart';
import 'package:fitnesx_flutter/feature/screen/dashboard/dashboard/cards/calories_card.dart';
import 'package:fitnesx_flutter/feature/screen/dashboard/dashboard/cards/sleep_card.dart';
import 'package:fitnesx_flutter/feature/screen/dashboard/dashboard/cards/water_intake_card.dart';
import 'package:fitnesx_flutter/feature/screen/dashboard/dashboard/mixins/build_bubble_mixin.dart';
import 'package:fitnesx_flutter/feature/screen/dashboard/dashboard/widgets/activity_container.dart';
import 'package:fitnesx_flutter/feature/screen/dashboard/dashboard/widgets/chack_container.dart';
import 'package:fitnesx_flutter/feature/screen/dashboard/dashboard/widgets/mass_index_container.dart';
import 'package:fitnesx_flutter/feature/screen/dashboard/dashboard/widgets/workout_widget.dart';
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
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
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
                  return const Center(child: Text('Please login to continue.'));
                },
              ),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              // MassIndex Container start
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
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
              // MassIndex Container finish
              SizedBox(
                height: screenHeight * 0.03,
              ),
              // Chack Container start
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                child: ChackContainer(
                  screenWidth: screenWidth,
                  screenHeight: screenHeight,
                ),
              ),
              // Chack Container finish
              SizedBox(
                height: screenHeight * 0.05,
              ),
              Padding(
                padding: EdgeInsets.only(left: screenWidth * 0.06),
                child: Row(
                  children: [
                    Text(
                      "Activity Status",
                      style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: screenWidth * 0.05,
                          color: AppColors.blackColor,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: screenHeight * 0.025,
              ),
              // Activity Container start
              ActivityContainer(
                  screenWidth: screenWidth, screenHeight: screenHeight),
              // Activity Container finish
              SizedBox(
                height: screenHeight * 0.03,
              ),
              //Water Intake, Sleep, Calories Container Start
              Container(
                width: screenWidth * 0.9,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(child: WaterIntakeCard()),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: screenWidth * 0.04),
                            child: Column(
                              children: [
                                SleepCard(),
                                SizedBox(
                                  height: screenHeight * 0.02,
                                ),
                                CaloriesCard(),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              //Water Intake, Sleep, Calories Container finish
              SizedBox(
                height: screenHeight * 0.03,
              ),
              //Workout Progress row start
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                child: BlocBuilder<WorkoutProgressCubit, String?>(
                  builder: (context, state) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Workout Progress",
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: screenWidth * 0.05,
                              fontWeight: FontWeight.bold),
                        ),
                        Container(
                          height: screenHeight * 0.04,
                          width: screenHeight * 0.1,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            gradient: LinearGradient(
                              colors: <Color>[
                                AppColors.brandColorsOne,
                                AppColors.brandColorTwo
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                            ),
                          ),
                          child: Center(
                            child: DropdownButton<String>(
                              iconSize: screenWidth * 0.07,
                              iconEnabledColor: AppColors.whiteColor,
                              iconDisabledColor: AppColors.whiteColor,
                              value: state,
                              items: ['Weekly', 'Monthly']
                                  .map((String workout) => DropdownMenuItem(
                                      value: workout,
                                      child: Text(
                                        workout,
                                        style: TextStyle(
                                            color: AppColors.whiteColor,
                                            fontFamily: "Poppins",
                                            fontSize: screenWidth * 0.03),
                                      )))
                                  .toList(),
                              onChanged: (String? workout) {
                                context
                                    .read<WorkoutProgressCubit>()
                                    .selectWorkout(workout!);
                              },
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
              ),
              // Workout Progres finish
              SizedBox(
                height: screenHeight * 0.03,
              ),
              // Workout Start
              WorkoutWidget(),
              // workout finish
              SizedBox(
                height: screenHeight * 0.03,
              ),
              // Latest Workout Start
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Latest Workout",
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: screenWidth * 0.05,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      child: Text("See More",  style: TextStyle(
                          fontFamily: "Poppins",
                          fontWeight: FontWeight.bold,
                          fontSize: screenWidth * 0.035,
                          color: AppColors.gray_2
                        ),),
                    ),
                  ],
                ),
              ),
              // Latest Workout finish
              SizedBox(height: screenHeight * 0.03,),
            ],
          ),
        ),
      ),
    );
  }
}
