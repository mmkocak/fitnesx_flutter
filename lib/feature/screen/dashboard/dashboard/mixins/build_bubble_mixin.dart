import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';
mixin BuildBubbleMixin {
Widget buildBubble(
    {required double left, required double top, required double size}) {
  return Positioned(
    left: left,
    top: top,
    child: Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.whiteColor.withOpacity(0.2),
      ),
    ),
  );
}
}
