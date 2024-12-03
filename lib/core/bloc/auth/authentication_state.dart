import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';

abstract class AuthenticationState extends Equatable{
  @override
  List<Object> get props => [];
}

class AuthenticationInitial extends AuthenticationState{}

class AuthenticationLoading extends AuthenticationState{}

class AuthenticationAuthenticated extends AuthenticationState{
  final User user;
  final String? firstname;
  AuthenticationAuthenticated(this.user,[ this.firstname]);
  @override
  List<Object> get props => [user];
}
class AuthenticationUnAuthenticated extends AuthenticationState{}

class AuthenticationFailure extends AuthenticationState{
  final String error;
  AuthenticationFailure(this.error);

  @override
  List<Object> get props => [error];
}
