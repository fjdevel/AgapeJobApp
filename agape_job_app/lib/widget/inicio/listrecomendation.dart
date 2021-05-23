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
  List listPl = [];
  @override
  void initState() {
    super.initState();
    if(mounted){
      obtenerRecomendados();
    }
  }



  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;


    return Container(
      margin: EdgeInsets.only(top: 10),
      width: size.width*0.85,
      height: size.height*0.30,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          for(var e in listPl) CardJob(e)

        ],
      ),
    );
  }

  void obtenerRecomendados() {
    var prov = Provider.of<Proveedor>(this.context,listen: false);
    var url = Uri.http(dominio.toString(),'jeo/servicios/prc_plazas_sugeridas.php',{
      'accion':'C',
      'idEstudiante':prov.idEstudiante
    });
    var response = http.get(url);
    response.then((value) {
      print("peticion recomendados");
      setState(() {
        if(value.body.isNotEmpty || value.body!=""){
          if(!value.body.toString().contains("<!")){
            var map= jsonDecode(value.body)["info"];
            for(var o in map){
              this.listPl.add(o);
            }
          }

        }
      });
    });
  }
}
