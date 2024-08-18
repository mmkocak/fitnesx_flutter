import 'package:fitnesx_flutter/feature/screen/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
    return  MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Colors.white
      ),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}