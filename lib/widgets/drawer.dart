import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LeftDrawer extends StatelessWidget {
  const LeftDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children:<Widget>[
          DrawerHeader(
            child:Image(image: AssetImage("assets/images/logo GV version primale.png"),),
          ),
          Column(
            children:<Widget>[
              ListTile(
                leading: Icon(FontAwesomeIcons.award),
                title: Text("Credit"),
                onTap: (){},
                ),
              ListTile(
              leading: Icon(FontAwesomeIcons.addressCard),
              title: Text("Contact"),
              onTap: (){},
              ),
              SizedBox(height:50),
              ListTile(
              title: Text("Terms of use"),
              onTap: (){},
              ),
              ListTile(
              title: Text("About us "),
              onTap: (){},
              ),
            ]
          )
        ]
      ),

    );
  }
}