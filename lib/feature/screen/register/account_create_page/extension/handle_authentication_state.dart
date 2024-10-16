import 'package:fitnesx_flutter/core/bloc/auth/authentication_state.dart';
import 'package:fitnesx_flutter/feature/screen/register/profil_completion_page/profile_completion_screen.dart';
import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';

extension AuthenticationStateHundler on AuthenticationState {
  void handleAuthenticationState(BuildContext context) {
    if (this is AuthenticationLoading) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      );
    } else if (this is AuthenticationAuthenticated) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            pageBuilder: (context, animation, secondaryAnimation) =>
                 ProfileCompletionScreen(),
            transitionDuration: Duration.zero,
            reverseTransitionDuration: Duration.zero,
          ),
        );
      });
    } else if (this is AuthenticationFailure) {
      final failure = this as AuthenticationFailure;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Authentication failed: ${failure.error}")),
      );
    }
  }
}
