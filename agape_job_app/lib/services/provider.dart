import 'package:flutter/material.dart';

class Proveedor with ChangeNotifier{
  String _usr="";
  String get usr =>_usr;
  set usr(String value){
    _usr = value;
    notifyListeners();
  }
}