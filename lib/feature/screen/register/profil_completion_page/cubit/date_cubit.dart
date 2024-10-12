import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';

class DateCubit extends Cubit<DateTime?>{
  DateCubit():super(null);
  selectDate(DateTime newvalue){
    emit(newvalue);
  }
}