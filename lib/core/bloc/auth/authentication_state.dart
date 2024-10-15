import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';

abstract class AuthenticationState{}

class AuthenticationInitial extends AuthenticationState{}

class AuthenticationLoading extends AuthenticationState{}

class AuthenticationAuthenticated extends AuthenticationState{
  final User user;
  AuthenticationAuthenticated(this.user);
}
class AuthenticationUnAuthenticated extends AuthenticationState{}

class AuthenticationFailure extends AuthenticationState{
  final String error;
  AuthenticationFailure(this.error);
}
