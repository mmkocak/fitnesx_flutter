import 'package:fitnesx_flutter/feature/screen/dashboard/dashboard/widgets/time_update_row.dart';
import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';

class TimeUpdates extends StatelessWidget {
const TimeUpdates({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TimeUpdateRow(timeRange: '6am - 8am', amount: '600ml'),
        TimeUpdateRow(timeRange: '9am - 11am', amount: '500ml'),
        TimeUpdateRow(timeRange: '11am - 2pm', amount: '1000ml'),
        TimeUpdateRow(timeRange: '2pm - 4pm', amount: '700ml'),
        TimeUpdateRow(timeRange: '4pm - now', amount: '900ml'),
      ],
    );
  }
}