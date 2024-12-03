import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';

class ChackContainer extends StatelessWidget {
  const ChackContainer({
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
      height: screenHeight * 0.08,
      decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: <Color>[
              Color(0x5092A3FD),
              Color(0x509DCEFF),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: EdgeInsets.only(
            left: screenWidth * 0.05, right: screenWidth * 0.05),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 7,
              child: Text(
                "Today Target",
                style: TextStyle(
                    fontFamily: "Poppins",
                    color: AppColors.blackColor,
                    fontWeight: FontWeight.w600,
                    fontSize: screenWidth * 0.04),
              ),
            ),
            Expanded(
              flex: 3,
              child: GestureDetector(
                onTap: () {
                  debugPrint("Check buton tıklandı");
                },
                child: Container(
                  width: screenWidth * 0.01,
                  height: screenHeight * 0.04,
                  decoration: BoxDecoration(
                      gradient: const LinearGradient(colors: <Color>[
                        AppColors.brandColorsOne,
                        AppColors.brandColorTwo
                      ], begin: Alignment.topLeft, end: Alignment.bottomRight),
                      borderRadius: BorderRadius.circular(14)),
                  child: Center(
                      child: Text(
                    "Check",
                    style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: screenWidth * 0.04,
                        fontFamily: "Poppins"),
                  )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
