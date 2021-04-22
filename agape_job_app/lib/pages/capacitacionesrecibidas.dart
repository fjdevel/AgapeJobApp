import 'package:flutter/material.dart';

class CapacitacionesR extends StatefulWidget {
  @override
  _CapacitacionesRState createState() => _CapacitacionesRState();
}

class _CapacitacionesRState extends State<CapacitacionesR> {
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
                  //Fecha de finalización
                  Container(
                    width: MediaQuery.of(context).size.width * 0.85,
                    margin: EdgeInsets.only(top: 10),
                    padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                    child: Text('Fecha de Finalilzación')
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
                            hintText: '| Fecha de Finalización'
                        ),
                      )
                  ),
                  //Institución
                  Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                      child: Text('Institución')
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
                            hintText: '| Institución'
                        ),
                      )
                  ),
                  //Nombre del Curso
                  Container(
                      width: MediaQuery.of(context).size.width * 0.85,
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                      child: Text('Nombre del Curso')
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
                            hintText: '| Nombre del Curso'
                        ),
                      )
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}
