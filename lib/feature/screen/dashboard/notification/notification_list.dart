import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';
import 'package:fitnesx_flutter/feature/screen/dashboard/notification/cards/notifiaction_card.dart';

class NotificationList extends StatelessWidget {
  final List<Map<String, dynamic>> notifications = [
    {
      "title": "Hey, it’s time for lunch",
      "time": "20 minutes",
      "image": "assets/images/turtle.png",
    },
    {
      "title": "Don’t miss your lowerbody workout",
      "time": "30 minutes",
      "image": "assets/images/lowebody-workout 1.png",
    },
    {
      "title": "Hey, let’s add some meals for your b..",
      "time": "40 minutes",
      "image": "assets/images/Character.png",
    },
    {
      "title": "Congratulations, You have finished A..",
      "time": "40 minutes",
      "image": "assets/images/Character.png",
    },
    {
      "title": "Hey, it’s time for lunch",
      "time": "40 minutes",
      "image": "assets/images/Character.png",
    },
    {
      "title": "Ups, You have missed your Lowerbo...",
      "time": "40 minutes",
      "image": "assets/images/Character.png",
    },
  ];
  NotificationList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(16.0),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: notifications.length,
      itemBuilder: (context, index) {
        final workout = notifications[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: NotifiactionCard(
            title: workout["title"],
            time: workout["time"],
            image: workout["image"],
          ),
        );
      },
    );
  }
}
