import 'package:agape_job_app/services/provider.dart';
import 'package:agape_job_app/util/colors.dart';
import 'package:agape_job_app/util/globals.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

class AplicarButton extends StatefulWidget {
  String id;

  AplicarButton(this.id);

  @override
  _AplilcarButtonState createState() => _AplilcarButtonState(this.id);
}

class _AplilcarButtonState extends State<AplicarButton> {
  String _id;

  _AplilcarButtonState(this._id);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      padding: EdgeInsets.symmetric(vertical: 20),
      width: MediaQuery.of(context).size.width * 0.85,
      child: RaisedButton(
        onPressed: ()async {
          var prov = Provider.of<Proveedor>(this.context,listen: false);
          var url = Uri.http(dominio.toString(),'/jeo/servicios/prc_aplicacion.php',
              {
                'accion': 'I',
                'idEstudiante':prov.idEstudiante,
                'idPlaza':this._id,
                'user':prov.usr

              });
          var response = await http.get(url);
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Ha aplicado a una plaza correctamente")));
          Navigator.of(context).pop();
        },
        padding: EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)
        ),
        color: dPrimaryColor,
        child: Text(
          'Aplicar Ahora',
          style: TextStyle(
              color: dSecundaryColor,
              fontSize: 18,
              fontWeight: FontWeight.w300
          ),
        ),
      ),
    );
  }
}