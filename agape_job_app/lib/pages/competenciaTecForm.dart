import 'dart:convert';
import 'dart:developer';

import 'package:agape_job_app/services/provider.dart';
import 'package:agape_job_app/util/colors.dart';
import 'package:agape_job_app/util/globals.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:multi_select_flutter/chip_field/multi_select_chip_field.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:provider/provider.dart';



class CompetenciaTecnicaForm extends StatefulWidget {


  @override
  _CompetenciaTecnicaFormState createState() => _CompetenciaTecnicaFormState();

  CompetenciaTecnicaForm();
}

class _CompetenciaTecnicaFormState extends State<CompetenciaTecnicaForm> {

  List capas=[];
  List capasbyE=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    obtenerCapas();
    obtenerCapasEstudiantes();

  }




  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: dPrimaryColor,
        title: Text("Competencias tecnicas"),
      ),
      body: Container(
        child: Column(
          children: [
            MultiSelectDialogField(

              items: capas.map((e) => MultiSelectItem(e, e['descripcion'])).toList(),
              initialValue: capasbyE,
              listType: MultiSelectListType.CHIP,
              onConfirm: (values) {
                capasbyE = values;
              },
            ),
            Center(
              child: Container(
                width: size.width * 0.85,
                margin: EdgeInsets.fromLTRB(15, 15, 15, 25),
                child: RaisedButton(
                  padding: EdgeInsets.all(20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  color: Colors.brown,
                  child: Text(
                    'Actualizar Competencias',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w300
                    ),
                  ),
                  onPressed: (){
                    var prov = Provider.of<Proveedor>(this.context,listen: false);
                    var url = Uri.http(dominio.toString(),'/jeo/servicios/ctg_competencia_tecnica.php',{
                      "accion":"I",
                    });
                    var data = jsonEncode({
                      "estudiante":{
                        "compTecnicas":capasbyE,
                        "id":{
                          "id":prov.idEstudiante
                        },
                        "otraComp":""
                      }
                    });
                    log(data.toString());

                    var response = http.post(url,body: data);

                    response.then((value) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(jsonDecode(value.body)["info"])));

                    });
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void obtenerCapas() {
    var URI = Uri.http(dominio.toString(), "/jeo/servicios/ctg_competencia_tecnica.php",
        {"accion": "C"});
    var response = http.get(URI);
    response.then((value) {
      setState(() {
        var respuesta = jsonDecode(value.body)['info'];
        for (var s in respuesta) {
          this.capas.add(s);
        }
      });
    });
  }
  void obtenerCapasEstudiantes(){
    var prov = Provider.of<Proveedor>(this.context,listen: false);
    var URI = Uri.http(dominio.toString(), "/jeo/servicios/ctg_competencia_tecnica.php",
        {"accion": "CBE","id":prov.idEstudiante});
    var response = http.get(URI);
    response.then((value) {
      setState(() {
        var respuesta = jsonDecode(value.body)['info'];
        for (var s in respuesta) {
          this.capasbyE.add(s);
        }
      });
    });
  }
}
