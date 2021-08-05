import 'package:flutter/material.dart';
import 'package:flutter_rms_app/src/model/global/page/hr.dart';
import 'package:flutter_rms_app/src/view/interview/component/add.dart';
import 'package:flutter_rms_app/src/view/interview/component/detail.dart';
import 'package:flutter_rms_app/src/view/interview/component/list.dart';
import 'package:provider/provider.dart';

class InterViewPage extends StatefulWidget {
  const InterViewPage({Key key}) : super(key: key);

  @override
  State<InterViewPage> createState() => _InterViewPageState();
}

class _InterViewPageState extends State<InterViewPage> {
  List<Widget> listPage = [
    const InterViewList(),
    const InterViewAdd(),
    const InterViewDetail()
  ];

  @override
  Widget build(BuildContext context) => Consumer<HRModel>(
        builder: (context, value, child) {
          return listPage[value.init];
        },
      );
}
