import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';
import 'package:fitnesx_flutter/feature/utils/widgets/custom_appbar_widget.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({ Key? key }) : super(key: key);

  @override
  _ActivityScreenState createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: CustomAppbarWidget(text: "Activity Tracker",),
     body: Padding(padding: EdgeInsets.symmetric()),
    );
  }
}