import 'package:fitnesx_flutter/feature/screen/dashboard/notification/cards/notofiaction_card.dart';
import 'package:fitnesx_flutter/feature/screen/dashboard/notification/notification_list.dart';
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
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: CustomAppbarWidget(text: "Notification",),
      body: Column(
        children: [
          NotificationList(),
        ],
      )
    );
}
}