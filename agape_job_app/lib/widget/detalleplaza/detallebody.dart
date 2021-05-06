import 'dart:developer';

import 'package:agape_job_app/widget/detalleplaza/aplicarbutton.dart';
import 'package:agape_job_app/widget/detalleplaza/detalleinfo.dart';
import 'package:agape_job_app/widget/detalleplaza/logo.dart';
import 'package:agape_job_app/widget/detalleplaza/profesion.dart';
import 'package:agape_job_app/widget/detalleplaza/salario.dart';
import 'package:agape_job_app/widget/detalleplaza/ubicacion.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DetalleBody extends StatefulWidget {
  dynamic job;


  DetalleBody(this.job);

  @override
  _DetalleBodyState createState() => _DetalleBodyState(this.job);
}

class _DetalleBodyState extends State<DetalleBody> {
  dynamic _job;

  _DetalleBodyState(this._job);

  @override
  Widget build(BuildContext context) {
    log(this._job.toString());
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
      child: Container(
        child: Column(
          children: <Widget>[
            // Center(
            //   child: LogoDetalle(),
            // ),
             Center(child: Profesion(_job['descripcion']),),
            Ubicacion(_job['ctgMuni']==null?"No existe informacion":_job['ctgMuni']["descripcion"]),
            Salario(_job['salario']),
            DetalleInfo(_job),
            AplicarButton(_job['id']['id'])
          ],
        ),
      ),
    );
  }
}
