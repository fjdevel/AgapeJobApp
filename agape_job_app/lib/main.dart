import 'package:agape_job_app/pages/aplicaciones.dart';
import 'package:agape_job_app/pages/busqueda.dart';
import 'package:agape_job_app/pages/editprofile.dart';
import 'package:agape_job_app/pages/experiencialaboral.dart';
import 'package:agape_job_app/pages/iniciopage.dart';
import 'package:agape_job_app/pages/login.dart';
import 'package:agape_job_app/pages/profile.dart';
import 'package:agape_job_app/pages/register.dart';
import 'package:agape_job_app/services/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    // Retrieve the device cameras
  }  catch (e) {
    print(e);
  }
  runApp(
      ChangeNotifierProvider(
        create: (_)=>Proveedor(),
        child: MyApp(),
      )
  );
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
        "/registro":(BuildContext context)=>RegisterPage(),
        "/aplicaciones":(BuildContext context)=>Aplicaciones(),
        "/editarPerfil":(BuildContext context)=>FormularioIngreso(),
        "/experiencia":(BuildContext context)=>ExperienciaLaboral()

      },
      home: LoginScreen(),
    );
  }
}
