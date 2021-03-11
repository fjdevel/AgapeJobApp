import 'package:agape_job_app/util/colors.dart';
import 'package:agape_job_app/widget/login/formlogin.dart';
import 'package:agape_job_app/widget/login/logo.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: dPrimaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Center(
              child: Logo(),
            ),
            FormLogin()
          ],
        ),
      ),
    );
  }
}