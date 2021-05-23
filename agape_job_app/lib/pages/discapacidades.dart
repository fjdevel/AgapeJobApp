import 'dart:convert';

import 'package:agape_job_app/services/provider.dart';
import 'package:agape_job_app/util/colors.dart';
import 'package:agape_job_app/util/globals.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
class Discapacidades extends StatefulWidget {
  @override
  _DiscapacidadesState createState() => _DiscapacidadesState();
}

class _DiscapacidadesState extends State<Discapacidades> {

  List discapacidades=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    obtenerDiscapacidades();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Discapacidades"),
        backgroundColor: dPrimaryColor,
      ),
      body: Column(
        children: [
          for(var c in discapacidades)
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
                        "/discapacidadfForm");
                  },
                  icon: Icon(Icons.edit),
                  label:
                  Text("Editar Discapacidades")),
            ),
          )
        ],
      ),
    );
  }

  void obtenerDiscapacidades() {
    var prov = Provider.of<Proveedor>(this.context,listen: false);
    var URI = Uri.http(dominio.toString(), "/jeo/servicios/ctg_discapacidad.php",
        {"accion": "CBE","id":prov.idEstudiante});
    var response = http.get(URI);
    response.then((value) {
      setState(() {
        var respuesta = jsonDecode(value.body)['info'];
        for (var s in respuesta) {
          this.discapacidades.add(s);
        }
      });
    });
  }
}
