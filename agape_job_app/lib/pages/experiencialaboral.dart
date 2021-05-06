import 'dart:convert';

import 'package:agape_job_app/services/provider.dart';
import 'package:agape_job_app/util/colors.dart';
import 'package:agape_job_app/util/globals.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
class ExperienciaLaboral extends StatefulWidget {
  @override
  _ExperienciaLaboralState createState() => _ExperienciaLaboralState();
}

class _ExperienciaLaboralState extends State<ExperienciaLaboral> {
  final _scaffoldkey = GlobalKey<ScaffoldState>();
  var cargoController = TextEditingController(),
  fechaInicioController = TextEditingController(),
  fechaFinController = TextEditingController(),
  funcionesController = TextEditingController(),
  empresaController = TextEditingController(),
  jefeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        key: _scaffoldkey,
        appBar: AppBar(
          title: Text('Ingresar Experiencia Laboral   '),
          backgroundColor: dPrimaryColor,
        ),
        body: Container(
          height: size.height * 0.95,
          width: size.width * 1,
          child: SingleChildScrollView(
            child: Container(
              width: size.width *0.85,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  //Widgets del formulario
                  //Cargo
                  Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                      child: Text('Cargo')
                  ),
                  Container(
                      width: size.width *0.85,
                      margin: EdgeInsets.only(top: 5.0),
                      height: 40.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 1, color: Colors.white, style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [ BoxShadow(
                              color: Colors.black26,
                              offset: const Offset(0.0, 3.0),
                              blurRadius: 1.2,
                              spreadRadius: 0.5
                          )
                          ]
                      ),
                      child: TextField(
                        controller: cargoController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 10),
                            hintText: '| Cargo',
                            suffixIcon: Icon(Icons.assignment_ind),
                            suffixIconConstraints: BoxConstraints(minWidth: 40)
                        ),
                      )
                  ),
                  //Fecha Inicio
                  Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                      child: Text('Fecha Inicio')
                  ),
                  Container(
                      width: size.width *0.85,
                      margin: EdgeInsets.only(top: 5.0),
                      height: 40.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 1, color: Colors.white, style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [ BoxShadow(
                              color: Colors.black26,
                              offset: const Offset(0.0, 3.0),
                              blurRadius: 1.2,
                              spreadRadius: 0.5
                          )
                          ]
                      ),
                      child: TextField(
                        keyboardType: TextInputType.datetime,
                        controller: fechaInicioController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 10),
                            hintText: 'AAAA-MM-DD| Fecha Inicio',
                            suffixIcon: Icon(Icons.calendar_today),
                            suffixIconConstraints: BoxConstraints(minWidth: 40)
                        ),
                      )
                  ),
                  //Fecha Fin
                  Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                      child: Text('Fecha Fin')
                  ),
                  Container(
                      width: size.width *0.85,
                      margin: EdgeInsets.only(top: 5.0),
                      height: 40.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 1, color: Colors.white, style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [ BoxShadow(
                              color: Colors.black26,
                              offset: const Offset(0.0, 3.0),
                              blurRadius: 1.2,
                              spreadRadius: 0.5
                          )
                          ]
                      ),
                      child: TextField(
                        keyboardType: TextInputType.datetime,
                        controller: fechaFinController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 10),
                            hintText: 'AAAA-MM-DD| Fecha Fin',
                            suffixIcon: Icon(Icons.calendar_today),
                            suffixIconConstraints: BoxConstraints(minWidth: 40)
                        ),
                      )
                  ),
                  //Funciones
                  Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                      child: Text('Funciones')
                  ),
                  Container(
                      width: size.width *0.85,
                      margin: EdgeInsets.only(top: 5.0),
                      height: 100.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 1, color: Colors.white, style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [ BoxShadow(
                              color: Colors.black26,
                              offset: const Offset(0.0, 3.0),
                              blurRadius: 1.2,
                              spreadRadius: 0.5
                          )
                          ]
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 10),
                            hintText: '| Funciones',
                            suffixIcon: Icon(Icons.assignment),
                            suffixIconConstraints: BoxConstraints(minWidth: 40),

                        ),
                        maxLines: null,
                        controller: funcionesController,
                      )
                  ),
                  //Nombre de la Empresa
                  Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                      child: Text('Nombre de la Empresa')
                  ),
                  Container(
                      width: size.width *0.85,
                      margin: EdgeInsets.only(top: 5.0),
                      height: 40.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 1, color: Colors.white, style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [ BoxShadow(
                              color: Colors.black26,
                              offset: const Offset(0.0, 3.0),
                              blurRadius: 1.2,
                              spreadRadius: 0.5
                          )
                          ]
                      ),
                      child: TextField(
                        controller: empresaController,
                        decoration: InputDecoration(
                            border: InputBorder.none,

                            contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 10),
                            hintText: '| Nombre de la Empresa',
                            suffixIcon: Icon(Icons.business_center),
                            suffixIconConstraints: BoxConstraints(minWidth: 40)
                        ),
                      )
                  ),
                  //Nombre del Jefe
                  Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                      child: Text('Nombre del Jefe')
                  ),
                  Container(
                      width: size.width *0.85,
                      margin: EdgeInsets.only(top: 5.0),
                      height: 40.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 1, color: Colors.white, style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [ BoxShadow(
                              color: Colors.black26,
                              offset: const Offset(0.0, 3.0),
                              blurRadius: 1.2,
                              spreadRadius: 0.5
                          )
                          ]
                      ),
                      child: TextField(
                        controller: jefeController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 10),
                            hintText: '| Nombre del Jefe',
                            suffixIcon: Icon(Icons.account_circle),
                            suffixIconConstraints: BoxConstraints(minWidth: 40)
                        ),
                      )
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child:ElevatedButton.icon(onPressed: (){
                      var prov = Provider.of<Proveedor>(this.context,listen: false);
                      var url = Uri.http(dominio.toString(),'/jeo/servicios/prc_situacion_laboral.php',{
                        "accion":"IP",
                        "idEstudiante":prov.idEstudiante,
                        "user":prov.usr
                      });
                      var response = http.post(url,body: {
                        "cargo":cargoController.text,
                        "fecha_fin":fechaFinController.text,
                        "fecha_inicio":fechaInicioController.text,
                        "funciones":funcionesController.text,
                        "idEstudiante":prov.idEstudiante,
                        "nombre_empresa":empresaController.text,
                        "nombre_jefe":jefeController.text,
                        "usuario":prov.usr
                      });

                      response.then((value){
                        var r = jsonDecode(value.body);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(r["info"]),));
                      });
                    }, icon: Icon(Icons.save), label: Text("Guardar Experiencia Laboral"))
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}
