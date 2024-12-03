import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';

class ActivityContainer extends StatelessWidget {
  const ActivityContainer({
    super.key,
    required this.screenWidth,
    required this.screenHeight,
  });

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
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
          Padding(
            padding: EdgeInsets.all(16.0),
            child: LineChart(
              LineChartData(
                minY: 60,
                maxY: 100,
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
                      )),
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
    );
  }
}
