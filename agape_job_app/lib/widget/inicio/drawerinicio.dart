import 'package:flutter/material.dart';

import '../../main.dart';

class DrawerInicio extends StatefulWidget {
  @override
  _DrawerInicioState createState() => _DrawerInicioState();
}

class _DrawerInicioState extends State<DrawerInicio> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container(
            margin: EdgeInsets.only(top:50),
            child: ListTile(title:
              Row (
                children: [
                  Text("Trabajos",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w400),),
                  TextButton.icon(onPressed: ()=>{}, icon: Icon(Icons.work,color: Colors.black,),label: Text(""),)
                ],
              ),
              onTap:(){
                Navigator.of(context).popAndPushNamed("/inicio");

            },),
          ),
          Container(
            margin: EdgeInsets.only(top:50),
            child: ListTile(title:
              Row (
              children: [
                Text("Aplicaciones",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w400),),
              TextButton.icon(onPressed: ()=>{}, icon: Icon(Icons.assignment,color: Colors.black,),label: Text(""),)
              ],
              ),

              onTap: (){
              Navigator.of(context).popAndPushNamed("/aplicaciones");
            },),
          ),
          Container(
            margin: EdgeInsets.only(top:50),
            child: ListTile(title:
            Row (
            children: [
              Text("Perfil",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w400),),
              TextButton.icon(onPressed: ()=>{}, icon: Icon(Icons.account_circle_rounded,color: Colors.black,),label: Text(""),)
              ],
            ),

              onTap:(){ Navigator.of(context).pushNamed("/perfil");}
              ,),
          ),
          Container(
            margin: EdgeInsets.only(top:50),
            child: ListTile(title:
            Row (
              children: [
                Text("Configuración",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w400),),
                TextButton.icon(onPressed: ()=>{}, icon: Icon(Icons.admin_panel_settings,color: Colors.black,),label: Text(""),)
              ],
            ),

              onTap:(){ Navigator.of(context).pushNamed("/configuracion");}
              ,),
          ),
          Container(
            margin: EdgeInsets.only(top:50),
            child: ListTile(title:
            Row (
              children: [
                Text("Salir",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w400),),
                TextButton.icon(onPressed: ()=>{}, icon: Icon(Icons.logout,color: Colors.black,),label: Text(""),)
              ],
            ),

              onTap:(){

                if (Navigator.of(context).canPop()) {
                  Navigator.pop(context);
                  Navigator.of(context).popAndPushNamed("/login");
                }
              }
              ,),
          )
        ],
      ),
    );
  }
}
