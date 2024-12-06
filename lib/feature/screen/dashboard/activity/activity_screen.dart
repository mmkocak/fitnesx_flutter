import 'package:fitnesx_flutter/feature/screen/dashboard/activity/activity_list.dart';
import 'package:fitnesx_flutter/feature/screen/dashboard/activity/widgets/today_target_container_widget.dart';
import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';
import 'package:fitnesx_flutter/feature/utils/widgets/custom_appbar_widget.dart';
import 'package:fitnesx_flutter/feature/screen/dashboard/activity/cards/progress_card.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({Key? key}) : super(key: key);

  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppbarWidget(
        text: "Activity Tracker",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              vertical: screenHeight * 0.01, horizontal: screenWidth * 0.04),
          child: Column(
            children: [
              TodayTargetContainerWidget(),
              SizedBox(
                height: screenHeight * 0.03,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                child: BlocBuilder<WorkoutProgressCubit, String?>(
                  builder: (context, state) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Activity Progress",
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
              SizedBox(
                height: screenHeight * 0.02,
              ),
              ProgressChart(),
              SizedBox(height: screenHeight * 0.02,),
               Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Latest Activity",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          fontSize: screenWidth * 0.05,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // Implement your see all functionality here
                        },
                        child: Text(
                          "See All",
                          style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: screenWidth * 0.03,
                              fontWeight: FontWeight.bold,
                              color: AppColors.brandColorsOne),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.02,),
                ActivityList()
            ],
          ),
        ),
      ),
    );
  }
}
