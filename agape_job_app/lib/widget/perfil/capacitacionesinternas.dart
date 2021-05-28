import 'dart:convert';
import 'dart:developer';

import 'package:agape_job_app/services/provider.dart';
import 'package:agape_job_app/util/colors.dart';
import 'package:agape_job_app/util/globals.dart';
import 'package:agape_job_app/widget/common/dataPicker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class CapacitacionesInternasForm extends StatefulWidget {
  var data;
  var funcion;

  CapacitacionesInternasForm(this.data, this.funcion);


  @override
  _CapacitacionesInternasFormState createState() =>
      _CapacitacionesInternasFormState();
}

class _CapacitacionesInternasFormState
    extends State<CapacitacionesInternasForm> {


  String sedeHint ="Seleccione la sede";
  String sedeValue;

  String proyectoHint = "Seleccione el proyecto";
  String proyectoValue;

  String grupoHint="Seleccione el grupo";
  String grupoValue;

  String cursoHint="Seleccione el curso";
  String cursoValue;

  List proyectos=[];
  List cursos=[];
  List sedes = [];
  List grupos=[];


  var emailController = new TextEditingController();
  var fecha = new DataPicker(null);

  final _scaffoldkey = GlobalKey<ScaffoldState>();

  _CapacitacionesInternasFormState();

  @override
  void initState() {
    super.initState();
    if (mounted) {
      obtenerSedes();
      obtenerProyectos();
      obtenerGrupos();
      obtenerCursos();
    }
    if(widget.data!=null){
      emailController.text = widget.data['email_contacto'];
      var fechaA= widget.data['fecha_fin'].toString().split("/");
      fecha.currentDate = DateTime.parse(fechaA[2]+"-"+fechaA[1]+"-"+fechaA[0]);
      sedeValue = widget.data['ctgSede']['id'];
      sedeHint = widget.data['ctgSede']['descripcion'];
      proyectoValue = widget.data['ctgProyecto']['id'];
      proyectoHint = widget.data['ctgProyecto']['descripcion'];
      grupoValue = widget.data['ctgGrupo']['id'];
      grupoHint = widget.data['ctgGrupo']['descripcion'];
      cursoValue = widget.data['curso']['id'];
      cursoHint = widget.data['curso']['descripcion'];
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    //dropdowns
    var sedeDrop = DropdownButton<String>(
      hint: Text(sedeHint),
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
          sedeValue = newValue;
          for(var s in sedes){
            if(s['id']==newValue)
              sedeHint = s['descripcion'];
          }
        });
      },
      items: sedes.map<DropdownMenuItem<String>>((dynamic value) {
        return DropdownMenuItem<String>(
          value: value['id'],
          child: Text(value['descripcion']),
        );
      }).toList(),
    );
    var proyectoDrop = DropdownButton<String>(
      hint: Text(proyectoHint),
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
          proyectoValue = newValue;
          for(var s in proyectos){
            if(s['id']==newValue)
              if(s['descripcion'].toString().length>25)
                proyectoHint = s['descripcion'].toString().substring(0,25);
              else
                proyectoHint = s['descripcion'];
          }
        });
      },
      items: proyectos.map<DropdownMenuItem<String>>((dynamic value) {
        return DropdownMenuItem<String>(
          value: value['id'],
          child: Container(
            child:Text(value['descripcion']),
          )
        );
      }).toList(),
    );
    var grupoDrop = DropdownButton<String>(
      hint: Text(grupoHint),
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
          grupoValue = newValue;
          for(var s in grupos){
            if(s['id']==newValue)
              if(s['descripcion'].toString().length>25)
                grupoHint = s['descripcion'].toString().substring(0,25);
              else
                grupoHint = s['descripcion'];
          }
        });
      },
      items: grupos.map<DropdownMenuItem<String>>((dynamic value) {
        return DropdownMenuItem<String>(
            value: value['id'],
            child: Container(
              child:Text(value['descripcion']),
            )
        );
      }).toList(),
    );
    var cursoDrop = DropdownButton<String>(
      hint: Text(cursoHint),
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
          cursoValue = newValue;
          for(var s in cursos){
            if(s['id']==newValue)
              if(s['descripcion'].toString().length>25)
                cursoHint = s['descripcion'].toString().substring(0,25);
              else
                cursoHint = s['descripcion'];
          }
        });
      },
      items: cursos.map<DropdownMenuItem<String>>((dynamic value) {
        return DropdownMenuItem<String>(
            value: value['id'],
            child: Container(
              child:Text(value['descripcion']),
            )
        );
      }).toList(),
    );

    var emailText = Container(
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
          controller: emailController,
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 10),
              hintText: 'Email',
              suffixIcon: Icon(Icons.email),
              suffixIconConstraints: BoxConstraints(minWidth: 40)
          ),
        )
    );



    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        title: Text("Capacitaciones Internas"),
        backgroundColor: dPrimaryColor,
      ),
      body: Container(
        height: size.height * 0.9,
        width: size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: size.width*0.8,
                margin: EdgeInsets.only(top: 10),
                child: sedeDrop,
              ),
              Container(
                width: size.width*0.8,
                margin: EdgeInsets.only(top: 10),
                child: proyectoDrop,
              ),
              Container(
                width: size.width*0.8,
                margin: EdgeInsets.only(top: 10),
                child: grupoDrop,
              ),
              Container(
                width: size.width*0.8,
                margin: EdgeInsets.only(top: 10),
                child:cursoDrop,
              ),
              Container(
                width: size.width*0.8,
                margin: EdgeInsets.only(top: 10),
                child:emailText,
              ),
              Container(
                width: size.width*0.8,
                margin: EdgeInsets.only(top: 10),
                child:fecha,
              ),
              Container(
                width: size.width * 0.85,
                margin: EdgeInsets.fromLTRB(15, 15, 15, 25),
                child: RaisedButton(
                  padding: EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  color: Colors.brown,
                  child: Text(
                    'Ingresar Capacitacion',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w300
                    ),
                  ),
                  onPressed: (){
                    var prov = Provider.of<Proveedor>(this.context,listen: false);
                    var url = Uri.http(dominio.toString(),'/jeo/servicios/prc_curso_estudiante.php',{
                      "accion":"I",
                    });
                    var data = jsonEncode({
                      "email_contacto":emailController.text,
                      "fecha_fin":fecha.currentDate.toString(),
                      "insaforp":"0",
                      "usuario":prov.usr,
                      "curso":{
                        "id":cursoValue
                      },
                      "ctgSede":{
                        "id":sedeValue,
                      },
                      "ctgProyecto":{
                        "id":proyectoValue
                      },
                      "ctgGrupo":{
                        "id":grupoValue
                      },
                      "ctgEstudiante":{
                        "id":{
                          "id":prov.idEstudiante
                        }
                      }
                    });

                    var response = http.post(url,body: data);

                    response.then((value) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(jsonDecode(value.body)["info"])));

                    });
                    this.widget.funcion();
                  },
                ),
              )

            ],
          ),
        ),
      ),
    );
  }

  void obtenerSedes() {
    var URI = Uri.http(dominio.toString(), "/jeo/servicios/ctg_sede.php",
        {"accion": "C", "estado": "A"});
    var response = http.get(URI);
    response.then((value) {
      setState(() {
        var respuesta = jsonDecode(value.body)['info'];
        for (var s in respuesta) {
          this.sedes.add(s);
        }
      });
    });
  }
  void obtenerProyectos() {
    var URI = Uri.http(dominio.toString(), "/jeo/servicios/ctg_proyecto.php",
        {"accion": "C", "estado": "A"});
    var response = http.get(URI);
    response.then((value) {
      setState(() {
        var respuesta = jsonDecode(value.body)['info'];
        for (var s in respuesta) {
          this.proyectos.add(s);
        }
      });
    });
  }
  void obtenerGrupos() {
    var URI = Uri.http(dominio.toString(), "/jeo/servicios/ctg_grupo.php",
        {"accion": "C", "estado": "A"});
    var response = http.get(URI);
    response.then((value) {
      setState(() {
        var respuesta = jsonDecode(value.body)['info'];
        for (var s in respuesta) {
          this.grupos.add(s);
        }
      });
    });
  }
  void obtenerCursos() {
    var URI = Uri.http(dominio.toString(), "/jeo/servicios/ctg_curso.php",
        {"accion": "C", "estado": "A"});
    var response = http.get(URI);
    response.then((value) {
      setState(() {
        var respuesta = jsonDecode(value.body)['info'];
        for (var s in respuesta) {
          this.cursos.add(s);
        }
      });
    });
  }

}
