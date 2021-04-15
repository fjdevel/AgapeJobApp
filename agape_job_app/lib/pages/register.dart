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
      nombreController=new TextEditingController(),
      apellidoController=new TextEditingController();
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
                  margin: EdgeInsets.only(top: size.height*0.02),
                  padding: EdgeInsets.symmetric(vertical: 25),
                  width: size.width * 0.85,
                  child: RaisedButton(
                    onPressed: () async {
                      var queryParameters = {
                        'accion':'I',
                        'usr':usuarioController.text,
                        'clave':claveController.text,
                        'nombre':nombreController.text,
                        'apellido':apellidoController.text,
                        'email':emailController.text,
                        'user':'admin',
                        'idInstitucion':'1',
                        'idEmpresa':'1',
                        'idSede':'1'
                      };
                      var url = Uri.http(dominio.toString(),'/jeo/servicios/sec_usuario.php',queryParameters);
                      //var url = Uri.http('agape-jobws.000webhostapp.com', '/servicios/sec_usuario.php',queryParameters);
                      var response = await http.get(url);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response.body)));
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

