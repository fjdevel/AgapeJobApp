import 'dart:convert';

import 'package:agape_job_app/pages/experiencialaboral.dart';
import 'package:agape_job_app/services/provider.dart';
import 'package:agape_job_app/util/globals.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class Experiencia extends StatefulWidget {
  var data;
  var funcion;
  Experiencia(this.data,this.funcion);

  @override
  _ExperienciaState createState() => _ExperienciaState(this.data);
}

class _ExperienciaState extends State<Experiencia> {
  var _data;

  _ExperienciaState(this._data);

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: EdgeInsets.only(top: 5,bottom: 5),
      child: Column(
        children: [
          Text("Empresa: "+_data['nombre_empresa']+" Cargo: "+_data['cargo']),
          Text("desde: "+_data['fecha_inicio']+" hasta: "+_data['fecha_fin']),
          Text("Funciones:"+_data['funciones']),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 10),
                child: ElevatedButton.icon(style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.red)),onPressed: (){
                  var prov = Provider.of<Proveedor>(this.context,listen: false);

                  var url = Uri.http(dominio.toString(), '/jeo/servicios/prc_situacion_laboral.php',{
                    'accion':'D',
                    'idSitLab':_data['id']['id'],
                    'idEstudiante':prov.idEstudiante,
                    'user':prov.usr
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
                  MaterialPageRoute(builder: (context) => ExperienciaLaboral(_data)),
                );
              }, icon: Icon(Icons.edit),label: Text("editar"),)
            ],
          ),
        ],
      ),
    );
  }
}
