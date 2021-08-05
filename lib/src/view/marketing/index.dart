import 'package:flutter/material.dart';
import 'package:flutter_rms_app/src/model/global/page/marketing.dart';

import 'package:provider/provider.dart';

import 'component/add.dart';
import 'component/list.dart';

class MarketingIndex extends StatefulWidget {
  const MarketingIndex({Key key}) : super(key: key);

  @override
  State<MarketingIndex> createState() => _MarketingIndexState();
}

class _MarketingIndexState extends State<MarketingIndex> {
  List<Widget> listPage = [const MarketingList(), const MarketingAdd()];

  @override
  Widget build(BuildContext context) => Consumer<MarketingModel>(
        builder: (context, value, child) {
          return listPage[value.init];
        },
      );
}
