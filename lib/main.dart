import 'package:fitnesx_flutter/feature/screen/dashboard/activity/activity_screen.dart';
import 'package:fitnesx_flutter/feature/screen/dashboard/notification/noification_screen.dart';
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
          create: (_) => PrivacyPolicyCubit(),
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
        BlocProvider<RegisterTreeBloc>(
          create: (context) => RegisterTreeBloc(),
        ),
        BlocProvider(
          create: (context) => PasswordVisibilityBloc(),
        ),
        BlocProvider(
          create: (context) => WorkoutProgressCubit(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: Colors.white),
        debugShowCheckedModeBanner: false,
        home: LoginScreen(),
      ),
    );
  }
}
