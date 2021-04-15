import 'dart:convert';
import 'dart:developer';

import 'package:agape_job_app/services/provider.dart';
import 'package:agape_job_app/widget/common/menubar.dart';
import 'package:agape_job_app/widget/inicio/drawerinicio.dart';
import 'package:agape_job_app/widget/inicio/listrecientes.dart';
import 'package:agape_job_app/widget/inicio/listrecomendation.dart';
import 'package:agape_job_app/widget/inicio/notificacionesinicio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class InicioPage extends StatefulWidget {
  @override
  _InicioPageState createState() => _InicioPageState();



}

class _InicioPageState extends State<InicioPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      appBar: MenuBar(title:"",),
      drawer: DrawerInicio(),
      body: Container(
        child: Column(
          children: [
            /*Container(
              margin: EdgeInsets.only(top: size.height*0.05),
              child: NotificacionesInicio(),
            ),*/
            Align(alignment: Alignment.centerLeft,
              child: Container(margin:EdgeInsets.only(left: 30,top: size.height*0.05),
                child: Text("Recomendaciones",style: TextStyle(fontSize: 20),),),),
            ListRecomendation(),
            Align(alignment: Alignment.centerLeft,
              child: Container(margin:EdgeInsets.only(left: 30,top: size.height*0.05),
                child: Text("Plazas Recientes",style: TextStyle(fontSize: 20),),),),
            Expanded(child:ListRecientes())
          ],
        ),
      ),
    );
  }
}
