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

class OtrasHabilidadesForm extends StatefulWidget {
  @override
  _OtrasHabilidadesFormState createState() => _OtrasHabilidadesFormState();
}

class _OtrasHabilidadesFormState extends State<OtrasHabilidadesForm> {
  List licencias = [];
  List licenciasByE = [];
  List nivelIngles = [];
  List habilidadesInformaticas = [];
  List habilidadesInformaticasByE = [];
  var profile;


  var HabilidadesSelect;
  String inglesHint = "seleccione el nivel de ingles";
  String inglesvalue;
  bool isManejo = false;
  bool isIngles = false;

  @override
  void initState() {
    if (mounted) {
      obtenerHabilidades();
      obtenerLicencias();
      obtenerNivelesIngles();
      obtenerLicenciasByE();

      obtenerHabilidadesByE();
      obtenerPerfil();
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var inglesDrop = Container(
      child: Column(
        children: [
          Text("Escoja el nivel de ingles"),
          DropdownButton<String>(
            hint: Text(inglesHint),
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
                inglesvalue = newValue;
                for (var e in nivelIngles)
                  if (e['id'] == newValue) inglesHint = e['descripcion'];
              });
            },
            items: nivelIngles.map<DropdownMenuItem<String>>((dynamic value) {
              return DropdownMenuItem<String>(
                value: value['id'],
                child: Text(value['descripcion']),
              );
            }).toList(),
          )
        ],
      ),
    );
    var checkManejo = Container(
        margin: EdgeInsets.only(top: 20, left: 15.0),
        height: 20,
        child: Row(
          children: <Widget>[
            Theme(
                data: ThemeData(unselectedWidgetColor: Colors.black87),
                child: Checkbox(
                  value: isManejo,
                  checkColor: Colors.white,
                  activeColor: Colors.brown,
                  onChanged: (value) {
                    setState(() {
                      isManejo = value;
                    });
                  },
                )),
            Text(
              '¿Maneja Vehiculos?',
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ));
    var checkIngles = Container(
        margin: EdgeInsets.only(top: 20, left: 15.0),
        height: 20,
        child: Row(
          children: <Widget>[
            Theme(
                data: ThemeData(unselectedWidgetColor: Colors.black87),
                child: Checkbox(
                  value: isIngles,
                  checkColor: Colors.white,
                  activeColor: Colors.brown,
                  onChanged: (value) {
                    setState(() {
                      isIngles = value;
                    });
                  },
                )),
            Text(
              '¿Tiene conocimiento del idioma Ingles?',
              style: TextStyle(
                color: Colors.black87,
                fontWeight: FontWeight.w400,
              ),
            )
          ],
        ));
    var licenciasSelect = new MultiSelectDialogField(
      onConfirm: (val) {
        licenciasByE = val;
      },
      items: licencias
          .map((e) => MultiSelectItem(e, e['descripcion']))
          .toList(),
      confirmText: Text("Guardar"),
      buttonText: Text("Escoja las Licencias que posee"),
    );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: dPrimaryColor,
        title: Text("Otras habilidades"),
      ),
      body: Column(
        children: [
          Center(
            child: Container(
              width: size.width * 0.9,
              child: Column(
                children: [checkManejo, if (isManejo) licenciasSelect],
              ),
            ),
          ),
          Center(
            child: Container(
              margin: EdgeInsets.only(top: 10),
              width: size.width * 0.9,
              child: Column(
                children: [checkIngles, if (isIngles) inglesDrop],
              ),
            ),
          ),
          Center(
            child: Container(
              width: size.width * 0.9,
              child: HabilidadesSelect,
            ),
          ),
          Container(
              margin: EdgeInsets.only(top: 10),
              child: ElevatedButton.icon(
                  onPressed: () {
                    var prov =
                        Provider.of<Proveedor>(this.context, listen: false);
                    var url = Uri.http(dominio.toString(),
                        '/jeo/servicios/ctg_estudiante.php', {"accion": "UOH"});
                    var data = jsonEncode({
                      "estudiante": {
                        "id": {
                          "id": prov.idEstudiante,
                        },
                        "habInformaticas": habilidadesInformaticasByE,
                        "tiposLicencia": licenciasByE,
                        "nivel_ingles": inglesvalue,
                        "usuario": prov.usr
                      }
                    });
                    var response = http.post(url, body: data);
                    response.then((value) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text("Se actualizo correctamente")));
                    });
                  },
                  icon: Icon(Icons.save),
                  label: Text("Actualizar Otras Habilidades")))
        ],
      ),
    );
  }

  void obtenerLicencias() {
    var URI = Uri.http(dominio.toString(),
        "/jeo/servicios/ctg_tipo_licencia.php", {"accion": "C"});
    var response = http.get(URI);
    response.then((value) {
      print("Peticion licencias");
      setState(() {
        var respuesta = jsonDecode(value.body)['info'];
        for (var s in respuesta) {
          this.licencias.add(s);
        }
      });
    });
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
          inglesvalue = profile['nivel_ingles'];
          if (inglesvalue != null) isIngles = true;
          for (var e in nivelIngles)
            if (e['id'] == profile['nivel_ingles'])
              inglesHint = e['descripcion'];
        });
      }
    });
  }

  void obtenerLicenciasByE() {
    var prov = Provider.of<Proveedor>(this.context, listen: false);
    var URI = Uri.http(
        dominio.toString(),
        "/jeo/servicios/ctg_tipo_licencia.php",
        {"accion": "CBE", "id": prov.idEstudiante});
    var response = http.get(URI);
    response.then((value) {
      setState(() {
        var respuesta = jsonDecode(value.body)['info'];
        try {
          if (respuesta != "No existe información con ese criterio") {
            for (var s in respuesta) {
              this.licenciasByE.add(s);
            }
            this.isManejo = true;
          } else {
            this.licenciasByE = [];
          }
        } catch (e) {
          this.licenciasByE = [];
        }


      });
    });
  }

  void obtenerNivelesIngles() {
    var URI = Uri.http(dominio.toString(),
        "/jeo/servicios/ctg_nivel_ingles.php", {"accion": "C"});
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

  void obtenerHabilidades() {
    var URI = Uri.http(dominio.toString(),
        "/jeo/servicios/ctg_habilidad_informatica.php", {"accion": "C"});
    var response = http.get(URI);
    response.then((value) {
      setState(() {
        print("peticion habilidades");
        var respuesta = jsonDecode(value.body)['info'];
        print(respuesta.toString());
        for (var s in respuesta) {
          this.habilidadesInformaticas.add(s);
        }
      });
    });
  }

  void obtenerHabilidadesByE() {
    var prov = Provider.of<Proveedor>(this.context, listen: false);
    var URI = Uri.http(
        dominio.toString(),
        "/jeo/servicios/ctg_habilidad_informatica.php",
        {"accion": "CBE", "id": prov.idEstudiante});
    var response = http.get(URI);
    response.then((value) {
      setState(() {
        var respuesta = jsonDecode(value.body)['info'];
        for (var s in respuesta) {
          this.habilidadesInformaticasByE.add(s);
        }

        HabilidadesSelect = new MultiSelectDialogField(
          onConfirm: (val) {
            habilidadesInformaticasByE = val;
          },
          items: habilidadesInformaticas
              .map((e) => MultiSelectItem(e, e['descripcion']))
              .toList(),
          confirmText: Text("Guardar"),
          buttonText: Text("Escoja las Habilidades Informaticas"),
        );
      });
    });
  }
}
