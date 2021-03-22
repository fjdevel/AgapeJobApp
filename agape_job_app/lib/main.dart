import 'package:agape_job_app/pages/busqueda.dart';
import 'package:agape_job_app/pages/iniciopage.dart';
import 'package:agape_job_app/pages/login.dart';
import 'package:agape_job_app/pages/profile.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'JOB',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      routes: <String,WidgetBuilder>{
        "/login":(BuildContext context)=>LoginScreen(),
        "/inicio":(BuildContext context)=>InicioPage(),
        "/perfil":(BuildContext context)=>Profile(),
      },
      home: LoginScreen(),
    );
  }
}
