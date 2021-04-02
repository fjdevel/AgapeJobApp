import 'package:agape_job_app/util/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DPlazaBar extends StatelessWidget implements PreferredSizeWidget {
  String title;
  @override
  final Size preferredSize;
  DPlazaBar(this.title)
    : preferredSize = Size.fromHeight(60.0);
  Widget build(BuildContext context) {
    return AppBar(
      leading: BackButton(color: Colors.white,),
      title: Text(title, style: TextStyle(fontSize: 16),),
      centerTitle: true,
      backgroundColor: dPrimaryColor,
      elevation: 0.0,
      bottomOpacity: 0.0,
      automaticallyImplyLeading: true,
      iconTheme: IconThemeData(color: Colors.black),
    );
  }
}
