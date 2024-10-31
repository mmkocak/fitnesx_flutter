import 'package:fitnesx_flutter/core/bloc/passowrd_visibility.dart/password_visibility_event.dart';
import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';

class PasswordVisibilityBloc extends Bloc<PasswordVisibilityEvent, bool> {
  PasswordVisibilityBloc() : super(true){
    on<TogglePasswordVisibility>((event, emit){
      emit(!state);
    });
  }

  
}
