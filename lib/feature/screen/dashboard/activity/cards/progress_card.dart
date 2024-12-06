import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ProgressChart extends StatelessWidget {
  const ProgressChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16.0),
        child: AspectRatio(
          aspectRatio: 1.7,
          child: BarChart(
            BarChartData(
              alignment: BarChartAlignment.spaceAround,
              maxY: 1,
              barTouchData: BarTouchData(enabled: false),
              titlesData: FlTitlesData(
                leftTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                rightTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                topTitles: AxisTitles(
                  sideTitles: SideTitles(showTitles: false),
                ),
                bottomTitles: AxisTitles(
                  sideTitles: SideTitles(
                    showTitles: true,
                    getTitlesWidget: (double value, TitleMeta meta) {
                      const style = TextStyle(
                        color: AppColors.gray_1,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      );
                      switch (value.toInt()) {
                        case 0:
                          return const Text('Sun', style: style);
                        case 1:
                          return const Text('Mon', style: style);
                        case 2:
                          return const Text('Tue', style: style);
                        case 3:
                          return const Text('Wed', style: style);
                        case 4:
                          return const Text('Thu', style: style);
                        case 5:
                          return const Text('Fri', style: style);
                        case 6:
                          return const Text('Sat', style: style);
                        default:
                          return const Text('', style: style);
                      }
                    },
                  ),
                ),
              ),
              borderData: FlBorderData(show: false),
              gridData: FlGridData(show: false),
              barGroups: _buildBarGroups(),
            ),
          ),
        ),
      ),
    );
  }

  List<BarChartGroupData> _buildBarGroups() {
    final data = [0.3, 0.7, 0.4, 0.9, 0.5, 0.6, 0.4]; // Haftalık değerler

    return List.generate(data.length, (index) {
      final gradientColors = index % 2 == 0
          ? [AppColors.brandColorsOne, AppColors.brandColorTwo]
          : [AppColors.purple_1, AppColors.purple_2];
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: data[index],
            width: 28,
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: gradientColors,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            backDrawRodData: BackgroundBarChartRodData(
              show: true,
              toY: 1, // Arka plan çubuğunun tam boyu
              color: AppColors.borderColor, // Çubuğun boş kısımlarındaki gri renk
            ),
          ),
        ],
        showingTooltipIndicators: [],
      );
    });
  }
}
