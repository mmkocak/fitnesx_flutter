import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';

class GenderBloc extends Cubit<String?>{
  GenderBloc() : super(null);
  void SelectGender(String gender){
    emit(gender);
  }

}