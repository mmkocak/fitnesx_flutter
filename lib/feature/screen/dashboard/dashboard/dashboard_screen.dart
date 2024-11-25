import 'package:fitnesx_flutter/core/bloc/auth/authentication_bloc.dart';
import 'package:fitnesx_flutter/core/bloc/auth/authentication_state.dart';
import 'package:fitnesx_flutter/feature/screen/dashboard/dashboard/mixins/build_bubble_mixin.dart';
import 'package:fitnesx_flutter/feature/screen/dashboard/dashboard/widgets/chack_container.dart';
import 'package:fitnesx_flutter/feature/screen/dashboard/dashboard/widgets/mass_index_container.dart';
import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';
import 'package:fitnesx_flutter/fitnestx_icons.dart';
import 'package:fl_chart/fl_chart.dart';

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
          child: Column(children: [
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
                            top: screenHeight * 0.06, left: screenWidth * 0.04),
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
            SizedBox(
              height: screenHeight * 0.03,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
              child: ChackContainer(
                screenWidth: screenWidth,
                screenHeight: screenHeight,
              ),
            ),
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
            Container(
              width: screenWidth * 0.9,
              height: screenHeight * 0.2,
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: <Color>[
                    Color(0x5092A3FD),
                    Color(0x509DCEFF),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Stack(
                children: [
                  Padding(padding: EdgeInsets.all(16.0),
                  child: LineChart(
                    LineChartData(
                      minY: 60,
                      maxY:100,
                      gridData: FlGridData(show: false),
                      titlesData: FlTitlesData(show: false),
                      borderData: FlBorderData(show: false),
                      lineBarsData: [
                        LineChartBarData(
                          spots: [
                            FlSpot(0, 78),
                            FlSpot(1, 85),
                            FlSpot(2, 75),
                            FlSpot(3, 90),
                            FlSpot(4, 80),
                          ],
                          isCurved: true,
                          color: AppColors.brandColorsOne,
                          barWidth: 3,
                          isStrokeCapRound: true,
                          belowBarData: BarAreaData(
                            show: true,
                            color: AppColors.brandColorTwo.withOpacity(0.2),
                          )
                        ),
                      ], 
                    ),
                  ),
                  ),
                   Positioned(
                  top: 60,
                  right: 50,
                  child: Column(
                    children: [
                      Icon(Icons.circle, size: 8, color: Colors.purple),
                      SizedBox(height: 4),
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.purple.withOpacity(0.9),
                          borderRadius: BorderRadius.circular(16),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        child: Text(
                          '3mins ago',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16, left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Heart Rate',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black54,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 4),
                      Text(
                        '78 BPM',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
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
