

import 'package:GradeVerify_app/widgets/verifcationWidget.dart';
import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
   
  @override
  Widget build(BuildContext context) {
    return ListView(
     children: <Widget>[
       Padding(
         padding: EdgeInsets.all(20.0),
         child: Column(
           children:<Widget>[
             SizedBox(height:5.0),
            Container(
              child:Center(
                child: Container(
                  width:300 ,
                  height:120 ,
                  child: Image(
                    image: AssetImage("assets/images/bp-1.png"),
                    fit: BoxFit.fitHeight,
                    )
                    )
                    ),
              ),
              SizedBox(height:20),
            VerificationWidget(),
           ]
         ),
       )
     ],
    );
  }
}