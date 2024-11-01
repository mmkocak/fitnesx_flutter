import 'package:equatable/equatable.dart';
import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';

abstract class AuthenticationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GoogleSignInRequested extends AuthenticationEvent{}
class FacebookSignInRequested extends AuthenticationEvent{}
class SignOutRequested extends AuthenticationEvent{}
class EmailSignInRequested extends AuthenticationEvent{
  final TextEditingController email;
  final TextEditingController password;
  EmailSignInRequested({required this.email, required this.password});

  @override
  
  List<Object> get props => [email, password];
}