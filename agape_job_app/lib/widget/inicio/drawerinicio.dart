import 'package:flutter/material.dart';

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
            child: ListTile(title: Text("Trabajos",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w400),),),
          ),
          Container(
            margin: EdgeInsets.only(top:50),
            child: ListTile(title: Text("Aplicaciones",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w400),),),
          ),
          Container(
            margin: EdgeInsets.only(top:50),
            child: ListTile(title: Text("Perfil",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w400),),
              onTap:(){ Navigator.of(context).pushNamed("/perfil");}
              ,),
          ),
          Container(
            margin: EdgeInsets.only(top:50),
            child: ListTile(title: Text("Notificaciones",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w400),),),
          ),
        ],
      ),
    );
  }
}
