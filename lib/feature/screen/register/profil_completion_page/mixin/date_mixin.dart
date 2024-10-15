import 'package:fitnesx_flutter/feature/screen/register/profil_completion_page/cubit/date_cubit.dart';
import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';

DateTime selectedDate = DateTime.now();

mixin DateTimePicker {
  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      
        context: context,
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
        initialDate: context.read<DateCubit>().state,
        builder: (BuildContext context, Widget? child) {
          return Theme(data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: Colors.purple,
              onPrimary: Colors.white,
              onSurface: Colors.black, 
            ),
            dialogBackgroundColor: Colors.blueGrey
          ) , child: child!);
        },
        );
        if(picked != null){
          context.read<DateCubit>().selectDate(picked);
        }
  }
}
