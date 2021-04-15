import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DetalleLista extends StatelessWidget {
  dynamic job;


  DetalleLista(this.job);



  @override
  Widget build(BuildContext context) {
    final List<String> entradas = <String>['Descripcion: '+this.job['descripcion'],
    this.job['es_urgente']==1?"Urgente: SI":"Urgente : NO",
      this.job['funciones_plaza']==null?"Funciones de la plaza: No especifica":"Funciones de la plaza"+this.job['funciones_plaza'],
      (this.job['disponibilidad_viajar']==null||this.job['disponibilidad_viajar']=='0')?"Disponibilidad de viajar: No especifica":"Disponibiliad de viajar: "+this.job['disponibilidad_viajar'],
      (this.job['experiencia_laboral']==null||this.job['experiencia_laboral']=='0')?"Experiencia laboral: No especifica":"Experiencia Laboral: "+this.job['experiencia_laboral'],
      "Cantidad: "+this.job['cantidad']

    ];
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        padding: EdgeInsets.fromLTRB(5.0, 15.0, 10.0, 0.0),
        itemCount: entradas.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 30,
            child: Text('* ${entradas[index]}'),
          );
        },
      ),
    );
  }
}
