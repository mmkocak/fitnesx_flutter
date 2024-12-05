
import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';

class NavigationCubit extends Cubit<int> {
  NavigationCubit() : super(0);

  void changeIndex(int index) => emit(index);

  void goBack(BuildContext context) {
    if(state> 0){
      emit(state-1);
    }else{
      Navigator.pop(context);
    }
   
  }
}
