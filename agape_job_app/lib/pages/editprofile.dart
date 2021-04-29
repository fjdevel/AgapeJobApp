import 'dart:convert';
import 'dart:developer';

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
  var nombreCon,seguCon,tercerCon,apellCon,segApCon,apellCasaCon,duiCon,nitCon,dirCon,numCon,numFijoCon,emailCon = TextEditingController();

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
    var departamentosDrop = DropDownText('| SELECCIONE DEPARTAMENTO', departamentos);

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
                TextFields('| SEGUNDO NOMBRE', Icons.account_circle),
                Texto('Tercer Nombre'),
                TextFields('| TERCER NOMBRE', Icons.account_circle),
                Texto('Primer Apellido'),
                TextFields('| PRIMER APELLIDO', Icons.account_circle),
                Texto('Segundo Apellido'),
                TextFields('| SEGUNDO APELLIDO', Icons.account_circle),
                Texto('Apellido de Casada'),
                TextFields('| APELLIDO DE CASADA', Icons.account_circle),
                Texto('Estado Civil'),
                DropDownText('| ESTADO CIVIL', ['Solter@', 'Casad@', 'Acompañaad@', 'Viud@', 'Divorciad@']),
                Texto('Sexo'),
                DropDownText('| SEXO', ['Hombre', 'Mujer']),
                Texto('Género'),
                DropDownText('| GÉNERO', ['1', '2', '3']),
                Texto('Fecha de Nacimiento'),
                FechaNacimiento(),
                Texto('DUI'),
                TextFields('| 99999999-9', Icons.badge),
                Texto('NIT'),
                TextFields('| 9999-999999-999-9', Icons.badge),
                Texto('Departamento'),
                departamentosDrop,
                Texto('Municipio'),
                DropDownText('| SELECCIONE MUNICIPIO', ['1', '2', '3', '4']),
                Texto('Dirección'),
                TextFields('| DIRECCIÓN', Icons.home),
                Texto('Número de Celular'),
                TextFields('| NÚMERO DE CELULAR', Icons.phone_android),
                Texto('Número Fijo'),
                TextFields('| NUMERO FIJO', Icons.phone),
                Texto('Correo Electrónico'),
                TextFields('| CORREO ELECTRÓNICO', Icons.mail),
                ChkGraduado(),
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
                      log(nombreCon.text);
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