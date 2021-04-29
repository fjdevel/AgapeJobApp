import 'package:flutter/material.dart';

class ExperienciaLaboral extends StatefulWidget {
  @override
  _ExperienciaLaboralState createState() => _ExperienciaLaboralState();
}

class _ExperienciaLaboralState extends State<ExperienciaLaboral> {
  final _scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        key: _scaffoldkey,
        appBar: AppBar(
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
                  //Widgets del formulario
                  //Cargo
                  Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                      child: Text('Cargo')
                  ),
                  Container(
                      width: size.width *0.85,
                      margin: EdgeInsets.only(top: 5.0),
                      height: 40.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 1, color: Colors.white, style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [ BoxShadow(
                              color: Colors.black26,
                              offset: const Offset(0.0, 3.0),
                              blurRadius: 1.2,
                              spreadRadius: 0.5
                          )
                          ]
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 10),
                            hintText: '| Cargo',
                            suffixIcon: Icon(Icons.assignment_ind),
                            suffixIconConstraints: BoxConstraints(minWidth: 40)
                        ),
                      )
                  ),
                  //Fecha Inicio
                  Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                      child: Text('Fecha Inicio')
                  ),
                  Container(
                      width: size.width *0.85,
                      margin: EdgeInsets.only(top: 5.0),
                      height: 40.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 1, color: Colors.white, style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [ BoxShadow(
                              color: Colors.black26,
                              offset: const Offset(0.0, 3.0),
                              blurRadius: 1.2,
                              spreadRadius: 0.5
                          )
                          ]
                      ),
                      child: TextField(
                        keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 10),
                            hintText: '| Fecha Inicio',
                            suffixIcon: Icon(Icons.calendar_today),
                            suffixIconConstraints: BoxConstraints(minWidth: 40)
                        ),
                      )
                  ),
                  //Fecha Fin
                  Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                      child: Text('Fecha Fin')
                  ),
                  Container(
                      width: size.width *0.85,
                      margin: EdgeInsets.only(top: 5.0),
                      height: 40.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 1, color: Colors.white, style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [ BoxShadow(
                              color: Colors.black26,
                              offset: const Offset(0.0, 3.0),
                              blurRadius: 1.2,
                              spreadRadius: 0.5
                          )
                          ]
                      ),
                      child: TextField(
                        keyboardType: TextInputType.datetime,
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 10),
                            hintText: '| Fecha Fin',
                            suffixIcon: Icon(Icons.calendar_today),
                            suffixIconConstraints: BoxConstraints(minWidth: 40)
                        ),
                      )
                  ),
                  //Funciones
                  Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                      child: Text('Funciones')
                  ),
                  Container(
                      width: size.width *0.85,
                      margin: EdgeInsets.only(top: 5.0),
                      height: 40.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 1, color: Colors.white, style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [ BoxShadow(
                              color: Colors.black26,
                              offset: const Offset(0.0, 3.0),
                              blurRadius: 1.2,
                              spreadRadius: 0.5
                          )
                          ]
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 10),
                            hintText: '| Funciones',
                            suffixIcon: Icon(Icons.assignment),
                            suffixIconConstraints: BoxConstraints(minWidth: 40)
                        ),
                      )
                  ),
                  //Nombre de la Empresa
                  Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                      child: Text('Nombre de la Empresa')
                  ),
                  Container(
                      width: size.width *0.85,
                      margin: EdgeInsets.only(top: 5.0),
                      height: 40.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 1, color: Colors.white, style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [ BoxShadow(
                              color: Colors.black26,
                              offset: const Offset(0.0, 3.0),
                              blurRadius: 1.2,
                              spreadRadius: 0.5
                          )
                          ]
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 10),
                            hintText: '| Nombre de la Empresa',
                            suffixIcon: Icon(Icons.business_center),
                            suffixIconConstraints: BoxConstraints(minWidth: 40)
                        ),
                      )
                  ),
                  //Nombre del Jefe
                  Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                      child: Text('Nombre del Jefe')
                  ),
                  Container(
                      width: size.width *0.85,
                      margin: EdgeInsets.only(top: 5.0),
                      height: 40.0,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(width: 1, color: Colors.white, style: BorderStyle.solid),
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [ BoxShadow(
                              color: Colors.black26,
                              offset: const Offset(0.0, 3.0),
                              blurRadius: 1.2,
                              spreadRadius: 0.5
                          )
                          ]
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.fromLTRB(15, 0, 0, 10),
                            hintText: '| Nombre del Jefe',
                            suffixIcon: Icon(Icons.account_circle),
                            suffixIconConstraints: BoxConstraints(minWidth: 40)
                        ),
                      )
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }
}
