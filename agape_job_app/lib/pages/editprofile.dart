import 'dart:convert';
import 'dart:developer';

import 'package:agape_job_app/services/provider.dart';
import 'package:agape_job_app/util/colors.dart';
import 'package:agape_job_app/util/globals.dart';
import 'package:agape_job_app/widget/editprofile/btneditprofile.dart';
import 'package:agape_job_app/widget/editprofile/chkgraduado.dart';
import 'package:agape_job_app/widget/editprofile/droptextfields.dart';
import 'package:agape_job_app/widget/editprofile/fechanacimiento.dart';
import 'package:agape_job_app/widget/editprofile/textfields.dart';
import 'package:agape_job_app/widget/editprofile/textos.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';


class FormularioIngreso extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _FormularioIngreso();
 
}

class _FormularioIngreso extends State<FormularioIngreso>{
  final _scaffoldkey = GlobalKey<ScaffoldState>();
  List<String> departamentos= [""];
  List<String> municipios= [""];
  List<String> generos = ["HETEROSEXUAL","LESBIANA","GAY","BISEXUAL","TRANSEXUAL","INTERSEXUAL"];
  List<String> sexos = ['Hombre', 'Mujer'];
  List<String> estados = ['SOLTERO (A)', 'CASADO (A)','DIVORCIADO (A)','SEPARADO(A)','UNION LIBRE'];

  var nombreCon = TextEditingController(),carnetCon = TextEditingController(),seguCon = TextEditingController(),tercerCon = TextEditingController(),apellCon = TextEditingController(),segApCon = TextEditingController(),apellCasaCon = TextEditingController(),duiCon = TextEditingController(),nitCon = TextEditingController(),dirCon = TextEditingController(),numCon = TextEditingController(),numFijoCon = TextEditingController(),emailCon = TextEditingController();
  var check = ChkGraduado();
  String _chosenValueM;
  String _chosenValueD;
  String _chosenValueG;
  String _chosenValueS;
  String _chosenValueE;

  var fecha = FechaNacimiento();
  @override
  void initState() {
    super.initState();
    var url = Uri.http(dominio.toString(),'/jeo/servicios/consultar_departamentos.php');

    var respDept = http.get(url);
    respDept.then((value){
      setState(() {
          var li = jsonDecode(value.body);
          for(var d in  li){
            departamentos.add(d["descripcion"]);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var departamentosDrop =Container(
        margin: EdgeInsets.only(top: 5.0),
        padding: EdgeInsets.only(left: 15.0, right: 10.0),
        height: 40.0,
        width: MediaQuery.of(context).size.width * 0.85,
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
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            hint: Text("| SELECCIONE DEPARTAMENTO"),
            style: TextStyle(color: Colors.black),
            items: departamentos.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String value) {
              var url = Uri.http(dominio.toString(),'/jeo/servicios/consultar_municipio.php',{
                "idDepto":departamentos.indexOf(value).toString()
              });
              _chosenValueD = departamentos.indexOf(value).toString();
              var respDept = http.get(url);
              respDept.then((val){
                setState(() {
                  var li = jsonDecode(val.body);
                  municipios = [];
                  for(var d in  li){
                    municipios.add(d["descripcion"]);
                  }
                });
              });
            },
          ),
        )
    );
    var municipioDrop = Container(
        margin: EdgeInsets.only(top: 5.0),
        padding: EdgeInsets.only(left: 15.0, right: 10.0),
        height: 40.0,
        width: MediaQuery.of(context).size.width * 0.85,
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
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            hint: Text("| SELECCIONE MUNICIPIO"),

            style: TextStyle(color: Colors.black),
            items: municipios.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String value) {
              setState(() {
                _chosenValueM = municipios.indexOf(value).toString();
              });
            },
          ),
        )
    );
    var generosDrop = Container(
        margin: EdgeInsets.only(top: 5.0),
        padding: EdgeInsets.only(left: 15.0, right: 10.0),
        height: 40.0,
        width: MediaQuery.of(context).size.width * 0.85,
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
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            hint: Text("| SELECCIONE GENERO"),

            style: TextStyle(color: Colors.black),
            items: generos.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String value) {
              setState(() {
                _chosenValueG = (int.tryParse(generos.indexOf(value).toString())+1).toString();
              });
            },
          ),
        )
    );
    var sexosDrop = Container(
        margin: EdgeInsets.only(top: 5.0),
        padding: EdgeInsets.only(left: 15.0, right: 10.0),
        height: 40.0,
        width: MediaQuery.of(context).size.width * 0.85,
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
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            hint: Text("| SELECCIONE SEXO"),

            style: TextStyle(color: Colors.black),
            items: sexos.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String value) {
              setState(() {
                if(value=="Hombre")
                _chosenValueS = "H";
                else
                  _chosenValueS= "M";
              });
            },
          ),
        )
    );
    var estadosDrop = Container(
        margin: EdgeInsets.only(top: 5.0),
        padding: EdgeInsets.only(left: 15.0, right: 10.0),
        height: 40.0,
        width: MediaQuery.of(context).size.width * 0.85,
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
        child: DropdownButtonHideUnderline(
          child: DropdownButton<String>(
            hint: Text("| SELECCIONE ESTADO CIVIL"),

            style: TextStyle(color: Colors.black),
            items: estados.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String value) {
              setState(() {
                  _chosenValueE= (int.tryParse(estados.indexOf(value).toString())+1).toString();
              });
            },
          ),
        )
    );
    print(_chosenValueG);
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        backgroundColor: dPrimaryColor,
        title: Text(' '),
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
                Texto('Primer Nombre'),
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
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 10),
                          hintText: '| PRIMER NOMBRE'
                      ),
                      controller: nombreCon,
                    )
                ),
                Texto('Segundo Nombre'),
