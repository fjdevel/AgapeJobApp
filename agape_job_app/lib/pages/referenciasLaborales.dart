import 'package:agape_job_app/pages/referencialaboralform.dart';
import 'package:agape_job_app/util/colors.dart';
import 'package:agape_job_app/util/globals.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'dart:convert';

import 'package:agape_job_app/services/provider.dart';

class ReferenciasLaborales extends StatefulWidget {
  @override
  _ReferenciasLaboralesState createState() => _ReferenciasLaboralesState();
}

class _ReferenciasLaboralesState extends State<ReferenciasLaborales> {
  
  List referencias=[];
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    obtenerReferencias();
  }
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Referencias Laborales"),
        backgroundColor: dPrimaryColor,
      ),
      body: Column(
        children: [
          for(var e in referencias)
            Center(
              child: Container(
                width: size.width*0.9,
                margin: EdgeInsets.only(bottom: 5),
                child:Card(
                  elevation: 10,
                  child:  Column(
                    children: [
                      Text("Empresa: "+e['empresa']),
                      Text("Nombre del Contacto:" +e['contacto_nombre']),
                      Text("Cargo: "+e['contacto_cargo']),
                      Text("Telefono: "+e['contacto_tel']),
                      Text("Email: "+e['contacto_email']),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 10),
                              child: ElevatedButton.icon(style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.red)),onPressed: (){
                                var prov = Provider.of<Proveedor>(this.context,listen: false);

                                var url = Uri.http(dominio.toString(), '/jeo/servicios/prc_ref_laboral.php',{
                                  'accion':'D',
                                  'idEstudiante':prov.idEstudiante,
                                  'user':prov.usr,
                                  'id':e['id']['id_ref_laboral']
                                });
                                http.get(url).then((value) {
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(jsonDecode(value.body)['info'])));
                                  obtenerReferencias();
                                });
                              }, icon: Icon(Icons.delete),label: Text("Eliminar"),),
                            ),
                            ElevatedButton.icon(style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green)),onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => ReferenciaLaboralForm(e)),
                              );
                            }, icon: Icon(Icons.edit),label: Text("editar"),)
                          ],
                        ),
                      )
                    ],
                  ),
                ),),
            ),
          Center(
            child: Container(
              margin: EdgeInsets.only(right: 10),
              child: ElevatedButton.icon(style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(dPrimaryColor)),
                onPressed: (){
                Navigator.of(context)
                        .popAndPushNamed(
                        "/referenciaLaboralForm");
              }, icon: Icon(Icons.add),label: Text("Agregar Referencia"),),
            ),
          )
        ],
      ),
    );
  }

  void obtenerReferencias() {
    var prov = Provider.of<Proveedor>(this.context,listen: false);
    var URI = Uri.http(dominio.toString(), "/jeo/servicios/prc_ref_laboral.php",
        {"accion": "C","idEstudiante":prov.idEstudiante});
    var response = http.get(URI);
    response.then((value) {
      setState(() {
        try{
          var respuesta = jsonDecode(value.body)['info'];
          for (var s in respuesta) {
            this.referencias.add(s);
          }
        }catch(e){
          referencias = [];
        };
      });
    });
  }
}
