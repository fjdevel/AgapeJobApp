import 'dart:convert';

import 'package:agape_job_app/util/globals.dart';
import 'package:agape_job_app/widget/inicio/cardjob.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class ListRecomendation extends StatefulWidget {
  @override
  _ListRecomendationState createState() => _ListRecomendationState();
}

class _ListRecomendationState extends State<ListRecomendation> {
  List listPl = [];
  @override
  void initState() {
    super.initState();

  }



  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    var url = Uri.http(dominio.toString(),'/jeo/servicios/consultar_plazas_disponibles.php');
    var response = http.get(url);
    response.then((value) {
      setState(() {
        listPl = jsonDecode(value.body);
      });
    });
    return Container(
      margin: EdgeInsets.only(top: 10),
      width: size.width*0.85,
      height: size.height*0.30,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          listPl.isNotEmpty?
          CardJob(listPl.removeLast()):
          Text("No hay plazas disponibles"),
          listPl.isNotEmpty?
    CardJob(listPl.removeLast()):
    Text("No hay plazas disponibles"),
          listPl.isNotEmpty?
          CardJob(listPl.removeLast()):
          Text("No hay plazas disponibles"),

        ],
      ),
    );
  }
}
