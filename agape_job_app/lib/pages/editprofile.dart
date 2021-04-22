import 'package:agape_job_app/util/colors.dart';
import 'package:agape_job_app/widget/editprofile/btneditprofile.dart';
import 'package:agape_job_app/widget/editprofile/chkgraduado.dart';
import 'package:agape_job_app/widget/editprofile/droptextfields.dart';
import 'package:agape_job_app/widget/editprofile/fechanacimiento.dart';
import 'package:agape_job_app/widget/editprofile/textfields.dart';
import 'package:agape_job_app/widget/editprofile/textos.dart';
import 'package:flutter/material.dart';

class FormularioIngreso extends StatelessWidget {
  final _scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        backgroundColor: dPrimaryColor,
        title: Text(' '),
      ),
      body: Container(
        height: size.height * 0.95,
        width: size.width * 1,
        child: SingleChildScrollView(
          child: Container(
            width: size.width *0.85,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Texto('Primer Nombre'),
                TextFields('| PRIMER NOMBRE'),
                Texto('Segundo Nombre'),
                TextFields('| SEGUNDO NOMBRE'),
                Texto('Tercer Nombre'),
                TextFields('| TERCER NOMBRE'),
                Texto('Primer Apellido'),
                TextFields('| PRIMER APELLIDO'),
                Texto('Segundo Apellido'),
                TextFields('| SEGUNDO APELLIDO'),
                Texto('Apellido de Casada'),
                TextFields('| APELLIDO DE CASADA'),
                Texto('Estado Civil'),
                DropDownText('| ESTADO CIVIL', ['Solter@', 'Casad@', 'Acompañaad@', 'Viud@', 'Divorciad@']),
                Texto('Sexo'),
                DropDownText('| SEXO', ['Hombre', 'Mujer']),
                Texto('Género'),
                DropDownText('| GÉNERO', ['1', '2', '3']),
                Texto('Fecha de Nacimiento'),
                FechaNacimiento(),
                Texto('DUI'),
                TextFields('| 99999999-9'),
                Texto('NIT'),
                TextFields('| 9999-999999-999-9'),
                Texto('Departamento'),
                DropDownText('| SELECCIONE DEPARTAMENTO', ['1', '2', '3', '4']),
                Texto('Municipio'),
                DropDownText('| SELECCIONE MUNICIPIO', ['1', '2', '3', '4']),
                Texto('Dirección'),
                TextFields('| DIRECCIÓN'),
                Texto('Número de Celular'),
                TextFields('| NÚMERO DE CELULAR'),
                Texto('Número Fijo'),
                TextFields('| NUMERO FIJO'),
                Texto('Correo Electrónico'),
                TextFields('| CORREO ELECTRÓNICO'),
                ChkGraduado(),
                BTNEdit()
              ],
            ),
          ),
        ),
      ),
    );
  }
}