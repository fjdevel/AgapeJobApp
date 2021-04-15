import 'package:flutter/material.dart';

class Proveedor with ChangeNotifier{
  String _usr="",_EMAIL="",_PASS="",_idEstudiante="";
  String get usr =>_usr;
  String get idEstudiante =>_idEstudiante;

  set idEstudiante(String value){
    _idEstudiante = value;
    notifyListeners();
  }


  set usr(String value){
    _usr = value;
    notifyListeners();
  }
  String get EMAIL =>_EMAIL;
  set EMAIL(String value){
    _EMAIL = value;
    notifyListeners();
  }
  setEmail(String value){
    _EMAIL = value;
    notifyListeners();
  }
  String get PASS =>_PASS;
  set PASS(String value){
    _usr = value;
    notifyListeners();
  }
  setPass(String value){
    _PASS = value;
    notifyListeners();
  }

}