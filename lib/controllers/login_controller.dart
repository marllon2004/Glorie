import 'package:flutter/cupertino.dart';
import 'package:glorie_lores/services/prefs_service.dart';

class LoginController {

  ValueNotifier<bool> inLoader = ValueNotifier<bool>(false);

  String? _login;
  setLogin(String value) => _login = value;

  String? _pass;
  setPass(String value) => _pass = value;

  Future auth() async{
    inLoader.value = true;
    await Future.delayed(Duration(seconds: 2));
    inLoader.value = false;

    if(_login == 'admin' && _pass == '123'){
      PrefsService.save(_login!);
      return true;
    }

    return false;
  }
}