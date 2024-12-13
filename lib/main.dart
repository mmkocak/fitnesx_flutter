import 'package:fitnesx_flutter/core/cubit/go_back_cubit.dart';
import 'package:fitnesx_flutter/core/cubit/notification_switch_cubit.dart';
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
   SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, 
    statusBarIconBrightness: Brightness.dark, 
  ));
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
        BlocProvider(
          create: (context) => NavigationCubit(),
        ),
        BlocProvider(
          create: (context) => NotificationSwitchCubit(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: Colors.white),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    );
  }
}
