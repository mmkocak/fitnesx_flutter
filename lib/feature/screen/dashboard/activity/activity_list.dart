import 'package:fitnesx_flutter/feature/screen/dashboard/activity/cards/latest_activity_card.dart';
import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';
import 'package:fitnesx_flutter/feature/screen/dashboard/notification/cards/notifiaction_card.dart';

class ActivityList extends StatelessWidget {
  final List<Map<String, dynamic>> notifications = [
    {
      "title": "Drinking 300ml Water",
      "time": "3 minutes",
      "image": "assets/images/Layer 2.png",
    },
    {
      "title": "Eat Snack (Fitbar)",
      "time": "10 minutes",
      "image": "assets/images/yemekyerken.png",
    },
    {
      "title": "Hey, let’s add some meals for your b..",
      "time": "40 minutes",
      "image": "assets/images/Layer 2.png",
    },
  
  ];
  ActivityList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return ListView.builder(
      padding:  EdgeInsets.symmetric(vertical: screenHeight * 0.01,horizontal: screenWidth * 0.04),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        final workout = notifications[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: LastetActivityCard(
            title: workout["title"],
            time: workout["time"],
            image: workout["image"],
          ),
        );
      },
    );
  }
}
