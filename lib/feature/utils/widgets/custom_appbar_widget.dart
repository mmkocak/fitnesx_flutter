import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';

class CustomAppbarWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final String text;
  const CustomAppbarWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: screenHeight * 0.2,
      color: AppColors.whiteColor,
      child: Padding(
          padding: EdgeInsets.symmetric(vertical: screenHeight * 0.04),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                    child: Container(
                      width: screenWidth * 0.07,
                      height: screenHeight * 0.04,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.borderColor,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.arrow_back_ios,
                          size: screenWidth * 0.06,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    text,
                    style: TextStyle(
                        fontFamily: "Poppins",
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth * 0.06,
                        color: AppColors.blackColor),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: screenWidth * 0.06),
                    child: Container(
                      width: screenWidth * 0.07,
                      height: screenHeight * 0.04,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: AppColors.borderColor,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.more_vert,
                          size: screenWidth * 0.06,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          )),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(90);
}
