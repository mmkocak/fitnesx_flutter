import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';

class PrivacyPolicyCubit extends Cubit<bool>{
  PrivacyPolicyCubit() : super(false);

  void toggleCheckbox() => emit(!state);
}