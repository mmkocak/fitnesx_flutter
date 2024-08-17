import 'package:fitnesx_flutter/feature/screen/splash/splash_screen.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
 runApp(const fitnesX()); 
}
class fitnesX extends StatelessWidget {
const fitnesX({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}