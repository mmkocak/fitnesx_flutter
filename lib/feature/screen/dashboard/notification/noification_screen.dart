import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';
import 'package:fitnesx_flutter/feature/utils/widgets/custom_appbar_widget.dart';

class NoificationScreen extends StatefulWidget {
  const NoificationScreen({Key? key}) : super(key: key);

  @override
  _NoificationScreenState createState() => _NoificationScreenState();
}

class _NoificationScreenState extends State<NoificationScreen> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: CustomAppbarWidget(text: "Notification",),
    );
}
}