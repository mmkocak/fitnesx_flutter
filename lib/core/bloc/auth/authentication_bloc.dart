import 'package:fitnesx_flutter/core/bloc/auth/authentication_event.dart';
import 'package:fitnesx_flutter/core/bloc/auth/authentication_state.dart';
import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<GoogleSignInRequested>(_googleSignIn);
    on<FacebookSignInRequested>(_facebookSignIn);
    on<SignOutRequested>(_signOut);
    on<EmailSignInRequested>(_emailSignIn);
    on<EmailSignUpRequested>(_emailSignUp);
  }

// Googlea
  Future<void> _googleSignIn(
      GoogleSignInRequested event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleuser = await googleSignIn.signIn();
      if (googleuser == null) {
        emit(AuthenticationUnAuthenticated());
        return;
      }
      final GoogleSignInAuthentication googleAuth =
          await googleuser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );
      final UserCredential userCredential =
          await _firebaseAuth.signInWithCredential(credential);
      emit(AuthenticationAuthenticated(userCredential.user!));
    } catch (e) {
      emit(AuthenticationFailure(e.toString()));
    }
  }
// Facebook

  Future<void> _facebookSignIn(
      FacebookSignInRequested event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();
      if (loginResult.status == LoginStatus.success) {
        final AuthCredential credential = FacebookAuthProvider.credential(
            loginResult.accessToken!.tokenString);
        final UserCredential userCredential =
            await _firebaseAuth.signInWithCredential(credential);
        emit(AuthenticationAuthenticated(userCredential.user!));
      } else {
        emit(AuthenticationUnAuthenticated());
      }
    } catch (e) {
      emit(AuthenticationFailure(e.toString()));
    }
  }

// Email
  Future<void> _emailSignIn(
      EmailSignInRequested event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());
    try {
      final UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
              email: event.email.toString(),
              password: event.password.toString());
      emit(AuthenticationAuthenticated(userCredential.user!));
    } catch (e) {
      emit(AuthenticationFailure(e.toString()));
    }
  }

  // Email Signup
  Future<void> _emailSignUp(
      EmailSignUpRequested event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());
    try {
      final UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
              email: event.email, password: event.password);
      await userCredential.user!
          .updateDisplayName("${event.firstname} ${event.lastname}}");
      emit(AuthenticationAuthenticated(userCredential.user!));
    } catch (e) {
      AuthenticationFailure(e.toString());
    }
  }
  // SigOut

  Future<void> _signOut(
      SignOutRequested event, Emitter<AuthenticationState> emit) async {
    emit(AuthenticationLoading());
    await _firebaseAuth.signOut();
    emit(AuthenticationUnAuthenticated());
  }
}
