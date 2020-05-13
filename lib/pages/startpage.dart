import 'package:GradeVerify_app/pages/FileUpload.dart';
import 'package:GradeVerify_app/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'home.dart';
import 'qrScannerPage.dart';

class StartPage extends StatefulWidget {
  StartPage({Key key}) : super(key: key);

  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  int _currentIndex=0;
  List _listpages=List();
  Widget _currentPage;
  @override
  void initState(){
    super.initState();
    _listpages
      ..add(Home())
      ..add(QrScanner())
      ..add(FileUpload());
    _currentPage=Home();
  }
  void _changePage(int selectedindex){
    setState(() {
      _currentIndex=selectedindex;
      _currentPage=_listpages[selectedindex];
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
         backgroundColor: Color(0XFFe22f4d),
         title: Center(
           child: Image(
             image: AssetImage("assets/images/icone.png"),
             width: 24.0,
             ),
         ),
           actions: <Widget>[
             IconButton(
               icon:Icon(Icons.info_outline,color: Colors.white), 
               onPressed: (){},
               )
           ],
       ),
       drawer: LeftDrawer(),
        body: SafeArea(
          child: _currentPage
          ),
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Color(0XFFe22f4d),
            currentIndex: _currentIndex,
            items: [
               BottomNavigationBarItem(
                 icon:Icon(FontAwesomeIcons.home , size: 20.0,),
                 title: Text("home",style: TextStyle(fontSize:10.0),)
                 ),
                BottomNavigationBarItem(
                icon:Icon(FontAwesomeIcons.qrcode,size: 20.0,),
                title: Text("QrScanner",style: TextStyle(fontSize:10.0),)
                ),
                BottomNavigationBarItem(
                icon:Icon(FontAwesomeIcons.fileUpload,size: 20.0,),
                title: Text("FileUpload",style: TextStyle(fontSize:10.0),)
              ),

            ],
            onTap: (selectedIndex)=>_changePage(selectedIndex),
            ),
    );
  }
}