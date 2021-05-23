import 'dart:convert';
import 'dart:developer';

import 'package:agape_job_app/services/provider.dart';
import 'package:agape_job_app/util/colors.dart';
import 'package:agape_job_app/util/globals.dart';
import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class ConfiguracionPage extends StatefulWidget {
  @override
  _ConfiguracionPageState createState() => _ConfiguracionPageState();
}

class _ConfiguracionPageState extends State<ConfiguracionPage> {
  var activo;

  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<Proveedor>(context,listen: false);
    var url = Uri.http(dominio.toString(),'/jeo/servicios/sec_usuario.php',{
      'accion':'LA',
      'idEstudiante':prov.idEstudiante

    });
    var response = http.get(url);
    response.then((value){
      setState(() {
        activo = (jsonDecode(value.body)['info']=="1"?true:false);
      });
    });

    return Scaffold(
      appBar: AppBar(
        title: Text("Configuracion"),
        backgroundColor: dPrimaryColor,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Center(
              child: Text("¿Desea recibir notificaciones por correo?",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Center(
              child: LiteRollingSwitch(
                //initial value
                value: activo,
                textOn: 'Activar',
                textOff: 'Desactivar',
                colorOn: Colors.greenAccent[700],
                colorOff: Colors.redAccent[700],
                iconOn: Icons.done,
                iconOff: Icons.remove_circle_outline,
                textSize: 14.0,
                onChanged: (state) {
                  var url2 =  Uri.http(dominio.toString(),'/jeo/servicios/sec_usuario.php',{
                    'accion':'GA',
                    'est':prov.idEstudiante,
                    'notificaciones':activo==true?"0":"1"

                  });

                  var response2 = http.get(url2);
                  response2.then((value){
                  });
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
