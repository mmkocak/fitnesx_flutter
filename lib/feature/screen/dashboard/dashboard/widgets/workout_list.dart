import 'package:fitnesx_flutter/feature/screen/dashboard/dashboard/cards/workout_card.dart';
import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';

class WorkoutList extends StatelessWidget {
  final List<Map<String, dynamic>> workouts = [
    {
      "title": "Fullbody Workout",
      "calories": "180 Calories Burn",
      "time": "20 minutes",
      "progress": 0.6,
      "image": "assets/images/fullbody.png",
    },
    {
      "title": "Lowerbody Workout",
      "calories": "200 Calories Burn",
      "time": "30 minutes",
      "progress": 0.8,
      "image": "assets/images/lowebody-workout 1.png",
    },
    {
      "title": "Cardio Blast",
      "calories": "250 Calories Burn",
      "time": "40 minutes",
      "progress": 0.9,
      "image": "assets/images/Character.png",
    },
  ];
 WorkoutList({ Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context){
    return  ListView.builder(
      padding: const EdgeInsets.all(16.0),
       shrinkWrap: true, 
      physics: NeverScrollableScrollPhysics(),
      itemCount: 3,
      itemBuilder: (context, index) {
        final workout = workouts[index];
        return Padding(
          padding: const EdgeInsets.only(bottom: 16.0),
          child: WorkoutCard(
            title: workout["title"],
            calories: workout["calories"],
            time: workout["time"],
            progress: workout["progress"],
            image: workout["image"],
          ),
        );
      },
    );
  }
}
