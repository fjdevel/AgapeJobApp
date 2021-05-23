import 'dart:convert';

import 'package:agape_job_app/services/provider.dart';
import 'package:agape_job_app/util/colors.dart';
import 'package:agape_job_app/util/globals.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;


class ReferenciaPersonalForm extends StatefulWidget {
  var data;

  ReferenciaPersonalForm(this.data);

  @override
  _ReferenciaPersonalFormState createState() => _ReferenciaPersonalFormState();
}

class _ReferenciaPersonalFormState extends State<ReferenciaPersonalForm> {
  var celular = TextEditingController(),
      nombre= TextEditingController(),
      tel = TextEditingController(),
      email = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(mounted){
      if(widget.data!=null)
        nombre.text = widget.data['nombre_completo'];
        celular.text = widget.data['tel_celular'];
        tel.text = widget.data['tel_fijo'];
        email.text = widget.data['email'];
      }
    }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Referencias Laborales"),
        backgroundColor: dPrimaryColor,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
                width: MediaQuery.of(context).size.width * 0.85,
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                child: Text('Nombre Completo')
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
                  controller: nombre,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 10),
                      hintText: 'Nombre Completo',
                      suffixIcon: Icon(Icons.assignment_ind),
                      suffixIconConstraints: BoxConstraints(minWidth: 40)
                  ),
                )
            ),

            Container(
                width: MediaQuery.of(context).size.width * 0.85,
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                child: Text('Telefono Fijo')
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
                  keyboardType: TextInputType.phone,
                  controller: tel,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 10),
                      hintText: 'Telefono Fijo',
                      suffixIcon: Icon(Icons.assignment_ind),
                      suffixIconConstraints: BoxConstraints(minWidth: 40)
                  ),
                )
            ),

            Container(
                width: MediaQuery.of(context).size.width * 0.85,
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                child: Text('Telefono Celular')
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
                  controller: celular,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 10),
                      hintText: 'Telfono Celular',
                      suffixIcon: Icon(Icons.assignment_ind),
                      suffixIconConstraints: BoxConstraints(minWidth: 40)
                  ),
                )
            ),

            Container(
                width: MediaQuery.of(context).size.width * 0.85,
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                child: Text('Email')
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
                  controller: email,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 10),
                      hintText: 'Email',
                      suffixIcon: Icon(Icons.assignment_ind),
                      suffixIconConstraints: BoxConstraints(minWidth: 40)
                  ),
                )
            ),

            widget.data!=null?
            Container(
                margin: EdgeInsets.only(top: 10),
                child:ElevatedButton.icon(onPressed: (){
                  var prov = Provider.of<Proveedor>(this.context,listen: false);
                  var url = Uri.http(dominio.toString(),'/jeo/servicios/prc_ref_personal.php',{
                    "accion":"U",
                    "id":widget.data['id']['id_ref_personal'].toString(),
                    "idEstudiante":prov.idEstudiante,
                    "user":prov.usr,
                    "nombreCompleto":nombre.text,
                    "telFijo":tel.text,
                    "email":email.text,
                    "telCel":celular.text
                  });
                  var response = http.get(url);
                  response.then((value){
                    if(value.statusCode==200)
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value.body.toString()),));

                  });
                }, icon: Icon(Icons.save), label: Text("Actualizar Experiencia Laboral"))
            )
                :Container(
                margin: EdgeInsets.only(top: 10),
                child:ElevatedButton.icon(onPressed: (){
                  var prov = Provider.of<Proveedor>(this.context,listen: false);
                  var url = Uri.http(dominio.toString(),'/jeo/servicios/prc_ref_laboral.php',{
                    "accion":"I",
                    "idEstudiante":prov.idEstudiante,
                    "user":prov.usr,
                    "nombreCompleto":nombre.text,
                    "telFijo":tel.text,
                    "email":email.text,
                    "telCel":celular.text
                  });
                  var response = http.get(url);

                  response.then((value){
                    var r = jsonDecode(value.body);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(r["info"]),));
                  });
                }, icon: Icon(Icons.save), label: Text("Guardar Referencia Personal"))
            )
          ],
        ),
      ),
    );
  }


}
