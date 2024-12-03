import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';

class WorkoutCard extends StatelessWidget {
  final String title;
  final String calories;
  final String time;
  final double progress;
  final String image;

  const WorkoutCard({
    required this.title,
    required this.calories,
    required this.time,
    required this.progress,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    double screenHeight = MediaQuery.sizeOf(context).height;
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.03),
        child: Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(image),
              backgroundColor: AppColors.brandColorTwo,
            ),
            SizedBox(width: screenWidth * 0.034),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: screenWidth * 0.04,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    "$calories | $time",
                    style: TextStyle(
                      fontSize: screenWidth * 0.03,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.01),
                  Stack(
                    children: [
                      Container(
                        height: screenHeight * 0.015,
                        decoration: BoxDecoration(
                          color: AppColors.borderColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      Container(
                        height: screenHeight * 0.015,
                        width: progress * MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              AppColors.brandColorsOne,
                              AppColors.brandColorTwo,
                            ],
                          ),
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: screenWidth * 0.08,
              height: screenHeight * 0.08,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: <Color>[AppColors.purple_1, AppColors.purple_2],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                border: Border.all(width: 1.0, color: Colors.transparent)
              ),
              child: Container(
                 width: screenWidth * 0.04,
              height: screenHeight * 0.04,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.whiteColor,
                ),
                child: Center(
                  child: Icon(Icons.arrow_forward_ios, color: Colors.purple)
                ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
