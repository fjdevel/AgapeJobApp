import 'package:agape_job_app/pages/FormacionAcademicaForm.dart';
import 'package:agape_job_app/pages/aplicaciones.dart';
import 'package:agape_job_app/pages/busqueda.dart';
import 'package:agape_job_app/pages/capacitacionesrecibidas.dart';
import 'package:agape_job_app/pages/competenciaTecForm.dart';
import 'package:agape_job_app/pages/competenciaTecnica.dart';
import 'package:agape_job_app/pages/configuracion.dart';
import 'package:agape_job_app/pages/discapacidades.dart';
import 'package:agape_job_app/pages/discapacidadform.dart';
import 'package:agape_job_app/pages/editprofile.dart';
import 'package:agape_job_app/pages/experiencialaboral.dart';
import 'package:agape_job_app/pages/formacion.dart';
import 'package:agape_job_app/pages/habilidadesBlandas.dart';
import 'package:agape_job_app/pages/habilidadesBlandasForm.dart';
import 'package:agape_job_app/pages/iniciopage.dart';
import 'package:agape_job_app/pages/login.dart';
import 'package:agape_job_app/pages/otrashabilidades.dart';
import 'package:agape_job_app/pages/preferencias.dart';
import 'package:agape_job_app/pages/preferenciasForm.dart';
import 'package:agape_job_app/pages/profile.dart';
import 'package:agape_job_app/pages/referenciaPersonalForm.dart';
import 'package:agape_job_app/pages/referencialaboralform.dart';
import 'package:agape_job_app/pages/referenciasLaborales.dart';
import 'package:agape_job_app/pages/referenciasPersonales.dart';
import 'package:agape_job_app/pages/register.dart';
import 'package:agape_job_app/services/provider.dart';
import 'package:agape_job_app/widget/perfil/capacitacionesinternas.dart';
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
        "/experiencia":(BuildContext context)=>ExperienciaLaboral(null),
        "/configuracion":(BuildContext context)=>ConfiguracionPage(),
        "/capacitacionesForm":(BuildContext context)=>CapacitacionesR(null),
        "/capacitacionesInternasForm":(BuildContext context)=>CapacitacionesInternasForm(null,null),
        "/competenciaTecnica":(BuildContext context)=>CompetenciaTecnica(),
        "/competenciaTecnicaForm":(BuildContext context)=>CompetenciaTecnicaForm(),
        "/discapacidades":(BuildContext context)=>Discapacidades(),
        "/discapacidadfForm":(BuildContext context)=>DiscapacidadForm(),
        "/formacionAcademica":(BuildContext context)=>FormacionAcademica(),
        "/formacionForm":(BuildContext context)=>FormacionAcademicaForm(null,null),
        "/habilidadesBlandas":(BuildContext context)=>HabilidadesBlandas(),
        "/habilidadesBlandasForm":(BuildContext context)=>HabilidadesBlandasForm(),
        "/otrasHabilidades":(BuildContext context)=>OtrasHabilidades(),
        "/preferencias":(BuildContext context)=>PreferenciasDeTrabajo(),
        "/referenciasLaborales":(BuildContext context)=>ReferenciasLaborales(),
        "/referenciaLaboralForm":(BuildContext context)=>ReferenciaLaboralForm(null),

        "/referenciasPersonales":(BuildContext context)=>ReferenciasPersonales(),
        "/referenciaPersonalForm":(BuildContext context)=>ReferenciaPersonalForm(null),
        "/preferenciaForm":(BuildContext context)=>PreferenciasForm(),
      },
      home: LoginScreen(),
    );
  }
}
