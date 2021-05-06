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
          // Container(
          //   margin: EdgeInsets.only(top:50),
          //   child: ListTile(title: Text("Notificaciones",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w400),),),
          // ),
        ],
      ),
    );
  }
}
