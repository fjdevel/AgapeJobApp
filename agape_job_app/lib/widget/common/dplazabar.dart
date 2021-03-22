import 'package:agape_job_app/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DPlazaBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  DPlazaBar()
    : preferredSize = Size.fromHeight(60.0);
  Widget build(BuildContext context) {
    return AppBar(
      leading: BackButton(color: Colors.white,),
      title: Text("Nombre Empresa", style: TextStyle(fontSize: 16),),
      centerTitle: true,
      backgroundColor: dPrimaryColor,
      elevation: 0.0,
      bottomOpacity: 0.0,
      automaticallyImplyLeading: true,
      iconTheme: IconThemeData(color: Colors.black),
    );
  }
}
