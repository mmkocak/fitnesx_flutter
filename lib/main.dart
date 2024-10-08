import 'package:firebase_core/firebase_core.dart';
import 'package:fitnesx_flutter/feature/screen/register/profile_completion_page.dart';
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
      ],
      child: MaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: Colors.white),
        debugShowCheckedModeBanner: false,
        home: const ProfileCompletionPage(),
      ),
    );
  }
}
