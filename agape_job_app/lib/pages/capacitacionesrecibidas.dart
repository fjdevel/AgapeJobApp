import 'dart:convert';
import 'dart:developer';

import 'package:agape_job_app/services/provider.dart';
import 'package:agape_job_app/util/colors.dart';
import 'package:agape_job_app/util/globals.dart';
import 'package:agape_job_app/widget/common/dataPicker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class CapacitacionesR extends StatefulWidget {
  var data;

  CapacitacionesR(this.data);

  @override
  _CapacitacionesRState createState() => _CapacitacionesRState(this.data);
}

class _CapacitacionesRState extends State<CapacitacionesR> {
  var _data;

  _CapacitacionesRState(this._data);

  var fechaFinal = DataPicker(null),
      institucionController = TextEditingController(),
      cursoController = TextEditingController();

  final _scaffoldkey = GlobalKey<ScaffoldState>();


  @override
  void initState() {
    if(_data!=null){
     if(widget.data['fecha_finalizacion']!=null){
       var fechaA= widget.data['fecha_finalizacion'].toString().split("/");
       if(fechaA.length<1)
         fechaA= widget.data['fecha_fin'].toString().split("-");
       fechaFinal.currentDate = DateTime.parse(fechaA[2]+"-"+fechaA[1]+"-"+fechaA[0]);
     }
      institucionController.text = _data['institucion'];
      cursoController.text = _data['nombre_curso'];
    }
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return Scaffold(
        key: _scaffoldkey,
        appBar: AppBar(
        title: Text('Formulario de capacitaciones'),
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
                  //Fecha de finalización
                  Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: Text('Fecha de Finalilzación')
                  ),
                  // Container(
                  //     width: size.width *0.85,
                  //     margin: EdgeInsets.only(top: 5.0),
                  //     height: 40.0,
                  //     decoration: BoxDecoration(
                  //         color: Colors.white,
                  //         border: Border.all(width: 1, color: Colors.white, style: BorderStyle.solid),
                  //         borderRadius: BorderRadius.circular(10),
                  //         boxShadow: [ BoxShadow(
                  //             color: Colors.black26,
                  //             offset: const Offset(0.0, 3.0),
                  //             blurRadius: 1.2,
                  //             spreadRadius: 0.5
                  //         )
                  //         ]
                  //     ),
                  //     child: TextField(
                  //       controller: fechaFinalController,
                  //       keyboardType: TextInputType.datetime,
                  //       decoration: InputDecoration(
                  //           border: InputBorder.none,
                  //           contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 10),
                  //           hintText: '| Fecha de Finalización',
                  //           suffixIcon: Icon(Icons.calendar_today),
                  //           suffixIconConstraints: BoxConstraints(minWidth: 40)
                  //       ),
                  //     )
                  // ),
                  fechaFinal,
                  //Institución
                  Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                      child: Text('Institución')
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
                        controller: institucionController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 10),
                            hintText: '| Institución',
                            suffixIcon: Icon(Icons.school),
                            suffixIconConstraints: BoxConstraints(minWidth: 40)
                        ),
                      )
                  ),
                  //Nombre del Curso
                  Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                      child: Text('Nombre del Curso')
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
                        controller: cursoController,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 10),
                            hintText: '| Nombre del Curso',
                            suffixIcon: Icon(Icons.sticky_note_2),
                            suffixIconConstraints: BoxConstraints(minWidth: 40)
                        ),
                      )
                  ),
                  _data==null?Container(
                    margin: EdgeInsets.only(top:10),
                    child: ElevatedButton.icon(onPressed: (){
                      var prov = Provider.of<Proveedor>(this.context,listen: false);
                      var url = Uri.http(dominio.toString(),'/jeo/servicios/prc_curso_externo.php',{
                        "accion":"I",
                      });
                      var body = jsonEncode({
                        "cursoExterno":{
                          "fecha_finalizacion":fechaFinal.currentDate.toString(),
                          "idEstudiante":prov.idEstudiante,
                          "institucion":institucionController.text,
                          "nombre_curso":cursoController.text,
                          "usuario":prov.usr
                        },
                        "usuario":prov.usr
                      });
                      var response = http.post(url,body: body);

                      response.then((value){
                        var r = jsonDecode(value.body);
                        if(r["status"]=="1")
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(r["info"]),));
                        else
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(r["info"]),));

                      });
                    }, icon: Icon(Icons.save), label: Text("Guardar")),
                  ):Container(
                    margin: EdgeInsets.only(top:10),
                    child: ElevatedButton.icon(onPressed: (){
                      var prov = Provider.of<Proveedor>(this.context,listen: false);
                      var url = Uri.http(dominio.toString(),'/jeo/servicios/prc_curso_externo.php',{
                        "accion":"U",
                      });
                      var body = jsonEncode({
                        "cursoExterno":{
                          "fecha_finalizacion":fechaFinal.currentDate.toString(),
                          "idEstudiante":prov.idEstudiante,
                          "institucion":institucionController.text,
                          "nombre_curso":cursoController.text,
                          "usuario":prov.usr,
                          "id":_data['id']
                        },
                        "usuario":prov.usr
                      });
                      var response = http.post(url,body: body);

                      response.then((value){
                        var r = jsonDecode(value.body);
                        if(r["status"]=="1")
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(r["info"]),));
                        else
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(r["info"]),));

                      });

                    }, icon: Icon(Icons.edit), label: Text("Actualizar")),
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}
