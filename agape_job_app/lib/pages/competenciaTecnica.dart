import 'dart:convert';

import 'package:agape_job_app/services/provider.dart';
import 'package:agape_job_app/util/colors.dart';
import 'package:agape_job_app/util/globals.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class CompetenciaTecnica extends StatefulWidget {
  @override
  _CompetenciaTecnicaState createState() => _CompetenciaTecnicaState();
}

class _CompetenciaTecnicaState extends State<CompetenciaTecnica> {
  List capasbyE=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(mounted)
      obtenerCapasEstudiantes();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: dPrimaryColor,
        title: Text("Competencias Técnicas"),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              for(var c in capasbyE)
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
                            "/competenciaTecnicaForm");
                      },
                      icon: Icon(Icons.add),
                      label:
                      Text("Editar Competencias Técnicas")),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  void obtenerCapasEstudiantes(){
    var prov = Provider.of<Proveedor>(this.context,listen: false);
    var URI = Uri.http(dominio.toString(), "/jeo/servicios/ctg_competencia_tecnica.php",
        {"accion": "CBE","id":prov.idEstudiante});
    var response = http.get(URI);
    response.then((value) {
      setState(() {
        var respuesta = jsonDecode(value.body)['info'];
        for (var s in respuesta) {
          this.capasbyE.add(s);
        }
      });
    });
  }
}
