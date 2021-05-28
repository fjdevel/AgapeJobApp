import 'dart:convert';

import 'package:agape_job_app/services/provider.dart';
import 'package:agape_job_app/util/colors.dart';
import 'package:agape_job_app/util/globals.dart';
import 'package:agape_job_app/widget/editprofile/chkgraduado.dart';
import 'package:agape_job_app/widget/editprofile/fechanacimiento.dart';
import 'package:agape_job_app/widget/editprofile/textos.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';


class FormularioIngreso extends StatefulWidget {
  var data;
  var funcion;

  FormularioIngreso(this.data,this.funcion);

  @override
  State<StatefulWidget> createState() => _FormularioIngreso(this.data);
 
}

class _FormularioIngreso extends State<FormularioIngreso>{
  var _data;

  _FormularioIngreso(this._data);

  final _scaffoldkey = GlobalKey<ScaffoldState>();
  List<String> departamentos= [""];
  String departamentoHint = "Seleccione el departamento";
  List<String> municipios= [""];
  String municipioHint = "Seleccione el municipio";
  List<String> generos = ["HETEROSEXUAL","LESBIANA","GAY","BISEXUAL","TRANSEXUAL","INTERSEXUAL"];
  String generoHint="Seleccione el genero";
  List<String> sexos = ['Hombre', 'Mujer'];
  String sexoHint="Seleccione el Sexo";
  List<String> estados = ['SOLTERO (A)', 'CASADO (A)','DIVORCIADO (A)','SEPARADO(A)','UNION LIBRE'];
  String estadoHint="Seleccione el estado civil";

  var nombreCon = TextEditingController(),carnetCon = TextEditingController(),seguCon = TextEditingController(),tercerCon = TextEditingController(),apellCon = TextEditingController(),segApCon = TextEditingController(),apellCasaCon = TextEditingController(),duiCon = TextEditingController(),nitCon = TextEditingController(),dirCon = TextEditingController(),numCon = TextEditingController(),numFijoCon = TextEditingController(),emailCon = TextEditingController();
  var check = ChkGraduado();
  String _chosenValueM="";
  String _chosenValueD="";
  String _chosenValueG="";
  String _chosenValueS="";
  String _chosenValueE="";

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

