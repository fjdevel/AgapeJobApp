import 'package:agape_job_app/util/colors.dart';
import 'package:agape_job_app/util/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class LoginButton extends StatefulWidget {
  final TextEditingController passwordController,emailController;

  const LoginButton(this.passwordController,this.emailController);
  @override
  _LoginButtonState createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.symmetric(vertical: 25),
      width: MediaQuery.of(context).size.width * 0.85,
      child: RaisedButton(
        onPressed: ()async{
          var url = Uri.http('192.168.1.4','/jeo/servicios/seguridad/inicio_de_sesion.php');
          var response = await http.post(url,body: {"email":widget.emailController.text,"password":widget.passwordController.text});
          if(response.statusCode==200){
            Navigator.of(context).pushNamed("/inicio");
          }else{
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response.body),
            duration: Duration(seconds: 3),));
          }

        },
        padding: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
        ),
        color: dPrimaryColor,
        child: Text(
          'Iniciar Sesión',
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
