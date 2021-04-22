import 'dart:convert';

import 'package:agape_job_app/util/globals.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'cardjobrecent.dart';
class ListRecientes extends StatefulWidget {
  @override
  _ListRecientesState createState() => _ListRecientesState();
}

class _ListRecientesState extends State<ListRecientes> {
  List listPl = [];
  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var url = Uri.http(dominio.toString(),'/jeo/servicios/consultar_plazas_disponibles.php');
    var response = http.get(url);
    response.then((value) {
      setState(() {
        if(value.body.isNotEmpty||value.body!=""){
        listPl = jsonDecode(value.body);
        listPl.removeRange(0, 2);}
      });
    });
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
}