    setState(() {
      sexoHint = _data['sexo']=="M"?"Hombre":"Mujer";
      estadoHint = _data['id_est_civil']==null?"":_data['id_est_civil']['descripcion'];
      generoHint = _data['id_genero']==null?"":_data['id_genero']['descripcion'];
      municipioHint = _data['id_muni']==null?"":_data['id_muni']['descripcion'];
      departamentoHint = _data['id_depto']['descripcion'];
      nombreCon.text = _data['p_nombre'];
      seguCon.text = _data['s_nombre'];
      tercerCon.text = _data['t_nombre'];
      apellCon.text = _data['p_apellido'];
      segApCon.text = _data['s_apellido'];
      apellCasaCon.text =_data['c_apellido'];
      carnetCon.text = _data['carnet'].toString();
      duiCon.text = _data['dui'];
      nitCon.text = _data['nit'];
      dirCon.text = _data['direccion'];
      numCon.text = _data['num_celular'];
      numFijoCon.text = _data['num_fijo'];
      emailCon.text=_data['email'];
      print(_data['graduado']);
      if(_data['graduado']=="1")
        check.isGraduadoCFP = true;
      else
        check.isGraduadoCFP = false;
    });
  }

  @override
  Widget build(BuildContext context) {
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
            hint: Text(departamentoHint),
            style: TextStyle(color: Colors.black),
            items: departamentos.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String value) {
              var url = Uri.http(dominio.toString(),'/jeo/servicios/consultar_municipio.php',{
                "idDepto":(int.tryParse(departamentos.indexOf(value).toString())).toString()
              });

              var respDept = http.get(url);
              respDept.then((val){
                setState(() {
                  _chosenValueD = (int.tryParse(departamentos.indexOf(value).toString())).toString();
                  var li = jsonDecode(val.body);
                  municipios = [];
                  for(var d in  li){
                    municipios.add(d["descripcion"]);

                  }
                  departamentoHint = value;
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
            hint: Text(municipioHint),

            style: TextStyle(color: Colors.black),
            items: municipios.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (String value) {
              setState(() {
                _chosenValueM = (int.tryParse(municipios.indexOf(value).toString())+1).toString();
                municipioHint = value;
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
            hint: Text(generoHint),

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
                generoHint = value;
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
            hint: Text(sexoHint),

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

                sexoHint = value;
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
            hint: Text(estadoHint),
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
                estadoHint = value;
              });
            },
          ),
        )
    );

    Size size = MediaQuery.of(context).size;

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
                          hintText: 'PRIMER NOMBRE',
                          suffixIcon: Icon(Icons.account_circle),
                          suffixIconConstraints: BoxConstraints(minWidth: 40),
                      ),
                      controller: nombreCon,
                    )
                ),
                Texto('Segundo Nombre'),
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
                          hintText: 'SEGUNDO NOMBRE',
                        suffixIcon: Icon(Icons.account_circle),
                        suffixIconConstraints: BoxConstraints(minWidth: 40),
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
                          hintText: 'TERCER NOMBRE',
                        suffixIcon: Icon(Icons.account_circle),
                        suffixIconConstraints: BoxConstraints(minWidth: 40),
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
                          hintText: 'PRIMER APELLIDO',
                        suffixIcon: Icon(Icons.account_circle),
                        suffixIconConstraints: BoxConstraints(minWidth: 40),
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
                          hintText: '| SEGUNDO APELLIDO',
                        suffixIcon: Icon(Icons.account_circle),
                        suffixIconConstraints: BoxConstraints(minWidth: 40),
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
                          hintText: '| APELLIDO DE CASADA',
                        suffixIcon: Icon(Icons.account_circle),
                        suffixIconConstraints: BoxConstraints(minWidth: 40),
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
                          hintText: '| CARNET',
                        suffixIcon: Icon(Icons.account_balance_wallet),
                        suffixIconConstraints: BoxConstraints(minWidth: 40),
                      ),
                      controller:carnetCon,
                    )
                ),
                Texto('Estado Civil *'),
                estadosDrop,
                Texto('Sexo'),
                sexosDrop,
                Texto('Género *'),
                generosDrop,
                Texto('Fecha de Nacimiento'),
                fecha,
                Texto('DUI'),
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
                          hintText: '| 99999999-9',
                        suffixIcon: Icon(Icons.account_circle),
                        suffixIconConstraints: BoxConstraints(minWidth: 40),
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
                          hintText: '| 9999-999999-999-9',
                        suffixIcon: Icon(Icons.account_circle),
                        suffixIconConstraints: BoxConstraints(minWidth: 40),
                      ),
                      controller: nitCon,
                    )
                ),
                Texto('Departamento *'),
                departamentosDrop,
                Texto('Municipio *'),
                municipioDrop,
                Texto('Dirección'),
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
                          hintText: '| DIRECCION',
                        suffixIcon: Icon(Icons.home),
                        suffixIconConstraints: BoxConstraints(minWidth: 40),
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
                          hintText: '| NÚMERO DE CELULAR',
                        suffixIcon: Icon(Icons.phone_android),
                        suffixIconConstraints: BoxConstraints(minWidth: 40),
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
                          hintText: '| NUMERO FIJO',
                        suffixIcon: Icon(Icons.phone),
                        suffixIconConstraints: BoxConstraints(minWidth: 40),
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
                          hintText: '| CORREO ELECTRÓNICO',
                        suffixIcon: Icon(Icons.email),
                        suffixIconConstraints: BoxConstraints(minWidth: 40),
                      ),
                      controller: emailCon,
                    )
                ),
                check,
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

                      var prov = Provider.of<Proveedor>(this.context,listen: false);
                      var data = {
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
                      };
                      var url = Uri.http(dominio.toString(),'/jeo/servicios/ctg_estudiante.php',data);
                      print(url.normalizePath());
                      if(_chosenValueE!=null&&_chosenValueG!=null&&_chosenValueM!=null&&_chosenValueD!=null){
                        var response = http.get(url);

                        response.then((value) {
                          this.widget.funcion();
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Registro actualizado")));

                        });
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Hay campos obligatorios no llenados!")));
                      }

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