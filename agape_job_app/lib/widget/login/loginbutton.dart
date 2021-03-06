import 'dart:convert';
import 'dart:developer';

import 'package:agape_job_app/services/provider.dart';
import 'package:agape_job_app/util/colors.dart';
import 'package:agape_job_app/util/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class LoginButton extends StatefulWidget {
  @override
  _LoginButtonState createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: size.height*0.02),
      padding: EdgeInsets.symmetric(vertical: 25),
      width: size.width * 0.85,
      child: RaisedButton(
        onPressed: ()async{

          var prov = Provider.of<Proveedor>(this.context,listen: false);
          if(prov.EMAIL.isNotEmpty && prov.PASS.isNotEmpty){
            //var url = Uri.http('192.168.1.5','/jeo/servicios/seguridad/inicio_de_sesion.php');

            var url = Uri.http(dominio.toString(),'/jeo/servicios/seguridad/inicio_de_sesion.php');
            var response = await http.post(url,body: {"user":prov.EMAIL,"password":prov.PASS});
            if(response.statusCode==200){
              var resp = response.body.split(",");
              prov.usr = resp[0].split(":").last.replaceAll('"', '');
              prov.idEstudiante = resp[1].split(":").last.replaceAll('"', '');
              Navigator.of(context).pushNamed("/inicio");
            }else{
              log(response.body);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response.body),
                duration: Duration(seconds: 3),));
            }
          }else{
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Necesita ingresar sus credenciales adecuadamente")));
          }


        },
        padding: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
        ),
        color: dPrimaryColor,
        child: Text(
          'Iniciar Sesi??n',
          style: TextStyle(
              color: dSecundaryColor,
              fontSize: 18,
              fontWeight: FontWeight.w300
          ),
        ),
      ),
    );
  }
}
