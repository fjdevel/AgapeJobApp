import 'package:agape_job_app/widget/busqueda/aplicarfiltrosbtn.dart';
import 'package:agape_job_app/widget/busqueda/busquedabar.dart';
import 'package:agape_job_app/widget/busqueda/filtroempresa.dart';
import 'package:agape_job_app/widget/busqueda/filtroubicacion.dart';
import 'package:agape_job_app/widget/busqueda/ordenarpor.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class FormBusqueda extends StatefulWidget {
  @override
  _FormBusquedaState createState() => _FormBusquedaState();
}

class _FormBusquedaState extends State<FormBusqueda> {

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 10,
      height: MediaQuery.of(context).size.height - 80,
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      color: Colors.white,
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            BusquedaBar(),
            FiltrosText(),
            OrdenarPor(),
            FiltroEmpresa(),
            FiltroUbicacion(),
            AplicarFiltros()
           ],
        ),
      ),
    );
  }
}

class FiltrosText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
      width: MediaQuery.of(context).size.width * 0.90,
      child: Text(
        "Filtros",
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
      ),
    );
  }
}

