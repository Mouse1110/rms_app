import 'package:flutter/material.dart';
import 'package:flutter_rms_app/src/model/global/page/hr.dart';

import 'package:flutter_rms_app/src/view/hr/component/list.dart';
import 'package:provider/provider.dart';
import 'component/add.dart';
import 'component/detail.dart';
import 'component/info.dart';

class HRPage extends StatefulWidget {
  const HRPage({Key key}) : super(key: key);

  @override
  State<HRPage> createState() => _HRPageState();
}

class _HRPageState extends State<HRPage> {
  List<Widget> listPage = [
    const HRAdd(),
    const HRDetail(),
    const HRList(),
    const HRAddInf()
  ];
  @override
  Widget build(BuildContext context) => Consumer<HRModel>(
        builder: (context, value, child) {
          return listPage[value.init];
        },
      );
}
