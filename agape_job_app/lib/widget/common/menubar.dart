import 'package:agape_job_app/util/colors.dart';
import 'package:flutter/material.dart';

class MenuBar extends StatelessWidget implements PreferredSizeWidget{
  final String title;
  @override
  final Size preferredSize;

  MenuBar({@required this.title})
      : preferredSize = Size.fromHeight(60.0);
  @override
  Widget build(BuildContext context) {
    return AppBar(title: Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        IconButton(icon: Icon(Icons.search,color: Colors.black,)),
        IconButton(icon:Icon(Icons.tune,color: Colors.black,))
      ],
    )
      ,backgroundColor: dSecundaryColor  ,
      elevation: 0.0,
      bottomOpacity: 0.0,
      automaticallyImplyLeading: true,
      iconTheme: IconThemeData(color: Colors.black),

    );
  }
}
