import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class dialog {
  static showPopup(BuildContext context, Widget title, Widget text,
      Function exit, Function press) {
    return showDialog(
        context: context,
        builder: (context) => CupertinoAlertDialog(
              title: title,
              content: text,
              actions: [
                CupertinoActionSheetAction(
                    onPressed: exit, child: const Text('Thoát Ra')),
                CupertinoActionSheetAction(
                    onPressed: press, child: const Text('Tiếp tục'))
              ],
            ));
  }
}
