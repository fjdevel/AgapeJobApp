import 'dart:convert';
import 'dart:developer';

import 'package:agape_job_app/services/provider.dart';
import 'package:agape_job_app/util/colors.dart';
import 'package:agape_job_app/util/globals.dart';
import 'package:agape_job_app/widget/common/dataPicker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
class ExperienciaLaboral extends StatefulWidget {
  var data;

  ExperienciaLaboral(this.data);

  @override
  _ExperienciaLaboralState createState() => _ExperienciaLaboralState(this.data);
}

class _ExperienciaLaboralState extends State<ExperienciaLaboral> {

  var _data;

  _ExperienciaLaboralState(this._data);

  final _scaffoldkey = GlobalKey<ScaffoldState>();
  var cargoController = TextEditingController(),
  funcionesController = TextEditingController(),
  empresaController = TextEditingController(),
  jefeController = TextEditingController();
  var fechaInicio = DataPicker(null);
  var fechaFin = DataPicker(null);

  @override
  void initState() {
    super.initState();
    if(_data!=null){
      var fechaA= _data['fecha_inicio'].toString().split("/");
      fechaInicio.currentDate = DateTime.parse(fechaA[2]+"-"+fechaA[1]+"-"+fechaA[0]);
      var fechaB = _data['fecha_fin'].toString().split("/");
      fechaFin.currentDate =  DateTime.parse(fechaB[2]+"-"+fechaB[1]+"-"+fechaB[0]);
      funcionesController.text = _data['funciones'];
      empresaController.text = _data['nombre_empresa'];
      jefeController.text = _data['nombre_jefe'];
      cargoController.text = _data['cargo'];
      setState(() {

      });
    }
  }

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
                  fechaInicio
                  ,
                  //Fecha Fin
                  Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                      child: Text('Fecha Fin')
                  ),
                  fechaFin,
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
                  _data!=null?
                  Container(
                      margin: EdgeInsets.only(top: 10),
                      child:ElevatedButton.icon(onPressed: (){
                        var prov = Provider.of<Proveedor>(this.context,listen: false);
                        var url = Uri.http(dominio.toString(),'/jeo/servicios/prc_situacion_laboral.php',{
                          "accion":"UP",
                          "idEstudiante":prov.idEstudiante,
                          "idSitLab":_data['id']['id'].toString()
                        });
                        var data = jsonEncode({
                          'cargo':cargoController.text,
                          "fecha_fin":fechaFin.currentDate,
                          "fecha_inicio":fechaInicio.currentDate,
                          "funciones":funcionesController.text,
                          "idEstudiante":prov.idEstudiante.toString(),
                          "nombre_empresa":empresaController.text,
                          "nombre_jefe":jefeController.text,
                          "usuario":prov.usr,
                        });
                        var response = http.post(url,body: data);
                        response.then((value){
                          if(value.statusCode==200)
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value.body.toString()),));
                          else
                            log(value.body);
                            //ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value.body.toString()),));

                        });
                      }, icon: Icon(Icons.save), label: Text("Actualizar Experiencia Laboral"))
                  )
                      :Container(
                      margin: EdgeInsets.only(top: 10),
                      child:ElevatedButton.icon(onPressed: (){
                        var prov = Provider.of<Proveedor>(this.context,listen: false);
                        var url = Uri.http(dominio.toString(),'/jeo/servicios/prc_situacion_laboral.php',{
                          "accion":"IP",
                          "idEstudiante":prov.idEstudiante,
                          "user":prov.usr
                        });
                        var response = http.post(url,body: jsonEncode({
                          "cargo":cargoController.text,
                          "fecha_fin":fechaFin.currentDate.toString(),
                          "fecha_inicio":fechaInicio.currentDate.toString(),
                          "funciones":funcionesController.text,
                          "idEstudiante":prov.idEstudiante,
                          "nombre_empresa":empresaController.text,
                          "nombre_jefe":jefeController.text,
                          "usuario":prov.usr
                        }));

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
