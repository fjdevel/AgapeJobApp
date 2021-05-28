import 'dart:convert';

import 'package:agape_job_app/services/provider.dart';
import 'package:agape_job_app/util/colors.dart';
import 'package:agape_job_app/util/globals.dart';
import 'package:agape_job_app/widget/common/dataPicker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
class FormacionAcademicaForm extends StatefulWidget {
  var data;
 var actualizar;
  FormacionAcademicaForm(this.data,this.actualizar);


  @override
  _FormacionAcademicaFormState createState() => _FormacionAcademicaFormState();
}

class _FormacionAcademicaFormState extends State<FormacionAcademicaForm> {
  var institucionController= new TextEditingController();
  var modalidadController= new TextEditingController();
  var fecha = DataPicker(null);
  String gradoHint ="Seleccione el grado obtenido";
  String gradoValue;
  List grados=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(mounted){
      obtenerGrados();
    }
    if(widget.data!=null){
      var fechaA= widget.data['fecha_fin'].toString().split("/");
      fecha.currentDate = DateTime.parse(fechaA[2]+"-"+fechaA[1]+"-"+fechaA[0]);
      modalidadController.text = widget.data['titulo_recibido'];
      institucionController.text = widget.data['institucion'];
      gradoValue = widget.data['ctgNivEstudio']['id'];
      gradoHint = widget.data['ctgNivEstudio']['descripcion'];
    }

  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var gradoDrop = DropdownButton<String>(
      hint: Text(gradoHint),
      icon: const Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: const TextStyle(color: dPrimaryColor),
      underline: Container(
        height: 2,
        color: dPrimaryColor,
      ),
      onChanged: (String newValue) {
        setState(() {
          gradoValue = newValue;
          for(var s in grados){
            if(s['id']==newValue)
              gradoHint = s['descripcion'];
          }
        });
      },
      items: grados.map<DropdownMenuItem<String>>((dynamic value) {
        return DropdownMenuItem<String>(
          value: value['id'],
          child: Text(value['descripcion']),
        );
      }).toList(),
    );
    var institucionText = Container(
        width: size.width *0.85,
        margin: EdgeInsets.only(top: 10.0),
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
              hintText: 'Institucion',
              suffixIcon: Icon(Icons.account_balance),
              suffixIconConstraints: BoxConstraints(minWidth: 40)
          ),
        )
    );
    var modalidadText = Container(
        width: size.width *0.85,
        margin: EdgeInsets.only(top: 10.0),
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
          controller: modalidadController,
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 10),
              hintText: 'Titulo Obtenido',
              suffixIcon: Icon(Icons.account_balance),
              suffixIconConstraints: BoxConstraints(minWidth: 40)
          ),
        )
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Formacion Academica"),
        backgroundColor: dPrimaryColor,
      ),
      body: Container(
        child: Column(
          children: [
            Center(
              child: gradoDrop,
            ),
            Center(
              child: institucionText,
            ),
            Center(
              child: modalidadText,
            ),
            Center(
              child: fecha,
            ),
            Center(
              child: widget.data!=null?
              Container(
                  margin: EdgeInsets.only(top: 10),
                  child:ElevatedButton.icon(onPressed: (){
                    var prov = Provider.of<Proveedor>(this.context,listen: false);
                    var url = Uri.http(dominio.toString(),'/jeo/servicios/prc_formacion_academica.php',{
                      "accion":"U",
                      "idFormacion":widget.data["id"]['id'],
                      "idEstudiante":prov.idEstudiante,
                      "ultimoGrado":gradoValue,
                      "tituloRecibido":modalidadController.text,
                      "institucion":institucionController.text,
                      "fechaFin":fecha.currentDate.toString(),
                      "user":prov.usr
                    });
                    var response = http.get(url);
                    response.then((value){
                      if(value.statusCode==200)
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(jsonDecode(value.body)['info']),));
                      this.widget.actualizar();
                    });
                  }, icon: Icon(Icons.save), label: Text("Actualizar Experiencia Laboral"))
              )
                  :Container(
                  margin: EdgeInsets.only(top: 10),
                  child:ElevatedButton.icon(onPressed: (){
                    if(gradoValue!=null){
                      var prov = Provider.of<Proveedor>(this.context,listen: false);
                      var url = Uri.http(dominio.toString(),'/jeo/servicios/prc_formacion_academica.php',{
                        "accion":"IP",
                        "user":prov.usr
                      });
                      var response = http.post(url,body: jsonEncode({
                        "ctgEstudiante":{
                          "id":{
                            "id":prov.idEstudiante
                          }
                        },
                        "ctgNivEstudio":{
                          "id":gradoValue
                        },
                        "fecha_fin":fecha.currentDate.toString(),
                        "institucion":institucionController.text,
                        "titulo_recibido":modalidadController.text
                      }));

                      response.then((value){
                        var r = jsonDecode(value.body);
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(r["info"]),));
                        this.widget.actualizar();
                      });
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Debe seleccionar un grado"),));
                    }
                  }, icon: Icon(Icons.save), label: Text("Guardar Formacion Academica"))
              ),
            )
          ],
        ),
      ),
    );
  }

  void obtenerGrados() {
    var URI = Uri.http(dominio.toString(), "/jeo/servicios/ctg_niv_estudio.php",
        {"accion": "C"});
    var response = http.get(URI);
    response.then((value) {
      setState(() {
        var respuesta = jsonDecode(value.body)['info'];
        for (var s in respuesta) {
          this.grados.add(s);
        }
      });
    });
  }
}
