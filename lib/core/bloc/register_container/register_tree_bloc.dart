import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'register_tree_event.dart';
part 'register_tree_state.dart';


class RegisterTreeBloc extends Bloc<RegisterTreeEvent, RegisterTreeState> {
  int currentIndex = 0;

  RegisterTreeBloc() : super(RegisterTreeContent(0)) {
    on<ConfirmButtonPressed>(_onConfirmButtonPressed);
  }

  void _onConfirmButtonPressed(
      ConfirmButtonPressed event, Emitter<RegisterTreeState> emit) {
    if (currentIndex < 2) {
      currentIndex++;
      emit(RegisterTreeContent(currentIndex));
    } else {
      emit(RegisterTreeNavigate());
    }
  }
}
