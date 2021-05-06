import 'dart:convert';
import 'dart:developer';

import 'package:agape_job_app/services/provider.dart';
import 'package:agape_job_app/util/globals.dart';
import 'package:agape_job_app/widget/inicio/cardjob.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
class ListRecomendation extends StatefulWidget {
  @override
  _ListRecomendationState createState() => _ListRecomendationState();
}

class _ListRecomendationState extends State<ListRecomendation> {
  Map<String, dynamic> map;
  List listPl = [];
  @override
  void initState() {
    super.initState();

  }



  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    var prov = Provider.of<Proveedor>(this.context,listen: false);
    var url = Uri.http(dominio.toString(),'jeo/servicios/prc_plaza.php',{
      'accion':'COLV',
      'fechaFinal':'Y',
      'idEstudiante':prov.idEstudiante
    });
    var response = http.get(url);
    response.then((value) {
      setState(() {
        if(value.body.isNotEmpty || value.body!=""){
          map= jsonDecode(value.body);
          listPl=map["info"];
        }
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
          CardJob(listPl[0]):
          Text("No hay plazas disponibles")

        ],
      ),
    );
  }
}
