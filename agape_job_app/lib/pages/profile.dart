import 'dart:convert';
import 'dart:developer';

import 'package:agape_job_app/pages/experiencialaboral.dart';
import 'package:agape_job_app/services/provider.dart';
import 'package:agape_job_app/util/colors.dart';
import 'package:agape_job_app/util/globals.dart';
import 'package:agape_job_app/widget/common/dplazabar.dart';
import 'package:agape_job_app/widget/perfil/capacitacionesinternas.dart';
import 'package:agape_job_app/widget/perfil/cursoInterno.dart';
import 'package:agape_job_app/widget/perfil/cursoexterno.dart';
import 'package:agape_job_app/widget/perfil/experiencia.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'editprofile.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  dynamic profile = null, cursos;
  List tec = [];
  List listaExperiencia = [];
  List listaCursosEx = [];
  List listaCursosIn = [];

  @override
  void initState() {
    super.initState();
    if (mounted) {
      obtenerPerfil();
      obtenerCapIn();
      obtenerCapEx();
      obtenerExperiencia();
    }
  }
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;


    if (profile != null)
      return Scaffold(
        key: _scaffoldKey,
        backgroundColor: dPrimaryColor,
        appBar: DPlazaBar("Mi Perfil"),
        body: Container(
          margin: EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(80), topRight: Radius.circular(80))),
          height: double.infinity,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top: size.height * 0.02),
                    child: Column(
                      children: [
                        // Container(
                        //   width: size.width*0.4,
                        //   child: Image.network("https://www.trecebits.com/wp-content/uploads/2019/02/Persona-1-445x445.jpg"),
                        // ),
                        Container(
                          margin: EdgeInsets.only(top: size.height * 0.02),
                          child: Text(
                            profile[0]["p_nombre"] +
                                " " +
                                profile[0]["p_apellido"],
                            style: TextStyle(
                              fontSize: 30,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: size.height * 0.01),
                          child: Text(
                            profile[0]["email"],
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w200),
                          ),
                        ),
                        Divider(
                          color: Colors.grey,
                          indent: 20,
                          endIndent: 20,
                          thickness: 1.5,
                        ),

                        Container(
                          width: size.width * 0.9,
                          height: size.height * 0.6,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              Container(
                                margin: EdgeInsets.only(
                                    top: size.height * 0.02,
                                    left: size.width * 0.01,
                                    right: size.width * 0.01),
                                padding: EdgeInsets.only(left: 5, right: 5),
                                child: SingleChildScrollView(
                                  child: Card(
                                    elevation: 5,
                                    child: Column(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              bottom: size.height * 0.015),
                                          child: Center(
                                            child: Text(
                                              "Datos de identificación",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          width: size.width * 0.8,
                                          margin: EdgeInsets.only(
                                              bottom: 10, left: 8, right: 8),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(Icons.account_circle),
                                                  Text("Carnet: ",
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold))
                                                ],
                                              ),
                                              Text((profile[0]["carnet"] == 0
                                                  ? "no existe informacion"
                                                  : profile[0]["carnet"]
                                                      .toString()))
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: size.width * 0.8,
                                          margin: EdgeInsets.only(
                                              bottom: 10, left: 8, right: 8),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(Icons.account_circle),
                                                  Text("Sexo: ",
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold))
                                                ],
                                              ),
                                              Text(profile[0]["sexo"] == "M"
                                                  ? "Mujer"
                                                  : "Hombre")
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: size.width * 0.8,
                                          margin: EdgeInsets.only(
                                              bottom: 10, left: 8),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(Icons.calendar_today),
                                                  Text("Fecha de nacimiento: ",
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold))
                                                ],
                                              ),
                                              Text(profile[0][
                                                          "fecha_nacimiento"] ==
                                                      null
                                                  ? ""
                                                  : profile[0]
                                                      ["fecha_nacimiento"])
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: size.width * 0.8,
                                          margin: EdgeInsets.only(bottom: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(Icons.account_circle),
                                                  Text("Estado Civíl:",
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold))
                                                ],
                                              ),
                                              Text(profile[0]["id_est_civil"] ==
                                                      null
                                                  ? ""
                                                  : profile[0]["id_est_civil"]
                                                      ["descripcion"])
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: size.width * 0.8,
                                          margin: EdgeInsets.only(bottom: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(Icons.account_circle),
                                                  Text("DUI:",
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold))
                                                ],
                                              ),
                                              Text(profile[0]["dui"])
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: size.width * 0.8,
                                          margin: EdgeInsets.only(bottom: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(Icons.account_circle),
                                                  Text("NIT:",
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold))
                                                ],
                                              ),
                                              Text(profile[0]["nit"])
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: size.width * 0.8,
                                          margin: EdgeInsets.only(bottom: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(Icons.account_circle),
                                                  Text("Género:",
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold))
                                                ],
                                              ),
                                              Text(profile[0]["id_genero"] ==
                                                      null
                                                  ? ""
                                                  : profile[0]["id_genero"]
                                                      ["descripcion"])
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: size.width * 0.8,
                                          margin: EdgeInsets.only(bottom: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(Icons.account_circle),
                                                  Text("Departamento:",
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold))
                                                ],
                                              ),
                                              Text(profile[0]["id_depto"]
                                                  ["descripcion"])
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: size.width * 0.8,
                                          margin: EdgeInsets.only(bottom: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(Icons.account_circle),
                                                  Text("Municipio:",
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold))
                                                ],
                                              ),
                                              Text(profile[0]["id_muni"] == null
                                                  ? ""
                                                  : profile[0]["id_muni"]
                                                      ["descripcion"])
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: size.width * 0.8,
                                          margin: EdgeInsets.only(bottom: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(Icons.phone_android),
                                                  Text("Número Celular",
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold))
                                                ],
                                              ),
                                              Text(profile[0]["num_celular"] ==
                                                      null
                                                  ? ""
                                                  : profile[0]["num_celular"])
                                            ],
                                          ),
                                        ),
                                        Container(
                                          width: size.width * 0.8,
                                          margin: EdgeInsets.only(bottom: 10),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  Icon(Icons.phone),
                                                  Text("Número Fijo",
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.bold))
                                                ],
                                              ),
                                              Text(
                                                  profile[0]["num_fijo"] == null
                                                      ? ""
                                                      : profile[0]["num_fijo"])
                                            ],
                                          ),
                                        ),
                                        Text("Dirección: ",
                                            style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold)),
                                        Container(
                                          width: size.width * 0.75,
                                          child: Text(
                                            profile[0]["direccion"] == null
                                                ? ""
                                                : profile[0]["direccion"],
                                            textAlign: TextAlign.justify,
                                            maxLines: 10,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(
                                              top: size.height * 0.01,
                                              bottom: size.height * 0.01),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              ElevatedButton.icon(
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            FormularioIngreso(
                                                                profile[0],obtenerPerfil)),
                                                  );
                                                },
                                                label: Text("Editar"),
                                                icon: Icon(Icons.edit),
                                              ),

                                              //ElevatedButton.icon(onPressed: ()=>{}, label: Text("Descargar cv"), icon:Icon(Icons.download_outlined),)
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              //Inicio de experiencia laboral
                              Container(
                                margin: EdgeInsets.only(
                                    top: size.height * 0.02,
                                    left: size.width * 0.01,
                                    right: size.width * 0.01),
                                child: SingleChildScrollView(
                                  child: Card(
                                    elevation: 5,
                                    child: Column(
                                      children: [
                                        Container(
                                          width: size.width * 0.9,
                                          margin: EdgeInsets.only(
                                              bottom: size.height * 0.015),
                                          child: Center(
                                            child: Text(
                                              "Experiencia Laboral",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                        for (var ex in listaExperiencia)
                                          Experiencia(ex,obtenerExperiencia),
                                        Container(
                                          margin: EdgeInsets.only(left: 5),
                                          child: ElevatedButton.icon(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          ExperienciaLaboral(null,obtenerExperiencia)),
                                                );
                                              },
                                              icon: Icon(Icons.add),
                                              label:
                                                  Text("Experiencia Laboral")),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 5),
                                          child: ElevatedButton.icon(
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.green
                                            ),
                                              onPressed: () {
                                                obtenerExperiencia();
                                              },
                                              icon: Icon(Icons.cloud_download_sharp),

                                              label:
                                              Text("Actualizar datos")),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              //Fin de experiencia laboral
                              //INICIO DE CAPACITACIONES
                              Container(
                                width: size.width*0.9,
                                margin: EdgeInsets.only(
                                    top: size.height * 0.02,
                                    left: size.width * 0.01,
                                    right: size.width * 0.01),
                                child: SingleChildScrollView(
                                  child: Card(
                                    elevation: 5,
                                    child: Column(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(
                                              bottom: size.height * 0.015),
                                          child: Center(
                                            child: Text(
                                              "Capacitaciones Externas",
                                              style: TextStyle(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                        for (var ce in listaCursosEx)
                                          CursoExterno(ce,obtenerCapEx),
                                        Container(
                                          margin: EdgeInsets.only(left: 5),
                                          child: ElevatedButton.icon(
                                              onPressed: () {
                                                Navigator.of(context).pushNamed(
                                                    "/capacitacionesForm");
                                              },
                                              icon: Icon(Icons.add),
                                              label: Text(
                                                  "Capacitaciónes Externas")),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 5),
                                          child: ElevatedButton.icon(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.green
                                              ),
                                              onPressed: () {
                                                obtenerCapEx();
                                              },
                                              icon: Icon(Icons.cloud_download_sharp),

                                              label:
                                              Text("Actualizar datos")),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              //FIN DE CAPACITACIONES
                              //INICIO DE CAPACITACIONES INTERNAS
                              Container(
                                margin: EdgeInsets.only(
                                    top: size.height * 0.02,
                                    left: size.width * 0.01,
                                    right: size.width * 0.01),
                                child: SingleChildScrollView(
                                  child: Card(
                                    elevation: 5,
                                    child: Column(
                                      children: [
                                        Center(
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                bottom: size.height * 0.015),
                                            child: Center(
                                              child: Text(
                                                "Capacitaciónes Internas",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Center(
                                          child: Column(
                                            children: [
                                              if(listaCursosIn.length>0)
                                                for (var ci in listaCursosIn)
                                                  CursoInterno(ci,obtenerCapIn)
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 5),
                                          child: ElevatedButton.icon(
                                              onPressed: () {
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          CapacitacionesInternasForm(null,obtenerCapIn)),
                                                );
                                              },
                                              icon: Icon(Icons.add),
                                              label: Text(
                                                  "Capacitaciones Internas")),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 5),
                                          child: ElevatedButton.icon(
                                              style: ElevatedButton.styleFrom(
                                                  primary: Colors.green
                                              ),
                                              onPressed: () {
                                                obtenerCapIn();
                                              },
                                              icon: Icon(Icons.cloud_download_sharp),

                                              label:
                                              Text("Actualizar datos")),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              //FIN CAPACITACIONES INTERNAS
                              Container(
                                  width: size.width * 0.9,
                                  margin: EdgeInsets.only(
                                      top: size.height * 0.02,
                                      left: size.width * 0.01,
                                      right: size.width * 0.01),
                                  child: SingleChildScrollView(
                                      child: Card(
                                          elevation: 5,
                                          child: Column(children: [
                                            Container(
                                              child: Text(
                                                "Información Complementaria",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                            Container(
                                              width: size.width*0.7,
                                              margin: EdgeInsets.only(left: 5),
                                              child: ElevatedButton.icon(
                                                  onPressed: () {
                                                    Navigator.of(context)
                                                        .pushNamed(
                                                            "/competenciaTecnica");
                                                  },
                                                  icon: Icon(Icons
                                                      .admin_panel_settings),
                                                  label: Text(
                                                      "Competencias Tecnicas")),
                                            ),
                                            Container(
                                              width: size.width*0.7,
                                              margin: EdgeInsets.only(left: 5),
                                              child: ElevatedButton.icon(
                                                  onPressed: () {
                                                    Navigator.of(context)
                                                        .pushNamed(
                                                            "/discapacidades");
                                                  },
                                                  icon: Icon(Icons.accessible),
                                                  label:
                                                      Text("Discapacidades")),
                                            ),
                                            Container(
                                              width: size.width*0.7,
                                              margin: EdgeInsets.only(left: 5),
                                              child: ElevatedButton.icon(
                                                  onPressed: () {
                                                    Navigator.of(context)
                                                        .pushNamed(
                                                            "/formacionAcademica");
                                                  },
                                                  icon: Icon(Icons.assignment),
                                                  label: Text(
                                                      "Formacion Academica")),
                                            ),
                                            Container(
                                              width: size.width*0.7,
                                              margin: EdgeInsets.only(left: 5),
                                              child: ElevatedButton.icon(
                                                  onPressed: () {
                                                    Navigator.of(context)
                                                        .pushNamed(
                                                        "/habilidadesBlandas");
                                                  },
                                                  icon: Icon(Icons.accessibility_new_sharp),
                                                  label: Text(
                                                      "Habilidades Blandas")),
                                            ),
                                            Container(
                                              width: size.width*0.7,
                                              margin: EdgeInsets.only(left: 5),
                                              child: ElevatedButton.icon(
                                                  onPressed: () {
                                                    Navigator.of(context)
                                                        .pushNamed(
                                                        "/otrasHabilidades");
                                                  },
                                                  icon: Icon(Icons.car_repair),
                                                  label: Text(
                                                      "Otras Habilidades")),
                                            ),
                                            Container(
                                              width: size.width*0.7,
                                              margin: EdgeInsets.only(left: 5),
                                              child: ElevatedButton.icon(
                                                  onPressed: () {
                                                    Navigator.of(context)
                                                        .pushNamed(
                                                        "/preferencias");
                                                  },
                                                  icon: Icon(Icons.work),
                                                  label: Text(
                                                      "Preferencias de trabajo")),
                                            ),
                                            Container(
                                              width: size.width*0.7,
                                              margin: EdgeInsets.only(left: 5),
                                              child: ElevatedButton.icon(
                                                  onPressed: () {
                                                    Navigator.of(context)
                                                        .pushNamed(
                                                        "/referenciasLaborales");
                                                  },
                                                  icon: Icon(Icons.account_balance),
                                                  label: Text(
                                                      "Referencias Laborales")),
                                            ),
                                            Container(
                                              width: size.width*0.7,
                                              margin: EdgeInsets.only(left: 5),
                                              child: ElevatedButton.icon(
                                                  onPressed: () {
                                                    Navigator.of(context)
                                                        .pushNamed(
                                                        "/referenciasPersonales");
                                                  },
                                                  icon: Icon(Icons.add_call),
                                                  label: Text(
                                                      "Referencias Personales")),
                                            )
                                          ]))))
                            ],
                          ),
                        ),
                        Divider(
                          color: Colors.grey,
                          indent: 20,
                          endIndent: 20,
                          thickness: 1.5,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    else
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
  }

  void obtenerCapIn() {
    cleanInter();
    var prov = Provider.of<Proveedor>(this.context, listen: false);

    var urlCapaIn = Uri.http(
        dominio.toString(),
        '/jeo/servicios/prc_curso_estudiante.php',
        {'accion': 'C', 'idEstudiante': prov.idEstudiante, 'estado': 'A'});

    var responseCapaIn = http.get(urlCapaIn);

    responseCapaIn.then((value) {
      print("peticion capa");
      setState(() {
        this.listaCursosIn.clear();
        var respuesta = jsonDecode(value.body)['info'];
        if(respuesta.toString()!="No existe información con ese criterio.")
          for (var o in respuesta) this.listaCursosIn.add(o);
      });
    });
  }

  void obtenerCapEx() {
    cleanEx();

    var prov = Provider.of<Proveedor>(this.context, listen: false);

    var urlCursosEx =
        Uri.http(dominio.toString(), '/jeo/servicios/prc_curso_externo.php', {
      'idEstudiante': prov.idEstudiante,
      'accion': 'C',
      'user': prov.usr,
      'estado': "A"
    });
    var repCursoEx = http.get(urlCursosEx);
    repCursoEx.then((value) {
      setState(() {
        try{
          var resp = jsonDecode(value.body)['info'];
          for (var o in resp) {
            this.listaCursosEx.add(o);
          }
        }catch(e){

        }
      });
    });
  }

  void obtenerPerfil() {
    var prov = Provider.of<Proveedor>(this.context, listen: false);

    var url = Uri.http(dominio.toString(),
        '/jeo/servicios/consultar_perfil.php', {"id": prov.idEstudiante,"accion":"C"});

    var response = http.get(url);
    response.then((value) {
      print("peticion perfil");
      if (mounted) {
        setState(() {
          if (!value.body.toString().contains("<!DOCTYPE"))
            profile = jsonDecode(value.body);
        });
      }
    });
  }



  void obtenerExperiencia(){
    limpiarExperiencia();
    print("peticion experiencia");
    var prov = Provider.of<Proveedor>(this.context, listen: false);

    var urlExperienciaLaboral = Uri.http(
        dominio.toString(),
        '/jeo/servicios/prc_situacion_laboral.php',
        {'accion': 'C', 'idEstudiante': prov.idEstudiante, 'user': prov.usr});

    var responseExperienciaLaboral = http.get(urlExperienciaLaboral);

    responseExperienciaLaboral.then((value) {
        setState(() {

          var map =jsonDecode(value.body)['info'];
          for(var e in map){
            listaExperiencia.add(e);
          }
        });
    });
  }

  _actualizarInternas(){
  }

  void limpiarExperiencia() {
    setState(() {
      listaExperiencia = [];
    });
  }

  void cleanEx() {
    setState(() {
      listaCursosEx = [];
    });

  }

  void cleanInter() {
    setState(() {
      listaCursosIn = [];
    });
  }
}
