import 'dart:convert';

import 'package:agape_job_app/pages/OtrasHabilidadesForm.dart';
import 'package:agape_job_app/services/provider.dart';
import 'package:agape_job_app/util/colors.dart';
import 'package:agape_job_app/util/globals.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class OtrasHabilidades extends StatefulWidget {
  @override
  _OtrasHabilidadesState createState() => _OtrasHabilidadesState();
}

class _OtrasHabilidadesState extends State<OtrasHabilidades> {
  var profile;
  List nivelIngles=[];
  List licencias=[];
  List habilidadesInformaticas=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(mounted){
      obtenerPerfil();
      obtenerNivelesIngles();
      obtenerLicencias();
      obtenerHabilidades();
    }
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text("Otras Habilidades"),
        backgroundColor: dPrimaryColor,
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              width: size.width*0.9,
              child: Card(
                elevation: 10,
                child: Column(
                  children: [
                    for(var e in nivelIngles)
                      if(profile!=null)
                      if(e['id']==profile['nivel_ingles'])
                        Container(height: size.height*0.09,child: Center(child: Text("Nivel de inglés: "+e['descripcion']),),),
                    Text("Licencias:",style: TextStyle(fontWeight: FontWeight.bold),),
                    for(var l in licencias)
                      Container(height: size.height*0.09,child: Center(child: Text(l['descripcion']),),),
                    Text("Habilidades Informáticas:",style: TextStyle(fontWeight: FontWeight.bold),),
                    for(var h in habilidadesInformaticas)
                      Container(height: size.height*0.09,child: Center(child: Text(h['descripcion']),),),

                    ElevatedButton.icon(style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green)),onPressed: (){
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) =>OtrasHabilidadesForm()),
                      );
                    }, icon: Icon(Icons.edit),label: Text("editar"),)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }


  void obtenerPerfil() {
    var prov = Provider.of<Proveedor>(this.context, listen: false);

    var url = Uri.http(dominio.toString(),
        '/jeo/servicios/consultar_perfil.php', {"id": prov.idEstudiante});

    var response = http.get(url);
    response.then((value) {
      if (mounted) {
        setState(() {
          if (!value.body.toString().contains("<!DOCTYPE"))
            profile = jsonDecode(value.body)[0];
        });
      }
    });
  }

  void obtenerNivelesIngles() {
    var prov = Provider.of<Proveedor>(this.context,listen: false);
    var URI = Uri.http(dominio.toString(), "/jeo/servicios/ctg_nivel_ingles.php",
        {"accion": "C"});
    var response = http.get(URI);
    response.then((value) {
      setState(() {
        var respuesta = jsonDecode(value.body)['info'];
        for (var s in respuesta) {
          this.nivelIngles.add(s);
        }
      });
    });
  }

  void obtenerLicencias() {
    var prov = Provider.of<Proveedor>(this.context,listen: false);
    var URI = Uri.http(dominio.toString(), "/jeo/servicios/ctg_tipo_licencia.php",
        {"accion": "CBE","id":prov.idEstudiante});
    var response = http.get(URI);
    response.then((value) {
      if(jsonDecode(value.body)['info']!="No existe informaci\u00f3n con ese criterio.") {
        setState(() {
          var respuesta = jsonDecode(value.body)['info'];
          for (var s in respuesta) {
            this.licencias.add(s);
          }
        });
      }});
  }

  void obtenerHabilidades() {
    var prov = Provider.of<Proveedor>(this.context,listen: false);
    var URI = Uri.http(dominio.toString(), "/jeo/servicios/ctg_habilidad_informatica.php",
        {"accion": "CBE","id":prov.idEstudiante});
    var response = http.get(URI);
    response.then((value) {
      setState(() {
        var respuesta = jsonDecode(value.body)['info'];
        for (var s in respuesta) {
          this.habilidadesInformaticas.add(s);
        }
      });
    });
  }
}
