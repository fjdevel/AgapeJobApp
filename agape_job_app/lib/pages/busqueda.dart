import 'package:agape_job_app/widget/busqueda/formbusqueda.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class Busqueda extends StatefulWidget {
  @override
  _BusquedaState createState() => _BusquedaState();
}

class _BusquedaState extends State<Busqueda> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: FormBusqueda()
    );
  }
}
