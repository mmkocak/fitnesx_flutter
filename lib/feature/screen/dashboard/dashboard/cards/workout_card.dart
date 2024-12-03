import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';

class WorkoutCard extends StatelessWidget {
  final String title;
  final String calories;
  final String time;
  final double progress;
  final String image;

  const WorkoutCard({
    required this.title,
    required this.calories,
    required this.time,
    required this.progress,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(image),
              backgroundColor: AppColors.brandColorTwo,
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    "$calories | $time",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(height: 8),
                  LinearProgressIndicator(

                    value: progress,
                    color: Colors.purple,
                    backgroundColor: Colors.grey[300],
                  ),
                ],
              ),
            ),
            Icon(Icons.arrow_forward_ios, color: Colors.purple),
          ],
        ),
      ),
    );
  }
}
