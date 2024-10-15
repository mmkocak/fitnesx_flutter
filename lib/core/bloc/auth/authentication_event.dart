abstract class AuthenticationEvent {}

class GoogleSignInRequested extends AuthenticationEvent{}
class FacebookSignInRequested extends AuthenticationEvent{}
class SignOutRequested extends AuthenticationEvent{}