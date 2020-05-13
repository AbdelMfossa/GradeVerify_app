import 'package:GradeVerify_app/pages/SplashScreen.dart';
import 'package:GradeVerify_app/pages/startpage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Grade verify',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        accentColor: Colors.green,
        //primarySwatch: Colors.blue,
        
      ),
      home: SplashScreen(),
      routes: {
        '/startPage':(context)=>StartPage()
      },
    );
  }
}