<<<<<<< HEAD
                TextFields('| SEGUNDO NOMBRE', Icons.account_circle),
                Texto('Tercer Nombre'),
                TextFields('| TERCER NOMBRE', Icons.account_circle),
                Texto('Primer Apellido'),
                TextFields('| PRIMER APELLIDO', Icons.account_circle),
                Texto('Segundo Apellido'),
                TextFields('| SEGUNDO APELLIDO', Icons.account_circle),
                Texto('Apellido de Casada'),
                TextFields('| APELLIDO DE CASADA', Icons.account_circle),
=======
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
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 10),
                          hintText: '| SEGUNDO NOMBRE'
                      ),
                      controller: seguCon,
                    )
                ),
                Texto('Tercer Nombre'),
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
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 10),
                          hintText: '| TERCER NOMBRE'
                      ),
                      controller: tercerCon,
                    )
                ),
                Texto('Primer Apellido'),
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
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 10),
                          hintText: '| PRIMER APELLIDO'
                      ),
                      controller: apellCon,
                    )
                ),
                Texto('Segundo Apellido'),
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
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 10),
                          hintText: '| SEGUNDO APELLIDO'
                      ),
                      controller: segApCon,
                    )
                ),
                Texto('Apellido de Casada'),
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
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 10),
                          hintText: '| APELLIDO DE CASADA'
                      ),
                      controller: apellCasaCon,
                    )
                ),
                Texto('Carnet'),
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
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 10),
                          hintText: '| CARNET'
                      ),
                      controller:carnetCon,
                    )
                ),
>>>>>>> bde6e07b1f9916c90cd0423abbd6b229ef289d29
                Texto('Estado Civil'),
                estadosDrop,
                Texto('Sexo'),
                sexosDrop,
                Texto('Género'),
                generosDrop,
                Texto('Fecha de Nacimiento'),
                fecha,
                Texto('DUI'),
<<<<<<< HEAD
                TextFields('| 99999999-9', Icons.badge),
                Texto('NIT'),
                TextFields('| 9999-999999-999-9', Icons.badge),
=======
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
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 10),
                          hintText: '| 99999999-9'
                      ),
                      controller: duiCon,
                    )
                ),
                Texto('NIT'),
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
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 10),
                          hintText: '| 9999-999999-999-9'
                      ),
                      controller: nitCon,
                    )
                ),
>>>>>>> bde6e07b1f9916c90cd0423abbd6b229ef289d29
                Texto('Departamento'),
                departamentosDrop,
                Texto('Municipio'),
                municipioDrop,
                Texto('Dirección'),
<<<<<<< HEAD
                TextFields('| DIRECCIÓN', Icons.home),
                Texto('Número de Celular'),
                TextFields('| NÚMERO DE CELULAR', Icons.phone_android),
                Texto('Número Fijo'),
                TextFields('| NUMERO FIJO', Icons.phone),
                Texto('Correo Electrónico'),
                TextFields('| CORREO ELECTRÓNICO', Icons.mail),
                ChkGraduado(),
=======
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
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 10),
                          hintText: '| DIRECCION'
                      ),
                      controller: dirCon,
                    )
                ),
                Texto('Número de Celular'),
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
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 10),
                          hintText: '| NÚMERO DE CELULAR'
                      ),
                      controller: numCon,
                    )
                ),
                Texto('Número Fijo'),
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
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 10),
                          hintText: '| NUMERO FIJO'
                      ),
                      controller: numFijoCon,
                    )
                ),
                Texto('Correo Electrónico'),
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
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 10),
                          hintText: '| CORREO ELECTRÓNICO'
                      ),
                      controller: emailCon,
                    )
                ),
                check,
>>>>>>> bde6e07b1f9916c90cd0423abbd6b229ef289d29
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
                      'Ingresar Datos',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w300
                      ),
                    ),
                    onPressed: (){
                      print(_chosenValueG);
                      var prov = Provider.of<Proveedor>(this.context,listen: false);
                      var url = Uri.http(dominio.toString(),'/jeo/servicios/ctg_estudiante.php',{
                        "accion":"U",
                        "id":prov.idEstudiante,
                        "idDepto":_chosenValueD,
                        "idMuni":_chosenValueM,
                        "idEstCivil":_chosenValueE,
                        "idGenero":_chosenValueG,
                        "carnet":carnetCon.text.toString(),
                        "pNombre":nombreCon.text.toString(),
                        "sNombre":seguCon.text.toString(),
                        "tNombre":tercerCon.text.toString(),
                        "pApellido":apellCon.text.toString(),
                        "sApellido":segApCon.text.toString(),
                        "cApellido":apellCasaCon.text.toString(),
                        "sexo":_chosenValueS,
                        "fechaNac":fecha.currentDate.toString(),
                        "dui":duiCon.text.toString(),
                        "nit":nitCon.text.toString(),
                        "numCelular":numCon.text.toString(),
                        "numFijo":numFijoCon.text.toString(),
                        "direccion":dirCon.text.toString(),
                        "email":emailCon.text.toString(),
                        "graduado":check.isGraduadoCFP?1.toString():0.toString(),
                        "estado":"A",
                        "user":prov.usr
                      });

                      var response = http.get(url);

                      response.then((value) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Se registro correctamente")));
                      });
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}