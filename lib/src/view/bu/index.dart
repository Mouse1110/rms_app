import 'package:flutter/material.dart';
import 'package:flutter_rms_app/src/model/global/page/bu.dart';
import 'package:flutter_rms_app/src/view/bu/component/add.dart';
import 'package:flutter_rms_app/src/view/bu/component/detail.dart';
import 'package:flutter_rms_app/src/view/bu/component/list.dart';

import 'package:provider/provider.dart';

class BUPage extends StatefulWidget {
  const BUPage({Key key}) : super(key: key);

  @override
  State<BUPage> createState() => _BUPageState();
}

class _BUPageState extends State<BUPage> {
  List<Widget> listPage = [BUList(), const BUDetail(), const BUAdd()];

  @override
  Widget build(BuildContext context) {
    return Consumer<BUModel>(
      builder: (context, value, child) {
        return listPage[value.init];
      },
    );
  }
}
