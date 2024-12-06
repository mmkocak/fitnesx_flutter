import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';

class LastetActivityCard extends StatelessWidget {
  final String title;

  final String time;

  final String image;

  LastetActivityCard({
    Key? key,
    required this.title,
    required this.time,
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
        padding: EdgeInsets.all(screenWidth * 0.02),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 25,
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
                          fontSize: screenWidth * 0.03,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.01),
                      Text(
                        " $time",
                        style: TextStyle(
                          fontSize: screenWidth * 0.025,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.more_vert, color: AppColors.gray_2),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
