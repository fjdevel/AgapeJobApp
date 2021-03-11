import 'package:agape_job_app/widget/common/menubar.dart';
import 'package:agape_job_app/widget/inicio/drawerinicio.dart';
import 'package:agape_job_app/widget/inicio/notificacionesinicio.dart';
import 'package:flutter/material.dart';

class InicioPage extends StatefulWidget {
  @override
  _InicioPageState createState() => _InicioPageState();
}

class _InicioPageState extends State<InicioPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: MenuBar(title:"",),
      drawer: DrawerInicio(),
      body: Container(
        height: 500,
        child: Column(
          children: [
            NotificacionesInicio(),

          ],
        ),
      ),
    );
  }
}
