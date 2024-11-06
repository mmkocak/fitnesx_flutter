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
class EmailSignUpRequested extends AuthenticationEvent{
  final String firstname;
  final String lastname;
  final String email;
  final String password;
  EmailSignUpRequested({required this.firstname, required this.lastname, required this.email, required this.password});

  @override
  List<Object> get props => [firstname, lastname, email,password]; 
}