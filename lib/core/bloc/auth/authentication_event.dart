import 'package:equatable/equatable.dart';

abstract class AuthenticationEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GoogleSignInRequested extends AuthenticationEvent{}
class FacebookSignInRequested extends AuthenticationEvent{}
class SignOutRequested extends AuthenticationEvent{}
class EmailSignInRequested extends AuthenticationEvent{
  final String email;
  final String password;
  EmailSignInRequested({required this.email, required this.password});

  @override
  
  List<Object> get props => [email, password];
}