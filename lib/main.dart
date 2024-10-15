import 'package:fitnesx_flutter/core/bloc/auth/authentication_bloc.dart';
import 'package:fitnesx_flutter/feature/screen/register/profil_completion_page/cubit/date_cubit.dart';
import 'package:fitnesx_flutter/feature/screen/register/profil_completion_page/cubit/gender_cubit.dart';
import 'package:fitnesx_flutter/feature/screen/register/profil_completion_page/profile_completion_screen.dart';
import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';
import 'package:fitnesx_flutter/firebase_options.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
    ],
  );
  runApp(
    const fitnesX(),
  );
}

class fitnesX extends StatelessWidget {
  const fitnesX({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PrivacyPolicyCubit(),
        ),
        BlocProvider(
          create: (context) => GenderCubit(),
        ),
         BlocProvider(
          create: (context) => DateCubit(),
        ),
        BlocProvider(
          create: (context) => AuthenticationBloc(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: Colors.white),
        debugShowCheckedModeBanner: false,
        home: const ProfileCompletionScreen(),
      ),
    );
  }
}
