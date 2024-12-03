part of "register_tree_bloc.dart";

abstract class RegisterTreeEvent extends Equatable {
  const RegisterTreeEvent();

  @override
  List<Object> get props => [];
}

class ConfirmButtonPressed extends RegisterTreeEvent {}
