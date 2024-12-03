import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';

mixin PieChartSectionDataMixin {
  List<PieChartSectionData> buildPieChartSection() {
    return [
      PieChartSectionData(
        color: AppColors.purple_1,
        value: 20.1,
        title: "20.1",
        titleStyle: const TextStyle(
          color: AppColors.whiteColor,
          fontFamily: "Poppins",
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
        radius: 65,
      ),
      PieChartSectionData(
        color: AppColors.whiteColor,
        value: 79.9,
        title: "",
        radius: 60,
      )
    ];
  }
}
