import 'dart:convert';

import 'package:agape_job_app/services/provider.dart';
import 'package:agape_job_app/util/colors.dart';
import 'package:agape_job_app/util/globals.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class HabilidadesBlandas extends StatefulWidget {
  @override
  _HabilidadesBlandasState createState() => _HabilidadesBlandasState();
}

class _HabilidadesBlandasState extends State<HabilidadesBlandas> {

  List habilidades=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(mounted)
      obtenerHabilidades();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Habilidades Blandas"),
        backgroundColor: dPrimaryColor,
      ),
      body: Column(
        children: [
          for(var c in habilidades)
            Card(
              elevation: 5,
              child: Container(
                height: size.height*0.1,
                child: Center(
                  child: Text(c['descripcion']),
                ),
              ),
            ),
          Center(
            child: Container(
              margin: EdgeInsets.only(left: 5),
              child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.of(context)
                        .popAndPushNamed(
                        "/habilidadesBlandasForm");
                  },
                  icon: Icon(Icons.edit),
                  label:
                  Text("Editar Habilidades Blandas")),
            ),
          )
        ],
      ),
    );
  }

  void obtenerHabilidades() {
    var prov = Provider.of<Proveedor>(this.context,listen: false);
    var URI = Uri.http(dominio.toString(), "/jeo/servicios/ctg_habilidad_blanda.php",
        {"accion": "CBE","id":prov.idEstudiante});
    var response = http.get(URI);
    response.then((value) {
      setState(() {
        var respuesta = jsonDecode(value.body)['info'];
        for (var s in respuesta) {
          this.habilidades.add(s);
        }
      });
    });
  }
}
