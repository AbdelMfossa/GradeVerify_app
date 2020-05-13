import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class QrScanner extends StatefulWidget {
  

  QrScanner({Key key}) : super(key: key);

  @override
  _QrScannerState createState() => _QrScannerState();
}

class _QrScannerState extends State<QrScanner> {
  String  resultat="";
  
  Future scanQr() async{
    try{
      String qResult= await BarcodeScanner.scan();
      setState(() {
        resultat=qResult;
      });
    }on PlatformException catch(e){
      if(e.code==BarcodeScanner.CameraAccessDenied){
        setState(() {
          resultat="Acces A la Camera Refuser";
        });
      }else{
        setState(() {
          resultat="Unknow error $e";
        });
      } 
    }on FormatException{
       setState(() {
         resultat="You press The Back Button";
       });
    }catch(e){
      setState(() {
        resultat="Unknow Error $e";
      });
    }
  }
Widget resultWiscreen(String result){
   if (result=="Luc perin panta") return Column(children: <Widget>[Text("Element Found")],);
   else return Padding(
     padding: EdgeInsets.symmetric(vertical:200),
     child: Center(child: Text(resultat , style: TextStyle(color: Colors.red, fontSize:25.0),)),
   );
}  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: SafeArea(
      child:ListView(
        children:<Widget>[
          resultWiscreen(resultat),
        ]
      )
      ),
      floatingActionButtonLocation:FloatingActionButtonLocation.endFloat,
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0XFFe22f4d),
          child: Icon(FontAwesomeIcons.qrcode , color: Colors.white,),
          onPressed: scanQr,
        ),
    );
    
  }
}