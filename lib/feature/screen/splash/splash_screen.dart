import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
const SplashScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Center(
        child: Text("fitnestX", style: TextStyle(fontSize: 30, fontFamily: "Poppions", fontWeight: FontWeight.bold), ),
      ),
    );
  }
}