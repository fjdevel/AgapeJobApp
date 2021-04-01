import 'package:flutter/material.dart';

class Proveedor with ChangeNotifier{
  String _usr="",_EMAIL="",_PASS="";
  String get usr =>_usr;
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