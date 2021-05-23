import 'dart:convert';

import 'package:agape_job_app/services/provider.dart';
import 'package:agape_job_app/util/colors.dart';
import 'package:agape_job_app/util/globals.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class DiscapacidadForm extends StatefulWidget {
  @override
  _DiscapacidadFormState createState() => _DiscapacidadFormState();
}

class _DiscapacidadFormState extends State<DiscapacidadForm> {
  List discapacidades=[];
  List discapacidadesByE=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    obtenerDiscacidades();
    obtenerDiscapacidadesByE();
  }


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: dPrimaryColor,
        title: Text("Discapacidades"),
      ),
      body: Container(
        child: Column(
          children: [
            MultiSelectDialogField(

              items: discapacidades.map((e) => MultiSelectItem(e, e['descripcion'])).toList(),
              initialValue: discapacidadesByE,
              listType: MultiSelectListType.CHIP,
              onConfirm: (values) {
                discapacidadesByE = values;
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
                    'Actualizar Discapacidades',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w300
                    ),
                  ),
                  onPressed: (){
                    var prov = Provider.of<Proveedor>(this.context,listen: false);
                    var url = Uri.http(dominio.toString(),'/jeo/servicios/ctg_discapacidad.php',{
                      "accion":"I",
                    });
                    var data = jsonEncode({
                      "estudiante":{
                        "discapacidades":discapacidadesByE,
                        "id":{
                          "id":prov.idEstudiante
                        },
                        "otraDisc":"",
                        "usuario":prov.usr
                      }
                    });

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

  void obtenerDiscacidades() {
    var URI = Uri.http(dominio.toString(), "/jeo/servicios/ctg_discapacidad.php",
        {"accion": "C"});
    var response = http.get(URI);
    response.then((value) {
      setState(() {
        var respuesta = jsonDecode(value.body)['info'];
        for (var s in respuesta) {
          this.discapacidades.add(s);
        }
      });
    });
  }

  void obtenerDiscapacidadesByE() {
    var prov = Provider.of<Proveedor>(this.context,listen: false);
    var URI = Uri.http(dominio.toString(), "/jeo/servicios/ctg_discapacidad.php",
        {"accion": "CBE","id":prov.idEstudiante});
    var response = http.get(URI);
    response.then((value) {
      setState(() {
        var respuesta = jsonDecode(value.body)['info'];
        for (var s in respuesta) {
          this.discapacidadesByE.add(s);
        }
      });
    });
  }
}
