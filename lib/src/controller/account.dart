import 'package:flutter/cupertino.dart';
import 'package:flutter_rms_app/src/model/global/index.dart';
import 'package:flutter_rms_app/src/model/global/page/account.dart';
import 'package:flutter_rms_app/src/utils/google_sign_in/index.dart';
import 'package:provider/provider.dart';

// CONTROLLER ============================
class AccountController {
  final BuildContext context;
  IndexModel indexModel;
  AccountModel accountModel;
  AccountController({this.context}) {
    indexModel = Provider.of<IndexModel>(context, listen: false);
  }

  void logout() {
    GoogleSignInApi.signOut().then((value) => {
          indexModel.setInitScreen(0),
          indexModel.setInitPage(0),
          indexModel.setInitType(0),
        });
  }
}
