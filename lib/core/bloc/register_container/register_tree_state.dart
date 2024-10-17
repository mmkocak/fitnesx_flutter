part of 'register_tree_bloc.dart';





abstract class RegisterTreeState extends Equatable {
  const RegisterTreeState();

  @override
  List<Object> get props => [];
}

class RegisterTreeInitial extends RegisterTreeState {}

class RegisterTreeContent extends RegisterTreeState {
  final int currentIndex;

  const RegisterTreeContent(this.currentIndex);

  @override
  List<Object> get props => [currentIndex];
}

class RegisterTreeNavigate extends RegisterTreeState {}
