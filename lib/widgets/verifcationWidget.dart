import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class VerificationWidget extends StatefulWidget {
  VerificationWidget({Key key}) : super(key: key);

  @override
  _VerificationWidgetState createState() => _VerificationWidgetState();
}

class _VerificationWidgetState extends State<VerificationWidget> {
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  ValueChanged _onChanged = (val) => print(val);
  var universities=['FacScience UY1','FALSh UY1' , 'ENAM UY1','ENSTP UY1'];
  var typespaper=["transtript" , "Diplomat"];
  @override
  Widget build(BuildContext context) {
    return FormBuilder(
       key: _fbKey,
       autovalidate: true,
      child: Column(
        children:<Widget>[
           FormBuilderDropdown(
             attribute: "School", 
             allowClear: true,
             decoration:InputDecoration(
               labelText:"School",
             ),
             validators: [
                  FormBuilderValidators.required(),
                ],
                 onChanged: _onChanged,
             items: universities
             .map((university)=>DropdownMenuItem(
                value:university,
                child:Text('$university'),
             )).toList(),
             ),
            FormBuilderTextField(
              attribute: "IDDDiplomat",
              decoration: InputDecoration(
                labelText:"Diplomat IDD",
              ),
              onChanged: _onChanged,
              ),
              
              FormBuilderDropdown(
                attribute: "Diplomat or Transcript ?",
                decoration: InputDecoration(
                  labelText: "Paper type",
                  focusColor: Color(0XFF04173f),
                ), 
                onChanged: _onChanged,
                validators: [
                  FormBuilderValidators.required(),
                ],
                items: typespaper.map((choice) => DropdownMenuItem(
                  value:choice,
                  child:Text("$choice"),
                )).toList() 
                ),
                SizedBox(height:10),
                MaterialButton(
                  minWidth: 120,
                  color: Color(0XFF04173f),
                  child: Text("Verify" ,style: TextStyle(color:Colors.white),),
                  onPressed: (){
                    if(_fbKey.currentState.saveAndValidate()){
                      print(_fbKey.currentState.value);
                    }
                    else{
                      print(_fbKey.currentState.value);
                       print("validation Failed");
                    }
                  }
                )  ,   
        ],
      )
      );
  }
}