import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';

class DateContainerWidget extends StatelessWidget {
  const DateContainerWidget({
    super.key,
    required this.screenHeight,
    required this.screenWidth,
  });

  final double screenHeight;
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: screenHeight * 0.06,
      width: screenWidth * 0.85,
      decoration: BoxDecoration(
        color: AppColors.borderColor,
        border: Border.all(color: AppColors.borderColor),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          SizedBox(width: screenWidth * 0.02),
          Icon(
            Fitnestx.calendars,
            color: AppColors.gray_1,
            size: screenWidth * 0.07,
          ),
          SizedBox(
            width: screenWidth * 0.03,
          ),
          BlocBuilder<DateCubit, DateTime?>(
            builder: (context, selectedDate) {
              return Expanded(
                child: Text(
                  selectedDate == null
                      ? "Date of brith"
                      : "${selectedDate.toLocal()}"
                          .split(' ')[0],
                  style: TextStyle(
                      fontFamily: "Poppins",
                      color: selectedDate == null
                          ? AppColors.gray_1
                          : AppColors.blackColor,
                      fontSize: screenWidth * 0.03),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}