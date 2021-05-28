
import 'dart:convert';

import 'package:agape_job_app/pages/capacitacionesrecibidas.dart';
import 'package:agape_job_app/services/provider.dart';
import 'package:agape_job_app/util/globals.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class CursoExterno extends StatefulWidget {
  var data;
  var funcion;

  CursoExterno(this.data,this.funcion);

  @override
  _CursoExternoState createState() => _CursoExternoState(this.data);
}

class _CursoExternoState extends State<CursoExterno> {
  var _data;

  _CursoExternoState(this._data);

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: EdgeInsets.only(top: 5,bottom: 5),
      child: Column(
        children: [
          Text("Nombre del curso: "+_data['nombre_curso']),
          Text("Institucion: "+_data['institucion']),
          Text("fecha de finalizacion:"+_data['fecha_finalizacion']),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(right: 10),
                child: ElevatedButton.icon(style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.red)),onPressed: (){
                  var prov = Provider.of<Proveedor>(this.context,listen: false);

                  var url = Uri.http(dominio.toString(), '/jeo/servicios/prc_curso_externo.php',{
                    'accion':'D',});
                  var datapost = jsonEncode({
                    "idCurso":_data['id'],
                    "usuario":prov.usr
                  });
                  http.post(url,body: datapost).then((value) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(jsonDecode(value.body)['info'])));
                    widget.funcion();
                  });
                }, icon: Icon(Icons.delete),label: Text("Eliminar"),),
              ),
              ElevatedButton.icon(style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green)),onPressed: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CapacitacionesR(_data)),
                );
              }, icon: Icon(Icons.edit),label: Text("editar"),)
            ],
          ),
        ],
      ),
    );
  }
}
