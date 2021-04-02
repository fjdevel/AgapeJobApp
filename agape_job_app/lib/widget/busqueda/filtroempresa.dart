import 'package:agape_job_app/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class Empresas {
  final String nombre;
  Empresas({
    this.nombre
  });
}

class FiltroEmpresa extends StatefulWidget {

  @override
  _FiltroEmpresaState createState() => _FiltroEmpresaState();
}

class _FiltroEmpresaState extends State<FiltroEmpresa> {

  static List<Empresas> _empresas = [
    Empresas(nombre: "Empresa 1"),
    Empresas(nombre: "Empresa 2"),
    Empresas(nombre: "Empresa 3"),
    Empresas(nombre: "Empresa 4"),
    Empresas(nombre: "Empresa 5"),
    Empresas(nombre: "Empresa 6"),
    Empresas(nombre: "Empresa 7"),
    Empresas(nombre: "Empresa 8"),
    Empresas(nombre: "Empresa 9"),
    Empresas(nombre: "Empresa 10"),
  ];

  final _items = _empresas
      .map((empresa) => MultiSelectItem<Empresas>(empresa, empresa.nombre)).toList();

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
            child: Text("Empresa",
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
              title: Text("Empresas"),
              confirmText: Text("Aceptar"),
              cancelText: Text("Cancelar"),
              searchable: true,
              listType: MultiSelectListType.CHIP,
              selectedColor: dPrimaryColor,
              unselectedColor: dSecundaryColor,
              searchHint: "Buscar Empresa",
              selectedItemsTextStyle: TextStyle(color: dSecundaryColor),
            ),
          ),

        ],
      ),
    );
  }
}