import 'dart:convert';
import 'dart:developer';

import 'package:agape_job_app/services/provider.dart';
import 'package:agape_job_app/util/colors.dart';
import 'package:agape_job_app/util/globals.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:provider/provider.dart';

class PreferenciasForm extends StatefulWidget {
  @override
  _PreferenciasFormState createState() => _PreferenciasFormState();
}

class _PreferenciasFormState extends State<PreferenciasForm> {
  var profile;
  List _ocupaciones=[];
  List _ocupacionesByE=[];
  List _departamentosByE=[];
  List _departamentos=[];

  var salarial = TextEditingController();
  var OtraOcupacion = TextEditingController();

  var puesto = TextEditingController();
  bool viaje=true;
  bool otroOcupa=false;
  String sitHint = "Seleccione su situacion actual";
  String sitValue;
  List situacion = ["Estoy Buscando Empleo", "Deseo Cambiar Empleo"];

  _PreferenciasFormState();

  @override
  void initState() {
    super.initState();
    if (mounted) {
      obtenerPerfil();
      obtenerOcupacionesT();
      obtenerOcupaciones();
      obtenerDepartamentos();
      obtenerDepartamentoT();

    }

  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var selectOcupacion = MultiSelectDialogField(
      onConfirm: (val) {
        _ocupacionesByE = val;
      },
      items: _ocupaciones
          .map((e) => MultiSelectItem(e, e['descripcion']))
          .toList(),
      initialValue: _ocupacionesByE,
      confirmText: Text("Guardar"),
      buttonText: Text("Ocupaciones"),
    );

    var selectDepartamento = MultiSelectDialogField(
      onConfirm: (val) {
        _departamentosByE = val;
      },
      items: _departamentos
          .map((e) => MultiSelectItem(e, e['descripcion']))
          .toList(),
      initialValue: _departamentosByE,
      confirmText: Text("Guardar"),
      buttonText: Text("Departamentos"),
    );



    var sitDrop = DropdownButton<String>(
      hint: Text(sitHint),
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
          sitValue = newValue;
          sitHint = newValue;
        });
      },
      items: situacion.map<DropdownMenuItem<String>>((dynamic value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );

    var salarialText = Container(
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
          controller: salarial,
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 10),
              hintText: 'Expectativa Salarial',
              suffixIcon: Icon(Icons.account_balance),
              suffixIconConstraints: BoxConstraints(minWidth: 40)
          ),
        )
    );
    var puestoText = Container(
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
          controller: puesto,
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 10),
              hintText: 'Puesto de trabajo deseado',
              suffixIcon: Icon(Icons.account_balance),
              suffixIconConstraints: BoxConstraints(minWidth: 40)
          ),
        )
    );
    var ocupacionText = Container(
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
          controller: OtraOcupacion,
          decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 10),
              hintText: 'Digite la otra ocupacion',
              suffixIcon: Icon(Icons.account_balance),
              suffixIconConstraints: BoxConstraints(minWidth: 40)
          ),
        )
    );
    var viajeCheck =Container(
        margin: EdgeInsets.only(top: 20, left: 15.0),
        height: 20,
        child: Row(
          children: <Widget>[
            Theme(
                data: ThemeData(unselectedWidgetColor: Colors.black87),
                child: Checkbox(
                  value: viaje,
                  checkColor: Colors.white,
                  activeColor: Colors.brown,
                  onChanged: (value) {
                    setState(() {
                      viaje = value;
                    });
                  },
                )),
            Text('¿Dispuesto a viajar?',
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w400,
              ),)
          ],
        )

    );
    var ocupacionCheck =Container(
        margin: EdgeInsets.only(top: 20, left: 15.0),
        height: 20,
        child: Row(
          children: <Widget>[
            Theme(
                data: ThemeData(unselectedWidgetColor: Colors.black87),
                child: Checkbox(
                  value:otroOcupa,
                  checkColor: Colors.white,
                  activeColor: Colors.brown,
                  onChanged: (value) {
                    setState(() {
                      otroOcupa = value;
                    });
                  },
                )),
            Text('¿Agregar otra ocupación?',
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w400,
              ),)
          ],
        )

    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Preferencias de trabajo"),
        backgroundColor: dPrimaryColor,
        centerTitle: true,
      ),
      body: Column(
        children: [
          selectOcupacion,
          ocupacionCheck,
          if(otroOcupa==true)ocupacionText,
          viajeCheck,
          if(viaje==true)selectDepartamento,
          sitDrop,
          salarialText,
          puestoText,
          Container(
              margin: EdgeInsets.only(top: 10),
              child:ElevatedButton.icon(onPressed: (){
                var prov = Provider.of<Proveedor>(this.context,listen: false);
                var url = Uri.http(dominio.toString(),'/jeo/servicios/ctg_estudiante.php',{
                  "accion":"UPT"
                });
                var data = jsonEncode({
                  "estudiante":{
                    "id":{
                      "id":prov.idEstudiante,
                    },
                    "situacion_actual":sitValue,
                    "puesto_trabajo_deseado":puesto.text,
                    "expectativa_salarial":salarial.text,
                    "disp_cambiar_residencia":"Sí",
                    "disponibilidad_viajar":viaje?"1":"0",
                    "usuario":prov.usr
                  },
                  "deptsViajar":_departamentosByE
                });
                var response = http.post(url,body: data);
                response.then((value){
                  if(value.statusCode==200)
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value.body.toString()),));
                });

                var urlOcupacion = Uri.http(dominio.toString(),'/jeo/servicios/ctg_ocupacion.php',{
                  "accion":"I"
                });
                var dataOcupacion = jsonEncode({
                  "estudiante":{
                    "id":{
                      "id":prov.idEstudiante,
                    },
                    "otraOcu":OtraOcupacion.text,
                    "usuario":prov.usr
                  },
                  "ocupaciones":_ocupacionesByE
                });
                var response2 = http.post(urlOcupacion,body: dataOcupacion);
                response2.then((value){
                  if(value.statusCode==200)
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(jsonDecode(value.body)['info']),));
                });


              }, icon: Icon(Icons.save), label: Text("Actualizar Preferencias de trabajo"))
          )],
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
          salarial.text = profile['expectativa_salarial'];
          puesto.text = profile['puesto_trabajo_deseado'];
            if(profile['disponibilidad_viajar']==1)
              viaje=true;
            else
              viaje = false;
          sitHint = profile==null?"":profile['situacion_actual'];
          sitValue = profile==null?"":profile['situacion_actual'];
        });
      }
    });
  }

  void obtenerOcupacionesT() {
    var URI = Uri.http(dominio.toString(), "/jeo/servicios/ctg_ocupacion.php",
        {"accion": "C"});
    var response = http.get(URI);
    response.then((value) {
      setState(() {
        var respuesta = jsonDecode(value.body)['info'];
        for (var s in respuesta) {
          this._ocupaciones.add(s);
        }
      });
    });
  }

  void obtenerOcupaciones() {
    var prov = Provider.of<Proveedor>(this.context, listen: false);
    var URI = Uri.http(dominio.toString(), "/jeo/servicios/ctg_ocupacion.php",
        {"accion": "CBE", "id": prov.idEstudiante});
    var response = http.get(URI);
    response.then((value) {
      if(mounted){
        setState(() {
          var respuesta = jsonDecode(value.body)['info'];
          for (var s in respuesta) {
            this._ocupacionesByE.add(s);
          }
        });
      }
    });
  }

  void obtenerDepartamentos() {
    var prov = Provider.of<Proveedor>(this.context, listen: false);
    var URI = Uri.http(dominio.toString(), "/jeo/servicios/ctg_depto.php",
        {"accion": "CBE", "id": prov.idEstudiante});
    var response = http.get(URI);
    response.then((value) {
      setState(() {
        var respuesta = jsonDecode(value.body)['info'];

        for (var s in respuesta) {
          this._departamentosByE.add(s);
        }
      });
    });
  }

  void obtenerDepartamentoT() {
    var URI = Uri.http(
        dominio.toString(), "/jeo/servicios/ctg_depto.php", {"accion": "C"});
    var response = http.get(URI);
    response.then((value) {
      setState(() {
        var respuesta = jsonDecode(value.body)['info'];
        for (var s in respuesta) {
          this._departamentos.add(s);
        }
      });
    });
  }
}
