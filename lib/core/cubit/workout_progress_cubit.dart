import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';

class WorkoutProgressCubit extends Cubit<String?>{
  WorkoutProgressCubit():super(null);

  selectWorkout(String newvalue){
      emit(newvalue);
  }
}