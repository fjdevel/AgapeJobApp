import 'dart:convert';

import 'package:agape_job_app/services/provider.dart';
import 'package:agape_job_app/util/colors.dart';
import 'package:agape_job_app/util/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class ReferenciaLaboralForm extends StatefulWidget {
  var data;

  ReferenciaLaboralForm(this.data);

  @override
  _ReferenciaLaboralFormState createState() => _ReferenciaLaboralFormState();
}

class _ReferenciaLaboralFormState extends State<ReferenciaLaboralForm> {
  var empresa = TextEditingController(),
  nombre= TextEditingController(),
  cargo = TextEditingController(),
  tel = TextEditingController(),
  email = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(mounted){
      if(widget.data!=null){
        empresa.text = widget.data['empresa'];
        nombre.text = widget.data['contacto_nombre'];
        cargo.text = widget.data['contacto_cargo'];
        tel.text = widget.data['contacto_tel'];
        email.text = widget.data['contacto_email'];
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Referencia Laboral"),
        backgroundColor: dPrimaryColor,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
                width: MediaQuery.of(context).size.width * 0.85,
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                child: Text('Empresa')
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
                  controller: empresa,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 10),
                      hintText: 'Empresa',
                      suffixIcon: Icon(Icons.assignment_ind),
                      suffixIconConstraints: BoxConstraints(minWidth: 40)
                  ),
                )
            ),

            Container(
                width: MediaQuery.of(context).size.width * 0.85,
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                child: Text('Nombre del contacto')
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
                      hintText: 'Nombre del contacto',
                      suffixIcon: Icon(Icons.assignment_ind),
                      suffixIconConstraints: BoxConstraints(minWidth: 40)
                  ),
                )
            ),

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
                  controller: cargo,
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 10),
                      hintText: 'Cargo',
                      suffixIcon: Icon(Icons.assignment_ind),
                      suffixIconConstraints: BoxConstraints(minWidth: 40)
                  ),
                )
            ),

            Container(
                width: MediaQuery.of(context).size.width * 0.85,
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                child: Text('Telefono')
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
                      hintText: 'Telefono del contacto',
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
                  var url = Uri.http(dominio.toString(),'/jeo/servicios/prc_ref_laboral.php',{
                    "accion":"U",
                    "idEstudiante":prov.idEstudiante,
                    "id":widget.data['id']['id_ref_laboral'].toString(),
                    "empresa":empresa.text,
                    "contactoNombre":nombre.text,
                    "contactoTel":tel.text,
                    "contactoEmail":email.text,
                    "contactoCargo":cargo.text
                  });
                  var response = http.get(url);
                  response.then((value){
                    if(value.statusCode==200)
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value.body.toString()),));

                  });
                }, icon: Icon(Icons.save), label: Text("Actualizar Referencia Laboral"))
            )
                :Container(
                margin: EdgeInsets.only(top: 10),
                child:ElevatedButton.icon(onPressed: (){
                  var prov = Provider.of<Proveedor>(this.context,listen: false);
                  var url = Uri.http(dominio.toString(),'/jeo/servicios/prc_ref_laboral.php',{
                    "accion":"I",
                    "idEstudiante":prov.idEstudiante,
                    "user":prov.usr,
                    "empresa":empresa.text,
                    "contactoNombre":nombre.text,
                    "contactoTel":tel.text,
                    "contactoEmail":email.text,
                    "contactoCargo":cargo.text
                  });
                  var response = http.get(url);

                  response.then((value){
                    var r = jsonDecode(value.body);
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(r["info"]),));
                  });
                }, icon: Icon(Icons.save), label: Text("Guardar referencia Laboral"))
            )
          ],
        ),
      ),
    );
  }
}
