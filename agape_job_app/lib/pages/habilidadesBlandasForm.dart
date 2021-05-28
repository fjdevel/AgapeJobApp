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

class HabilidadesBlandasForm extends StatefulWidget {
  @override
  _HabilidadesBlandasFormState createState() => _HabilidadesBlandasFormState();
}

class _HabilidadesBlandasFormState extends State<HabilidadesBlandasForm> {
  List habilidades=[];
  List habilidadesByE=[];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(mounted){
      obtenerHabilidades();
      //obtenerHabilidadesByE();
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: dPrimaryColor,
        title: Text("Habilidades Blandas"),
      ),
      body: Container(
        child: Column(
          children: [
            MultiSelectDialogField(

              items: habilidades.map((e) => MultiSelectItem(e, e['descripcion'])).toList(),
              initialValue: habilidadesByE,
              listType: MultiSelectListType.CHIP,
              onSelectionChanged: (habilidadesByE){
                print(habilidadesByE.length.toString());
                if(!(habilidadesByE.length<8))
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Solo se pueden seleccionar 7 como máximo")));
              },
              onConfirm: (values) {
                  habilidadesByE = values;
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
                    'Actualizar Habilidades Blandas',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w300
                    ),
                  ),
                  onPressed: (){
                    print(habilidadesByE.length.toString());
                    if(habilidadesByE.length<8){
                      var prov = Provider.of<Proveedor>(this.context,listen: false);
                      var url = Uri.http(dominio.toString(),'/jeo/servicios/ctg_habilidad_blanda.php',{
                        "accion":"I",
                      });
                      var data = jsonEncode({
                        "estudiante":{
                          "habBlandas":habilidadesByE,
                          "id":{
                            "id":prov.idEstudiante
                          },
                          "usuario":prov.usr
                        }
                      });

                      var response = http.post(url,body: data);

                      response.then((value) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(jsonDecode(value.body)["info"])));

                      });
                    }else{
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Solo se pueden seleccionar 7 como máximo")));
                    }
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void obtenerHabilidades() {
    var URI = Uri.http(dominio.toString(), "/jeo/servicios/ctg_habilidad_blanda.php",
        {"accion": "C"});
    var response = http.get(URI);
    response.then((value) {
      setState(() {
        var respuesta = jsonDecode(value.body)['info'];
        for (var s in respuesta) {
          this.habilidades.add(s);
        }
      });
    });
  }

  void obtenerHabilidadesByE() {
    var prov = Provider.of<Proveedor>(this.context,listen: false);
    var URI = Uri.http(dominio.toString(), "/jeo/servicios/ctg_habilidad_blanda.php",
        {"accion": "CBE","id":prov.idEstudiante});
    var response = http.get(URI);
    try{
      response.then((value) {
        setState(() {
          var respuesta = jsonDecode(value.body)['info'];
          for (var s in respuesta) {
            this.habilidadesByE.add(s);
          }
        });
      });
    }catch(e){
      habilidadesByE = [];
    }
  }
}
