import 'package:agape_job_app/widget/detalleplaza/aplicarbutton.dart';
import 'package:agape_job_app/widget/detalleplaza/detalleinfo.dart';
import 'package:agape_job_app/widget/detalleplaza/logo.dart';
import 'package:agape_job_app/widget/detalleplaza/profesion.dart';
import 'package:agape_job_app/widget/detalleplaza/salario.dart';
import 'package:agape_job_app/widget/detalleplaza/ubicacion.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DetalleBody extends StatefulWidget {
  @override
  _DetalleBodyState createState() => _DetalleBodyState();
}

class _DetalleBodyState extends State<DetalleBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: Container(
        child: Column(
          children: <Widget>[
            Center(
              child: LogoDetalle(),
            ),
            Profesion(),
            Ubicacion(),
            Salario(),
            DetalleInfo(),
            AplicarButton()
          ],
        ),
      ),
    );
  }
}
