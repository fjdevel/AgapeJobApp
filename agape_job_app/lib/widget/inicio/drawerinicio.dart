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
          ListTile(title: Text("Trabajos",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w400),),),
          ListTile(title: Text("Aplicaciones",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w400),),),
          ListTile(title: Text("Perfil",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w400),),),
          ListTile(title: Text("Notificaciones",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w400),),),
        ],
      ),
    );
  }
}
