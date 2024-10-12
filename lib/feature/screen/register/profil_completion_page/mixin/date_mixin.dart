import 'package:fitnesx_flutter/feature/screen/register/profil_completion_page/cubit/date_cubit.dart';
import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';

DateTime selectedDate = DateTime.now();

mixin DateTimePicker {
  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
        initialDate: context.read<DateCubit>().state);
        if(picked != null){
          context.read<DateCubit>().selectDate(picked);
        }
  }
}
