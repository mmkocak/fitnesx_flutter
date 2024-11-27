import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';

class TimeUpdateRow extends StatelessWidget {
  final String timeRange;
  final String amount;
  const TimeUpdateRow({Key? key, required this.timeRange, required this.amount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.sizeOf(context).width;
    double screenHeight = MediaQuery.sizeOf(context).height;
    return Padding(
        padding: EdgeInsets.symmetric(vertical: screenWidth * 0.01),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                        colors: <Color>[AppColors.purple_1, AppColors.purple_2],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight),
                  ),
                  child: CircleAvatar(
                    radius: 4,
                    backgroundColor: Colors.transparent,
                  ),
                ),
                SizedBox(
                  width: screenWidth * 0.02,
                ),
                Text(
                  timeRange,
                  style: TextStyle(
                    color: AppColors.gray_2,
                    fontFamily: "Poppins",
                    fontSize: screenWidth * 0.03,
                  ),
                ),
                
               
              ],
            ),
            SizedBox(height: screenHeight * 0.01,),
            Row(children: [
              SizedBox(width: screenWidth * 0.01,),
               ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(colors: <Color>[
                      AppColors.purple_1,
                      AppColors.purple_2
                    ], begin: Alignment.topLeft, end: Alignment.bottomRight)
                        .createShader(bounds);
                  },
                  child: Text(
                    amount,
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: screenWidth * 0.03,
                    ),
                  ),
                ),
            ],)
          ],
        ));
  }
}
