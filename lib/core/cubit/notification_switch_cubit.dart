import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';

class NotificationSwitchCubit  extends Cubit<bool> {
  NotificationSwitchCubit() : super(false);

  void toggleSwitch() {
    emit(!state);
  }
}