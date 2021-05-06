import 'dart:convert';
import 'dart:developer';

import 'package:agape_job_app/services/provider.dart';
import 'package:agape_job_app/util/colors.dart';
import 'package:agape_job_app/util/globals.dart';
import 'package:agape_job_app/widget/perfil/textinfo.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class Aplicaciones extends StatefulWidget {
  @override
  _AplicacionesState createState() => _AplicacionesState();
}

class _AplicacionesState extends State<Aplicaciones> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  List<dynamic> text = [];

  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
    var prov = Provider.of<Proveedor>(this.context,listen: false);
    var url = Uri.http(dominio.toString(),'/jeo/servicios/consultar_aplicaciones.php',{
      'accion':'C',
      'mispost':'Y',
      'fechaFinal':'Y',
      'idEstudiante':prov.idEstudiante

    });
    var response = http.get(url);
    response.then((value){
      setState(() {
        text = jsonDecode(value.body);
      });
    });
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: Text("Mis postulaciones"),leading: BackButton(color: Colors.white),centerTitle: true,
        backgroundColor: dPrimaryColor,
        elevation: 0.0,
        bottomOpacity: 0.0,
        automaticallyImplyLeading: true,
        iconTheme: IconThemeData(color: Colors.black),),
      body: Center(
        child: Container(
          width: size.width*0.8,
          child: ListView(
            children:
            text.map((e){
              return  Container(
                width: size.width*0.9,
                margin: EdgeInsets.only(top: 10),
                child: Card(
                  elevation: 5,
                  child: Text("Descripcion: "+e["descripcion"]+"\n\n"+
                      "Empresa: "+e["ctgEmpresa"]["razon_social"]+"\n\n"+
                      "Salario: "+e["salario"]+"\n\n"+
                      "Fecha de publicacion: "+e["fecha_publicacion"]+"\n\n"
                  ),
                ),
              );
            }).toList()
            ,
          ),
        ),
      )
    );
  }
}
