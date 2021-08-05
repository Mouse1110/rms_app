import 'package:flutter/material.dart';
import 'package:flutter_rms_app/src/model/global/index.dart';
import 'package:flutter_rms_app/src/model/global/page/bu.dart';
import 'package:flutter_rms_app/src/model/global/page/hr.dart';
import 'package:flutter_rms_app/src/model/global/page/interview.dart';
import 'package:flutter_rms_app/src/model/global/page/marketing.dart';
import 'package:flutter_rms_app/src/utils/config/widget.dart';
import 'package:flutter_rms_app/src/view/intro/index.dart';
import 'package:provider/provider.dart';

import 'utils/file/file.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool check = true;
  @override
  void initState() {
    super.initState();
    getFile().then((value) {
      setState(() {
        check = value;
      });
    });
  }

  Future<bool> getFile() async {
    String data = await FileConfig.readFromFile();
    if (data == '') {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'RMS',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: check ? const IntroScreen() : const HomeScreen());
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => IndexModel()),
            ChangeNotifierProvider(create: (_) => BUModel()),
            ChangeNotifierProvider(create: (_) => MarketingModel()),
            ChangeNotifierProvider(create: (_) => HRModel()),
            ChangeNotifierProvider(create: (_) => InterViewModel()),
          ],
          child: Consumer<IndexModel>(
            builder: (context, value, child) {
              return Config.listScreen[value.initScreen];
            },
          ));
}
