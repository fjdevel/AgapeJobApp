import 'dart:convert';

import 'package:agape_job_app/pages/FormacionAcademicaForm.dart';
import 'package:agape_job_app/services/provider.dart';
import 'package:agape_job_app/util/colors.dart';
import 'package:agape_job_app/util/globals.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
class FormacionAcademica extends StatefulWidget {
  @override
  _FormacionAcademicaState createState() => _FormacionAcademicaState();
}

class _FormacionAcademicaState extends State<FormacionAcademica> {

  List formaciones=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    obtenerFormaciones();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Formacion Academica"),
        backgroundColor: dPrimaryColor,
      ),
      body: Column(
        children: [
          for(var c in formaciones)
            Card(
              elevation: 5,
              child: Container(
                child: Center(
                  child: Column(
                    children: [
                      Text("Titulo: "+c['titulo_recibido']+"\n"+"Institucion: "+c['institucion']+"\n"+"Fecha finalizacion: "+c['fecha_fin']),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 10),
                            child: ElevatedButton.icon(style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.red)),onPressed: (){
                              var prov = Provider.of<Proveedor>(this.context,listen: false);

                              var url = Uri.http(dominio.toString(), '/jeo/servicios/prc_formacion_academica.php',{
                                'accion':'D',
                                'idEstudiante':prov.idEstudiante,
                                'user':prov.usr,
                                'idFormacion':c['id']['id'],
                              });
                              http.get(url).then((value) {
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(jsonDecode(value.body)['info'])));
                                setState(() {
                                  obtenerFormaciones();
                                });
                              });
                            }, icon: Icon(Icons.delete),label: Text("Eliminar"),),
                          ),
                          ElevatedButton.icon(style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green)),onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => FormacionAcademicaForm(c,obtenerFormaciones)),
                            );

                          }, icon: Icon(Icons.edit),label: Text("editar"),)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          Center(
            child: Container(
              margin: EdgeInsets.only(left: 5),
              child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FormacionAcademicaForm(null,obtenerFormaciones)),
                    );
                  },
                  icon: Icon(Icons.edit),
                  label:
                  Text("Ingresar Formacion Academica")),
            ),
          )
        ],
      ),
    );
  }

  void obtenerFormaciones() {
    var prov = Provider.of<Proveedor>(this.context,listen: false);
    var URI = Uri.http(dominio.toString(), "/jeo/servicios/prc_formacion_academica.php",
        {"accion": "CA","idEstudiante":prov.idEstudiante});
    var response = http.get(URI);
    response.then((value) {
      print("peticion Formaciones");
      if(mounted){
        setState(() {
          try{
            this.formaciones.clear();
            var respuesta = jsonDecode(value.body)['info'];
            for (var s in respuesta) {
              this.formaciones.add(s);
            }}catch(e){

          };
        });
      }
    });
  }
}
