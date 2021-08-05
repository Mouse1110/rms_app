import 'package:flutter/cupertino.dart';
import 'package:flutter_rms_app/src/view/body.dart';
import 'package:flutter_rms_app/src/view/bu/index.dart';
import 'package:flutter_rms_app/src/view/dashboard/index.dart';
import 'package:flutter_rms_app/src/view/hr/index.dart';
import 'package:flutter_rms_app/src/view/interview/index.dart';
import 'package:flutter_rms_app/src/view/login/index.dart';
import 'package:flutter_rms_app/src/view/marketing/index.dart';

class Config {
  static List<Widget> listScreen = [
    const Login(),
    const HomeView(),
  ];
  static List<Widget> listPage = [
    const Dashboard(),
    const BUPage(),
    const MarketingIndex(),
    const HRPage(),
    const InterViewPage()
  ];
}
