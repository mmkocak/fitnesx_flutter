import 'package:fitnesx_flutter/feature/screen/dashboard/dashboard/mixins/pie_section_mixin.dart';
import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';
import 'package:fl_chart/fl_chart.dart';

class MassIndexContainer extends StatelessWidget with PieChartSectionDataMixin {
  const MassIndexContainer({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Expanded(
            flex: 2,
            child:Padding(padding: EdgeInsets.only(left: screenWidth * 0.05),
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
                  sections: buildPieChartSection(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}