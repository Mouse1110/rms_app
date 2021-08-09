import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rms_app/src/model/global/index.dart';
import 'package:flutter_rms_app/src/model/global/page/account.dart';
import 'package:flutter_rms_app/src/utils/google_sign_in/index.dart';
import 'package:flutter_rms_app/src/utils/sheetapi/index.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class LoginController {
  final BuildContext context;
  IndexModel indexModel;
  AccountModel accountModel;
  LoginController({this.context}) {
    indexModel = Provider.of<IndexModel>(context, listen: false);
    accountModel = Provider.of<AccountModel>(context, listen: false);
  }

  Future loading(GoogleSignInAccount user) async {
    SheetAPI.initLog('Log', '1etboCaER1GIv7NspMCpuIWviFxuYbFWFNGNXQizfHS8')
        .then((value) => SheetAPI.getAllRow()
            .then((value) => logEmail(value, user).then((value) {
                  if (user == null) Navigator.pop(context);
                  accountModel.setUser(user);
                  indexModel.setInitScreen(1);
                  Navigator.pop(context);
                })));
  }

  Future logEmail(dynamic value, GoogleSignInAccount user) async {
    dynamic log = {'gmail': user.email, 'name': user.displayName};
    if (value == null) {
      SheetAPI.initLog('Log', '1etboCaER1GIv7NspMCpuIWviFxuYbFWFNGNXQizfHS8')
          .then((value) => SheetAPI.insert([log]));
    } else {
      SheetAPI.initLog('Log', '1etboCaER1GIv7NspMCpuIWviFxuYbFWFNGNXQizfHS8')
          .then((value) => SheetAPI.getAllRow()
              .then((value) => check(value, user).then((value) {
                    if (value) {
                      SheetAPI.initLog('Log',
                              '1etboCaER1GIv7NspMCpuIWviFxuYbFWFNGNXQizfHS8')
                          .then((value) => SheetAPI.insert([log]));
                    }
                  })));
    }
  }

  Future<bool> check(dynamic value, GoogleSignInAccount user) async {
    int index =
        (value as List).indexWhere((element) => element['gmail'] == user.email);
    if (index > -1) {
      return false;
    } else {
      return true;
    }
  }

  Future<GoogleSignInAccount> signIn() async {
    return await GoogleSignInApi.login();
  }
}
