import 'package:agape_job_app/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class Ubicacion {
  final String nombre;
  Ubicacion({
    this.nombre
  });
}

class FiltroUbicacion extends StatefulWidget {

  @override
  _FiltroUbicacionState createState() => _FiltroUbicacionState();
}

class _FiltroUbicacionState extends State<FiltroUbicacion> {

  static List<Ubicacion> _ubicacion = [
    Ubicacion(nombre: "Lugar 1"),
    Ubicacion(nombre: "Lugar 2"),
    Ubicacion(nombre: "Lugar 3"),
    Ubicacion(nombre: "Lugar 4"),
    Ubicacion(nombre: "Lugar 5"),
    Ubicacion(nombre: "Lugar 6"),
    Ubicacion(nombre: "Lugar 7"),
    Ubicacion(nombre: "Lugar 8"),
    Ubicacion(nombre: "Lugar 9"),
    Ubicacion(nombre: "Lugar 10"),
  ];

  final _items = _ubicacion
      .map((empresa) => MultiSelectItem<Ubicacion>(empresa, empresa.nombre)).toList();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      width: MediaQuery.of(context).size.width * 0.90,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 5),
            child: Text("Ubicación",
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.black
              ),
            ),
          ),
          Card(
            shadowColor: Colors.transparent,
            child: MultiSelectDialogField(
              items: _items,
              buttonText: Text("| Buscar"),
              buttonIcon: Icon(Icons.keyboard_arrow_down, color: Colors.black),
              title: Text("Ubicación"),
              confirmText: Text("Aceptar"),
              cancelText: Text("Cancelar"),
              searchable: true,
              listType: MultiSelectListType.CHIP,
              selectedColor: dPrimaryColor,
              unselectedColor: dSecundaryColor,
              searchHint: "Buscar Ubicación",
              selectedItemsTextStyle: TextStyle(color: dSecundaryColor),
            ),
          ),

        ],
      ),
    );
  }
}