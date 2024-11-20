import 'package:fitnesx_flutter/core/bloc/auth/authentication_bloc.dart';
import 'package:fitnesx_flutter/core/bloc/auth/authentication_state.dart';
import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';
import 'package:fitnesx_flutter/fitnestx_icons.dart';
import 'package:fl_chart/fl_chart.dart';

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
                  return Scaffold(
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
                    Container(
                      height: screenHeight * 0.18,
                      width: screenWidth * 0.9,
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                              colors: <Color>[
                                AppColors.brandColorTwo,
                                AppColors.brandColorsOne
                              ],
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight),
                          borderRadius: BorderRadius.circular(16)),
                      child: Row(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: screenWidth * 0.05),
                            child: Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "BMI (Body Mass Index)",
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: screenWidth * 0.04,
                                      color: AppColors.whiteColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.01,
                                  ),
                                  Text(
                                    "You have a normal weight",
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: screenWidth * 0.03,
                                      color: AppColors.whiteColor,
                                    ),
                                  ),
                                  SizedBox(
                                    height: screenHeight * 0.02,
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Container(
                                      width: screenWidth * 0.2,
                                      height: screenWidth * 0.09,
                                      decoration: BoxDecoration(
                                        gradient: const LinearGradient(
                                            colors: <Color>[
                                              AppColors.purple_1,
                                              AppColors.purple_2
                                            ],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight),
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: Center(
                                        child: Text(
                                          "View More",
                                          style: TextStyle(
                                              color: AppColors.whiteColor,
                                              fontFamily: "Poppins",
                                              fontWeight: FontWeight.bold,
                                              fontSize: screenWidth * 0.03),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              child: PieChart(
                                PieChartData(
                                  sectionsSpace: 0,
                                  centerSpaceRadius: 0,
                                  sections: _buildPieChartSection(),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    _buildBubble(left: -35, top: 140, size: 90),
                    _buildBubble(left: 100, top: 10, size: 10),
                    _buildBubble(left: 150, top: 130, size: 10),
                    _buildBubble(left: 200, top: 20, size: 10),
                    _buildBubble(left: 220, top: 150, size: 10),
                    _buildBubble(left: 360, top: 120, size: 100),
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

Widget _buildBubble(
    {required double left, required double top, required double size}) {
  return Positioned(
      left: left,
      top: top,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.whiteColor.withOpacity(0.2),
        ),
      ));
}

List<PieChartSectionData> _buildPieChartSection() {
  return [
    PieChartSectionData(
      color: AppColors.purple_1,
      value: 20.1,
      title: "20.1",
      titleStyle: const TextStyle(
        color: AppColors.whiteColor,
        fontFamily: "Poppins",
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      radius: 65,
    ),
    PieChartSectionData(
      color: AppColors.whiteColor,
      value: 79.9,
      title: "",
      radius: 60,
    )
  ];
}
