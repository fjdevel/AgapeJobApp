import 'dart:convert';

import 'package:agape_job_app/pages/preferenciasForm.dart';
import 'package:agape_job_app/services/provider.dart';
import 'package:agape_job_app/util/colors.dart';
import 'package:agape_job_app/util/globals.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class PreferenciasDeTrabajo extends StatefulWidget {
  @override
  _PreferenciasDeTrabajoState createState() => _PreferenciasDeTrabajoState();
}

class _PreferenciasDeTrabajoState extends State<PreferenciasDeTrabajo> {
  var profile;
  List ocupaciones = [];
  List ocupacionesT = [];
  List departamentos = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(mounted){
      obtenerPerfil();
      obtenerOcupaciones();
      obtenerDepartamentos();
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Preferencias de Trabajo"),
        backgroundColor: dPrimaryColor,
      ),
      body: Column(
        children: [
          if(profile!=null)
            Center(
                child: Container(
                    width: size.width * 0.9,
                    child: Card(
                        elevation: 10,
                        child: Column(
                          children: [
                            Container(
                              height: size.height * 0.09,
                              child: Row(
                                children: [
                                  Text(
                                    "Situacion Laboral: ",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(profile['situacion_actual'])
                                ],
                              ),
                            ),
                            Container(
                              height: size.height * 0.09,
                              child: Row(
                                children: [
                                  Text(
                                    "Puesto de trabajo deseado: ",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(profile['puesto_trabajo_deseado'])
                                ],
                              ),
                            ),
                            Container(
                              height: size.height * 0.09,
                              child: Row(
                                children: [
                                  Text(
                                    "Expectativa Salarial: \$",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(profile['expectativa_salarial'])
                                ],
                              ),
                            ),
                            Container(
                              height: size.height * 0.09,
                              child: Row(
                                children: [
                                  Text(
                                    "Disponibilidad para Viajar: ",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(profile['disponibilidad_viajar']=="1"?"si":"no")
                                ],
                              ),
                            ),
                            Container(
                              height: size.height * 0.09,
                              child: Row(
                                children: [
                                  Text(
                                    "Disponibilidad para cambiar residencia: ",
                                    style: TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  Text(profile['disp_cambiar_residencia'])
                                ],
                              ),
                            ),
                            Text("Ocupaciones:",style: TextStyle(fontWeight: FontWeight.bold),),
                            for(var e in ocupaciones)
                              Container(height: size.height*0.04,child: Center(child: Text(e['descripcion']),),),
                            Text("Departamentos a los que se puede movilizar:",style: TextStyle(fontWeight: FontWeight.bold),),
                            for(var d in departamentos)
                              Container(height: size.height*0.04,child: Center(child: Text(d['descripcion']),),),
                            ElevatedButton.icon(style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green)),onPressed: (){
                             Navigator.pop(context);
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => PreferenciasForm()),
                              );
                            }, icon: Icon(Icons.edit),label: Text("editar"),)
                          ],
                        ))))
          else
            Center(
              child: CircularProgressIndicator(),
            )

        ],
      ),
    );
  }

  void obtenerPerfil() {
    var prov = Provider.of<Proveedor>(this.context, listen: false);

    var url = Uri.http(dominio.toString(),
        '/jeo/servicios/consultar_perfil.php', {"id": prov.idEstudiante});

    var response = http.get(url);
    response.then((value) {
      if (mounted) {
        setState(() {
          if (!value.body.toString().contains("<!DOCTYPE"))
            profile = jsonDecode(value.body)[0];
        });
      }
    });
  }

  void obtenerOcupaciones() {
    var prov = Provider.of<Proveedor>(this.context,listen: false);
    var URI = Uri.http(dominio.toString(), "/jeo/servicios/ctg_ocupacion.php",
        {"accion": "CBE","id":prov.idEstudiante});
    var response = http.get(URI);
    response.then((value) {
      setState(() {
        var respuesta = jsonDecode(value.body)['info'];
        for (var s in respuesta) {
          this.ocupaciones.add(s);
        }
      });
    });
  }


  void obtenerDepartamentos() {
    var prov = Provider.of<Proveedor>(this.context,listen: false);
    var URI = Uri.http(dominio.toString(), "/jeo/servicios/ctg_depto.php",
        {"accion": "CBE","id":prov.idEstudiante});
    var response = http.get(URI);
    response.then((value) {
      setState(() {
        var respuesta = jsonDecode(value.body)['info'];
        for (var s in respuesta) {
          this.departamentos.add(s);
        }
      });
    });
  }
}
