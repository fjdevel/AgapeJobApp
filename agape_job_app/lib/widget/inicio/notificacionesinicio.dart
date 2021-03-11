import 'package:flutter/material.dart';
class NotificacionesInicio extends StatefulWidget {
  @override
  _NotificacionesInicioState createState() => _NotificacionesInicioState();
}

class _NotificacionesInicioState extends State<NotificacionesInicio> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text("Tienes 2 notificaciónes nuevas",style: TextStyle(color: Colors.red,fontSize: 18),),
      ),
    );
  }
}
