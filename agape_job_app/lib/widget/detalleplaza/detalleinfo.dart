import 'package:agape_job_app/util/colors.dart';
import 'package:agape_job_app/widget/detalleplaza/detallelista.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DetalleInfo extends StatefulWidget {
  dynamic job;


  DetalleInfo(this.job);

  @override
  _DetalleInfoState createState() => _DetalleInfoState(this.job);
}

class _DetalleInfoState extends State<DetalleInfo> {
  dynamic _job;


  _DetalleInfoState(this._job);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 0.0),
              child: Center(
                child: Row(
                  children: <Widget>[
                    MaterialButton(
                      color: dPrimaryColor,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                      elevation: 0.0,
                      minWidth: 110,
                      height: 50,
                      child: Text("Descripción",
                          style: TextStyle(color: Colors.white)),
                      onPressed: () => null,),
                    Container(
                      padding: EdgeInsets.only(left: 10.0),
                      child: MaterialButton(
                        color: dPrimaryColor,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                        elevation: 0.0,
                        minWidth: 110,
                        height: 50,
                        child: Text(_job['ctgEmpresa']['razon_social'],
                            style: TextStyle(color: Colors.white)),
                        onPressed: () => null,),
                    ),
                    // Container(
                    //   padding: EdgeInsets.only(left: 10.0),
                    //   child: MaterialButton(
                    //     color: dPrimaryColor,
                    //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10.0))),
                    //     elevation: 0.0,
                    //     minWidth: 110,
                    //     height: 50,
                    //     child: Text("Reseñas",
                    //         style: TextStyle(color: Colors.white)),
                    //     onPressed: () => null,),
                    // )
                  ],
                ),
              ),
            ),
        Container(
          margin: EdgeInsets.only(top: 30.0),
          padding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
          height: 200.0,
          width: MediaQuery.of(context).size.width * 0.90,
          decoration: BoxDecoration(color: dSecundaryColor,
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
          child: Column(
            children: <Widget>[
              Text("Requerimientos", textAlign: TextAlign.right,
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              DetalleLista(_job)
            ],
          ),
        )
          ],
        );
  }
}
