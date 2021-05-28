import 'dart:convert';
import 'dart:developer';

import 'package:agape_job_app/services/provider.dart';
import 'package:agape_job_app/util/colors.dart';
import 'package:agape_job_app/util/globals.dart';
import 'package:agape_job_app/widget/perfil/capacitacionesinternas.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class CursoInterno extends StatefulWidget {
  var data;
 var funcion;
  CursoInterno(this.data,this.funcion);

  @override
  _CursoInternoState createState() => _CursoInternoState(this.data);
}

class _CursoInternoState extends State<CursoInterno> {
  var _data;

  _CursoInternoState(this._data);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(

      width: size.width * 0.9,
      margin: EdgeInsets.only(top: 5, bottom: 5,left: 5),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              child: Text(
                "Email de contacto: " + _data['email_contacto'],
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              child:  Text("Fecha Finalizacion: " + _data['fecha_fin'],
                  textAlign: TextAlign.left),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              child:  Text("Sede: " + _data['ctgSede']['descripcion'],
                  textAlign: TextAlign.left),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              child:   Text("Proyecto: " + _data['ctgProyecto']['descripcion'],
                  textAlign: TextAlign.left),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              child:   Text("Grupo: "+_data['ctgGrupo']['descripcion']),
            ),
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              child:   Text("Curso: "+_data['curso']['descripcion'])
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(right: 10),
                child: ElevatedButton.icon(style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.red)),onPressed: (){
                  var prov = Provider.of<Proveedor>(this.context,listen: false);

                  var url = Uri.http(dominio.toString(), '/jeo/servicios/prc_curso_estudiante.php',{
                    'accion':'D',
                    'idEstudiante':prov.idEstudiante,
                    'user':prov.usr,
                    'idCurso':_data['id']['id_curso']
                  });
                  http.get(url).then((value) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(jsonDecode(value.body)['info'])));
                    this.widget.funcion();
                  });
                }, icon: Icon(Icons.delete),label: Text("Eliminar"),),
              ),
              ElevatedButton.icon(style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green)),onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CapacitacionesInternasForm(_data,widget.funcion)),
                );
              }, icon: Icon(Icons.edit),label: Text("editar"),)
            ],
          )

        ],
      ),
    );
  }
}
