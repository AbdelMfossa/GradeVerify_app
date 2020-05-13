import 'dart:async';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    Timer(
      Duration(seconds:5),
      ()=>Navigator.of(context).pushReplacementNamed('/startPage'),
        );

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Stack(
        fit:StackFit.expand,
        children: <Widget>[
          Container(
            decoration:BoxDecoration(
              color:Color(0xFFe22f4d),
            ),
          ),
          Column(
            children:<Widget>[
              Expanded(
                flex:2 ,
                child: Container(
                  child:Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor:Colors.transparent,
                        radius:70.0,
                        child:Image(
                          image: AssetImage("assets/images/logo cercle rouge.png"),
                           fit: BoxFit.cover,
                          )
                      ),
                      Padding(padding:EdgeInsets.only(top:15.0)),
                    ],
                  )
                ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:<Widget>[
                       CircularProgressIndicator(),
                      Padding(padding: EdgeInsets.only(top: 20.0)),
                      Text(
                        "Verifiez l'authenticité des diplômes !" ,
                        style: TextStyle(
                          color:Colors.white,
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                          ),
                        )
                    ]
                  )
            
              )
            ]
          ),
        ],
      )
    );
  }
}