import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';

class GenderCubit extends Cubit<String?>{
  GenderCubit():super(null);
  selectGender(String newvalue){
    emit(newvalue);
  }
}