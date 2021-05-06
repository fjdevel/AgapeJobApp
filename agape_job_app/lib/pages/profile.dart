import 'dart:convert';
import 'dart:developer';

import 'package:agape_job_app/services/provider.dart';
import 'package:agape_job_app/util/colors.dart';
import 'package:agape_job_app/util/globals.dart';
import 'package:agape_job_app/widget/common/dplazabar.dart';
import 'package:agape_job_app/widget/perfil/textinfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  dynamic profile=null,cursos;
  List tec=[];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var prov = Provider.of<Proveedor>(this.context,listen: false);
    var url = Uri.http(dominio.toString(),'/jeo/servicios/consultar_perfil.php',{"id":prov.idEstudiante});
    var urlcurso = Uri.http(dominio.toString(),'/jeo/servicios/consultar_capacitaciones.php',{"idEstudiante":prov.idEstudiante});
    var urlcomp = Uri.http(dominio.toString(),'/jeo/servicios/consultar_compentencia_tecnica.php',{"id":prov.idEstudiante});
    var response2 = http.get(urlcomp);

    var response1 = http.get(urlcurso);
    var response = http.get(url);
    response.then((value) {
      setState(() {
        profile = jsonDecode(value.body);
      });
    });
    response1.then((re) {
      setState(() {
        if(re.body.isNotEmpty){
          cursos = jsonDecode(re.body);
        }else{
          cursos = "";
        }
      });
    });
    response2.then((value) {
      setState(() {
        if(value.body.isNotEmpty){
        }else{
          tec = [];
        }
      });
    });

    if(profile!=null&&cursos!=null&&profile[0]!=null)
    return Scaffold(
      backgroundColor: dPrimaryColor,
      appBar: DPlazaBar("Mi Perfil"),
      body: Container(
        margin: EdgeInsets.only(top: 20),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(80),
                topRight: Radius.circular(80)
            )
        ),
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Center(
                child: Container(

                  margin: EdgeInsets.only(top: size.height*0.02),
                  child: Column(
                    children: [
                      // Container(
                      //   width: size.width*0.4,
                      //   child: Image.network("https://www.trecebits.com/wp-content/uploads/2019/02/Persona-1-445x445.jpg"),
                      // ),
                      Container(
                        margin: EdgeInsets.only(top: size.height*0.02),
                        child: Text(profile[0]["p_nombre"]+" "+profile[0]["p_apellido"],style: TextStyle(fontSize: 30,),),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: size.height*0.01),
                        child: Text(profile[0]["email"],style: TextStyle(fontSize: 15,fontWeight: FontWeight.w200),),
                      ),
                      Divider(
                        color: Colors.grey,
                        indent: 20,
                        endIndent: 20,
                        thickness: 1.5,
                      ),
                      Container(
                        width: size.width*0.9,
                        height: size.height*0.6,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: size.height*0.02,left: size.width*0.01,right: size.width*0.01),
                              padding: EdgeInsets.only(left: 5,right: 5),
                              child: SingleChildScrollView(
                                child: Card(
                                  elevation: 5,
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(bottom: size.height*0.015),
                                        child: Center(
                                          child: Text("Datos de identificación",
                                            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),),
                                      Container(
                                        width: size.width*0.8,
                                        margin: EdgeInsets.only(bottom: 10,left: 8,right: 8),
                                        child:
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [Icon(Icons.account_circle),
                                                Text("Carnet: ",style:TextStyle(fontSize: 16,fontWeight: FontWeight.bold))],
                                            ),
                                            Text((profile[0]["carnet"]==0?"no existe informacion":profile[0]["carnet"].toString()))
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: size.width*0.8,
                                        margin: EdgeInsets.only(bottom: 10,left:8,right: 8),
                                        child:
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [Icon(Icons.account_circle),
                                                Text("Sexo: ",style:TextStyle(fontSize: 16,fontWeight: FontWeight.bold))],
                                            ),
                                            Text(profile[0]["sexo"]=="M"?"Mujer":"Hombre")
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: size.width*0.8,
                                        margin: EdgeInsets.only(bottom: 10,left:8),
                                        child:
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [Icon(Icons.calendar_today),
                                                Text("Fecha de nacimiento: ",style:TextStyle(fontSize: 16,fontWeight: FontWeight.bold))],
                                            ),
                                            Text(profile[0]["fecha_nacimiento"]==null?"":profile[0]["fecha_nacimiento"])
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: size.width*0.8,
                                        margin: EdgeInsets.only(bottom: 10),
                                        child:
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [Icon(Icons.account_circle),
                                                Text("Estado Civíl:",style:TextStyle(fontSize: 16,fontWeight: FontWeight.bold))],
                                            ),
                                            Text(profile[0]["id_est_civil"]==null?"":profile[0]["id_est_civil"]["descripcion"])
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: size.width*0.8,
                                        margin: EdgeInsets.only(bottom: 10),
                                        child:
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [Icon(Icons.account_circle),
                                                Text("DUI:",style:TextStyle(fontSize: 16,fontWeight: FontWeight.bold))],
                                            ),
                                            Text(profile[0]["dui"])
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: size.width*0.8,
                                        margin: EdgeInsets.only(bottom: 10),
                                        child:
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [Icon(Icons.account_circle),
                                                Text("NIT:",style:TextStyle(fontSize: 16,fontWeight: FontWeight.bold))],
                                            ),
                                            Text(profile[0]["nit"])
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: size.width*0.8,
                                        margin: EdgeInsets.only(bottom: 10),
                                        child:
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [Icon(Icons.account_circle),
                                                Text("Género:",style:TextStyle(fontSize: 16,fontWeight: FontWeight.bold))],
                                            ),
                                            Text(profile[0]["id_genero"]==null?"":profile[0]["id_genero"]["descripcion"])
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: size.width*0.8,
                                        margin: EdgeInsets.only(bottom: 10),
                                        child:
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [Icon(Icons.account_circle),
                                                Text("Departamento:",style:TextStyle(fontSize: 16,fontWeight: FontWeight.bold))],
                                            ),
                                            Text(profile[0]["id_depto"]["descripcion"])
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: size.width*0.8,
                                        margin: EdgeInsets.only(bottom: 10),
                                        child:
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [Icon(Icons.account_circle),
                                                Text("Municipio:",style:TextStyle(fontSize: 16,fontWeight: FontWeight.bold))],
                                            ),
                                            Text(profile[0]["id_muni"]==null?"":profile[0]["id_muni"]["descripcion"])
                                          ],
                                        ),
                                      ),

                                      Container(
                                        width: size.width*0.8,
                                        margin: EdgeInsets.only(bottom: 10),
                                        child:
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [Icon(Icons.phone_android),
                                                Text("Número Celular",style:TextStyle(fontSize: 16,fontWeight: FontWeight.bold))],
                                            ),
                                            Text(profile[0]["num_celular"]==null?"":profile[0]["num_celular"])
                                          ],
                                        ),
                                      ),
                                      Container(
                                        width: size.width*0.8,
                                        margin: EdgeInsets.only(bottom: 10),
                                        child:
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [Icon(Icons.phone),
                                                Text("Número Fijo",style:TextStyle(fontSize: 16,fontWeight: FontWeight.bold))],
                                            ),
                                            Text(profile[0]["num_fijo"]==null?"":profile[0]["num_fijo"])
                                          ],
                                        ),
                                      ),
                                      Text("Dirección: ",style:TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                                      Container(
                                        width: size.width*0.75,
                                        child: Text(profile[0]["direccion"]==null?"":profile[0]["direccion"],textAlign: TextAlign.justify,maxLines: 10,overflow: TextOverflow.ellipsis,),
                                      ),
                                  Container(
                                        margin: EdgeInsets.only(top: size.height*0.01,bottom: size.height*0.01),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            ElevatedButton.icon(onPressed: ()=>{
                                              Navigator.of(context).pushNamed("/editarPerfil")
                                            }, label: Text("Editar"),icon: Icon(Icons.edit),),
                                            Container(
                                              margin: EdgeInsets.only(left: 5),
                                              child: ElevatedButton.icon(onPressed: (){
                                                Navigator.of(context).pushNamed("/experiencia");
                                              }, icon: Icon(Icons.edit), label:Text("Experiencia Laboral")),
                                            )
                                            //ElevatedButton.icon(onPressed: ()=>{}, label: Text("Descargar cv"), icon:Icon(Icons.download_outlined),)
                                          ],
                                        ),
                                      )
                                    ],
                                  ),

                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: size.height*0.02,left: size.width*0.01,right: size.width*0.01),
                              child: SingleChildScrollView(
                                child: Card(
                                  elevation: 5,
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(bottom: size.height*0.015),
                                        child: Center(
                                          child: Text("Capacitaciones Recibidas",
                                            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),),
                                      cursos.toString()!=""&&cursos[0]["curso"]!=null?TextInfo("Capacitacion recibida: ",cursos[0]["curso"]["descripcion"]):Text("No ha recibido capacitaciones"),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: size.height*0.02,left: size.width*0.01,right: size.width*0.01),
                              child: SingleChildScrollView(
                                child: Card(
                                  elevation: 5,
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(bottom: size.height*0.015),
                                        child: Center(
                                          child: Text("Capacitaciones Tecnicas",
                                            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),),
                                          if(tec.isNotEmpty)for(var e in tec) Text(e["descripcion"])else Text("no se encontro informacion")
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: size.height*0.02,left: size.width*0.01,right: size.width*0.01),
                              child: SingleChildScrollView(
                                child: Card(
                                  elevation: 5,
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(bottom: size.height*0.015),
                                        child: Center(
                                          child: Text("Discapacidades",
                                            style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),),),
                                      TextInfo("Discapacidades:","No se encontraron"),
                                    ],
                                  ),
                                ),
                              ),
                            ),
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
}
