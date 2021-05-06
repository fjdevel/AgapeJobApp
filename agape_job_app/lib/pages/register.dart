import 'dart:convert';

import 'package:agape_job_app/util/colors.dart';
import 'package:agape_job_app/util/globals.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController emailController=new TextEditingController(),
      usuarioController=new TextEditingController(),
      claveController=new TextEditingController(),
      claveController2=new TextEditingController(),
      nombreController=new TextEditingController(),
      nombre2Controller = new TextEditingController(),
      apellidoController=new TextEditingController(),
      duiController = new TextEditingController(),
      nitController = new TextEditingController(),
     apellido2Controller=new TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: dSecundaryColor,
      appBar: AppBar(
        leading: BackButton(color: Colors.white,),
        backgroundColor: dPrimaryColor,
        title: Text("Registro"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: size.width*0.8,
          child: Center(
            child: ListView(
              children: [
                Container(
                  margin: EdgeInsets.only(
                      top: size.height*0.06
                  ),
                  width: size.width * 0.85,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          width: 1,
                          color: Colors.white,
                          style: BorderStyle.solid
                      ),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            offset: const Offset(0.0, 3.0),
                            blurRadius: 1.2,
                            spreadRadius: 0.5
                        )
                      ]
                  ),
                  child: Stack(
                    children: [
                      Container(
                          margin: EdgeInsets.only(
                              left: 20,
                              top: 10
                          ),
                          padding: EdgeInsets.only(top: 2),
                          child: Text(
                            "Correo Electrónico",
                            style: TextStyle(fontSize: 11),
                          )
                      ),
                      TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'ejemplo@mail.com',
                          hintStyle: TextStyle(fontSize: 14),
                          contentPadding: EdgeInsets.fromLTRB(20, 25, 0, 10),
                          isDense: true,
                        ),
                        textAlignVertical: TextAlignVertical.bottom,
                        controller: emailController,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: size.height*0.06
                  ),
                  width: size.width * 0.85,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          width: 1,
                          color: Colors.white,
                          style: BorderStyle.solid
                      ),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            offset: const Offset(0.0, 3.0),
                            blurRadius: 1.2,
                            spreadRadius: 0.5
                        )
                      ]
                  ),
                  child: Stack(
                    children: [
                      Container(
                          margin: EdgeInsets.only(
                              left: 20,
                              top: 10
                          ),
                          padding: EdgeInsets.only(top: 2),
                          child: Text(
                            "Usuario",
                            style: TextStyle(fontSize: 11),
                          )
                      ),
                      TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'usuario',
                          hintStyle: TextStyle(fontSize: 14),
                          contentPadding: EdgeInsets.fromLTRB(20, 25, 0, 10),
                          isDense: true,
                        ),
                        textAlignVertical: TextAlignVertical.bottom,
                        controller: usuarioController,
                      ),
                    ],
                  ),
                ),

                Container(
                  margin: EdgeInsets.only(
                      top: size.height*0.06
                  ),
                  width: size.width * 0.85,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          width: 1,
                          color: Colors.white,
                          style: BorderStyle.solid
                      ),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            offset: const Offset(0.0, 3.0),
                            blurRadius: 1.2,
                            spreadRadius: 0.5
                        )
                      ]
                  ),
                  child: Stack(
                    children: [
                      Container(
                          margin: EdgeInsets.only(
                              left: 20,
                              top: 10
                          ),
                          padding: EdgeInsets.only(top: 2),
                          child: Text(
                            "Clave",
                            style: TextStyle(fontSize: 11),
                          )
                      ),
                      TextField(
                        decoration: InputDecoration(

                          border: InputBorder.none,
                          hintText: '*********',
                          hintStyle: TextStyle(fontSize: 14),
                          contentPadding: EdgeInsets.fromLTRB(20, 25, 0, 10),
                          isDense: true,
                        ),
                        textAlignVertical: TextAlignVertical.bottom,
                        controller: claveController,
                        obscureText: true,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: size.height*0.06
                  ),
                  width: size.width * 0.85,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          width: 1,
                          color: Colors.white,
                          style: BorderStyle.solid
                      ),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            offset: const Offset(0.0, 3.0),
                            blurRadius: 1.2,
                            spreadRadius: 0.5
                        )
                      ]
                  ),
                  child: Stack(
                    children: [
                      Container(
                          margin: EdgeInsets.only(
                              left: 20,
                              top: 10
                          ),
                          padding: EdgeInsets.only(top: 2),
                          child: Text(
                            "Repita la Clave",
                            style: TextStyle(fontSize: 11),
                          )
                      ),
                      TextField(
                        decoration: InputDecoration(

                          border: InputBorder.none,
                          hintText: '*********',
                          hintStyle: TextStyle(fontSize: 14),
                          contentPadding: EdgeInsets.fromLTRB(20, 25, 0, 10),
                          isDense: true,
                        ),
                        textAlignVertical: TextAlignVertical.bottom,
                        controller: claveController2,
                        obscureText: true,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: size.height*0.06
                  ),
                  width: size.width * 0.85,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          width: 1,
                          color: Colors.white,
                          style: BorderStyle.solid
                      ),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            offset: const Offset(0.0, 3.0),
                            blurRadius: 1.2,
                            spreadRadius: 0.5
                        )
                      ]
                  ),
                  child: Stack(
                    children: [
                      Container(
                          margin: EdgeInsets.only(
                              left: 20,
                              top: 10
                          ),
                          padding: EdgeInsets.only(top: 2),
                          child: Text(
                            "Nombre",
                            style: TextStyle(fontSize: 11),
                          )
                      ),
                      TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Digite su nombre',
                          hintStyle: TextStyle(fontSize: 14),
                          contentPadding: EdgeInsets.fromLTRB(20, 25, 0, 10),
                          isDense: true,
                        ),
                        textAlignVertical: TextAlignVertical.bottom,
                        controller: nombreController,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: size.height*0.06
                  ),
                  width: size.width * 0.85,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          width: 1,
                          color: Colors.white,
                          style: BorderStyle.solid
                      ),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            offset: const Offset(0.0, 3.0),
                            blurRadius: 1.2,
                            spreadRadius: 0.5
                        )
                      ]
                  ),
                  child: Stack(
                    children: [
                      Container(
                          margin: EdgeInsets.only(
                              left: 20,
                              top: 10
                          ),
                          padding: EdgeInsets.only(top: 2),
                          child: Text(
                            "Segundo Nombre",
                            style: TextStyle(fontSize: 11),
                          )
                      ),
                      TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Digite su segundo nombre',
                          hintStyle: TextStyle(fontSize: 14),
                          contentPadding: EdgeInsets.fromLTRB(20, 25, 0, 10),
                          isDense: true,
                        ),
                        textAlignVertical: TextAlignVertical.bottom,
                        controller: nombre2Controller,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: size.height*0.06
                  ),
                  width: size.width * 0.85,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          width: 1,
                          color: Colors.white,
                          style: BorderStyle.solid
                      ),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            offset: const Offset(0.0, 3.0),
                            blurRadius: 1.2,
                            spreadRadius: 0.5
                        )
                      ]
                  ),
                  child: Stack(
                    children: [
                      Container(
                          margin: EdgeInsets.only(
                              left: 20,
                              top: 10
                          ),
                          padding: EdgeInsets.only(top: 2),
                          child: Text(
                            "Apellido",
                            style: TextStyle(fontSize: 11),
                          )
                      ),
                      TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Digite su apellido',
                          hintStyle: TextStyle(fontSize: 14),
                          contentPadding: EdgeInsets.fromLTRB(20, 25, 0, 10),
                          isDense: true,
                        ),
                        textAlignVertical: TextAlignVertical.bottom,
                        controller: apellidoController,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: size.height*0.06
                  ),
                  width: size.width * 0.85,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          width: 1,
                          color: Colors.white,
                          style: BorderStyle.solid
                      ),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            offset: const Offset(0.0, 3.0),
                            blurRadius: 1.2,
                            spreadRadius: 0.5
                        )
                      ]
                  ),
                  child: Stack(
                    children: [
                      Container(
                          margin: EdgeInsets.only(
                              left: 20,
                              top: 10
                          ),
                          padding: EdgeInsets.only(top: 2),
                          child: Text(
                            "Segundo Apellido",
                            style: TextStyle(fontSize: 11),
                          )
                      ),
                      TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Digite su segundo apellido',
                          hintStyle: TextStyle(fontSize: 14),
                          contentPadding: EdgeInsets.fromLTRB(20, 25, 0, 10),
                          isDense: true,
                        ),
                        textAlignVertical: TextAlignVertical.bottom,
                        controller: apellido2Controller,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: size.height*0.06
                  ),
                  width: size.width * 0.85,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          width: 1,
                          color: Colors.white,
                          style: BorderStyle.solid
                      ),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            offset: const Offset(0.0, 3.0),
                            blurRadius: 1.2,
                            spreadRadius: 0.5
                        )
                      ]
                  ),
                  child: Stack(
                    children: [
                      Container(
                          margin: EdgeInsets.only(
                              left: 20,
                              top: 10
                          ),
                          padding: EdgeInsets.only(top: 2),
                          child: Text(
                            "DUI",
                            style: TextStyle(fontSize: 11),
                          )
                      ),
                      TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '012345678',
                          hintStyle: TextStyle(fontSize: 14),
                          contentPadding: EdgeInsets.fromLTRB(20, 25, 0, 10),
                          isDense: true,
                        ),
                        textAlignVertical: TextAlignVertical.bottom,
                        controller: duiController,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                      top: size.height*0.06
                  ),
                  width: size.width * 0.85,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                          width: 1,
                          color: Colors.white,
                          style: BorderStyle.solid
                      ),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black26,
                            offset: const Offset(0.0, 3.0),
                            blurRadius: 1.2,
                            spreadRadius: 0.5
                        )
                      ]
                  ),
                  child: Stack(
                    children: [
                      Container(
                          margin: EdgeInsets.only(
                              left: 20,
                              top: 10
                          ),
                          padding: EdgeInsets.only(top: 2),
                          child: Text(
                            "NIT",
                            style: TextStyle(fontSize: 11),
                          )
                      ),
                      TextField(
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '01234567890123',
                          hintStyle: TextStyle(fontSize: 14),
                          contentPadding: EdgeInsets.fromLTRB(20, 25, 0, 10),
                          isDense: true,
                        ),
                        textAlignVertical: TextAlignVertical.bottom,
                        controller: nitController,
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: size.height*0.02),
                  padding: EdgeInsets.symmetric(vertical: 25),
                  width: size.width * 0.85,
                  child: RaisedButton(
                    onPressed: () async {

                      if(claveController.text==claveController2.text){
                        var url = Uri.http(dominio.toString(),'/jeo/servicios/sec_usuario.php',
                            {
                              'accion':'IE'
                            });
                        var data = jsonEncode({

                                "depto":{"id":"1"},
                                "p_nombre":nombreController.text,
                                "s_nombre":nombre2Controller.text,
                                "nombre_usuario":usuarioController.text,
                                "p_apellido":apellidoController.text,
                                "s_apellido":apellido2Controller.text,
                                "email":emailController.text,
                                "dui":duiController.text,
                                "nit":nitController.text,
                                "pass":claveController.text
                                }
                            );
                        var response = http.post(url,body: data);
                        response.then((value) {
                          var r = jsonDecode(value.body);
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(r["info"])));
                        }).whenComplete(() {
                          Navigator.of(context).pop();
                        });
                      }else{
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Las contraseñas ingresadas no coinciden")));
                      }

                    },
                    padding: EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                    color: dPrimaryColor,
                    child: Text(
                      'Registrarse',
                      style: TextStyle(
                          color: dSecundaryColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w300
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

