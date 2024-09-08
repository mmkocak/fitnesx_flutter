import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';
void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
 runApp(const fitnesX()); 
}
class fitnesX extends StatelessWidget {
const fitnesX({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return  MultiBlocProvider(
      providers: [
        BlocProvider(create: (context)=>PrivacyPolicyCubit()),
      ],
      child: MaterialApp(
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.white
        ),
        debugShowCheckedModeBanner: false,
        home: const SplashScreen(),
      ),
    );
  }
}