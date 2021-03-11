import 'package:agape_job_app/util/colors.dart';
import 'package:agape_job_app/widget/login/emaillogin.dart';
import 'package:agape_job_app/widget/login/loginbutton.dart';
import 'package:agape_job_app/widget/login/passwordlogin.dart';
import 'package:agape_job_app/widget/login/singuplogin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FormLogin extends StatefulWidget {
  @override
  _FormLoginState createState() => _FormLoginState();
}

class _FormLoginState extends State<FormLogin> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: 50),
      decoration: new BoxDecoration(
        borderRadius: BorderRadius.only(topLeft: Radius.circular(120)),
        color: dSecundaryColor
      ),
      height: size.height-230,
      width: double.infinity,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 80),
            child: Center(
              child: Text("Bienvenido",style: TextStyle(fontSize: 42,fontWeight: FontWeight.w400),),
            ),
          ),
          EmailLogin(),
          PasswordLogin(),
          LoginButton(),
          SingUpLogin()
        ],
      ),
    );
  }
}
