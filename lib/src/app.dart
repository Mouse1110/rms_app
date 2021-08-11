import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_rms_app/src/controller/account.dart';
import 'package:flutter_rms_app/src/controller/loading.dart';
import 'package:flutter_rms_app/src/controller/login.dart';
import 'package:flutter_rms_app/src/model/global/index.dart';
import 'package:flutter_rms_app/src/model/global/page/account.dart';
import 'package:flutter_rms_app/src/model/global/page/bu.dart';
import 'package:flutter_rms_app/src/model/global/page/hr.dart';
import 'package:flutter_rms_app/src/model/global/page/interview.dart';
import 'package:flutter_rms_app/src/model/global/page/marketing.dart';
import 'package:flutter_rms_app/src/utils/config/fontsize.dart';
import 'package:flutter_rms_app/src/utils/config/widget.dart';
import 'package:flutter_rms_app/src/view/body.dart';
import 'package:flutter_rms_app/src/view/intro/index.dart';
import 'package:flutter_rms_app/src/view/splash/index.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
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
    if (kIsWeb) {
      check = false;
    } else {
      getFile().then((value) {
        setState(() {
          check = value;
        });
      });
    }
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
        home: check ? const IntroScreen() : const LayoutScreen());
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) => MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => IndexModel()),
            ChangeNotifierProvider(create: (_) => BUModel()),
            ChangeNotifierProvider(create: (_) => MarketingModel()),
            ChangeNotifierProvider(create: (_) => HRModel()),
            ChangeNotifierProvider(create: (_) => InterViewModel()),
            ChangeNotifierProvider(create: (_) => AccountModel()),
          ],
          child: Consumer<IndexModel>(
            builder: (context, value, child) {
              return kIsWeb ? HomeView() : Config.listScreen[value.initScreen];
            },
          ));
}

class LayoutScreen extends StatefulWidget {
  const LayoutScreen({Key key}) : super(key: key);

  @override
  State<LayoutScreen> createState() => _LayoutScreenState();
}

class _LayoutScreenState extends State<LayoutScreen> {
  @override
  Widget build(BuildContext context) =>
      LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          return Scaffold(
            body: Center(
                child:
                    Text('Hiện tại ứng dụng chỉ hỗ trợ màn hình (width: <600)',
                        style: GoogleFonts.roboto(
                          fontSize: fontTitle,
                          fontWeight: FontWeight.w700,
                        ))),
          );
        } else {
          return HomeScreen();
        }
      });
}
