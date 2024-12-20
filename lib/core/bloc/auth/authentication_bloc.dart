import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseStore = FirebaseFirestore.instance;
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
      await _saveuserToFireStore(
          userCredential.user, event.firstname, event.lastname);
      await userCredential.user!.updateDisplayName(
          "${event.firstname.trim()} ${event.lastname.trim()}");
      emit(AuthenticationAuthenticated(userCredential.user!));
    } catch (e) {
      debugPrint("Sign Up Error: $e");
      emit(AuthenticationFailure(e.toString()));
    }
  }

  Future<void> _saveuserToFireStore(User? user,
      [String? firstname, String? lastname]) async {
    if (user != null) {
      await _firebaseStore.collection('users').doc(user.uid).set({
        "uid": user.uid,
        "email": user.email,
        "firstname": firstname ?? '',
        "lastname": lastname ?? '',
        'signUpTimesTamp': FieldValue.serverTimestamp(),
      });
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
