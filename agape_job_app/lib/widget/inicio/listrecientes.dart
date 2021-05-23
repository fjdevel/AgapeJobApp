import 'dart:convert';

import 'package:agape_job_app/services/provider.dart';
import 'package:agape_job_app/util/globals.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'cardjobrecent.dart';
class ListRecientes extends StatefulWidget {
  @override
  _ListRecientesState createState() => _ListRecientesState();
}

class _ListRecientesState extends State<ListRecientes> {
  Map<String, dynamic> map;
  List listPl = [];
  @override
  void initState() {
    super.initState();
    if(mounted){
      obtenerRecientes();
    }

  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(top: 10),
      width: size.width*0.85,
      child: ListView(
        children: [
          for(var e in listPl) CardJobRecent(e)

        ],
      ),
    );
  }

  void obtenerRecientes() {
    var prov = Provider.of<Proveedor>(this.context,listen: false);

    var url = Uri.http(dominio.toString(),'jeo/servicios/prc_plaza.php',{
      'accion':'COLV',
      'fechaFinal':'Y',
      'idEstudiante':prov.idEstudiante
    });
    var response = http.get(url);
    response.then((value) {
      print("peticion reciente");
      setState(() {
        if(value.body.isNotEmpty||value.body!=""){
          map = jsonDecode(value.body);
          listPl = map["info"];
        }
      });
    });
  }
}
