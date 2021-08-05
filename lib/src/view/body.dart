import 'package:flutter/material.dart';

import 'package:flutter_rms_app/src/controller/bu.dart';
import 'package:flutter_rms_app/src/controller/hr.dart';
import 'package:flutter_rms_app/src/controller/interview.dart';
import 'package:flutter_rms_app/src/model/global/index.dart';
import 'package:flutter_rms_app/src/model/global/page/bu.dart';
import 'package:flutter_rms_app/src/model/global/page/hr.dart';
import 'package:flutter_rms_app/src/model/global/page/interview.dart';
import 'package:flutter_rms_app/src/utils/config/color.dart';
import 'package:flutter_rms_app/src/utils/config/fontsize.dart';
import 'package:flutter_rms_app/src/utils/config/widget.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  double _height = 0;
  Color _background = Colors.white;
  Color _colorText = Colors.black;
  BUController _buController;
  HRController _hrController;
  InterViewController _interViewController;

  BUModel buModel;
  HRModel hrModel;
  InterViewModel interViewModel;
  IndexModel indexModel;
  Widget scaffold(
    Widget child,
    int initType,
    int initPage,
  ) =>
      SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              Positioned(
                top: 0,
                right: 0,
                left: 0,
                bottom: 0,
                child: AnimatedContainer(
                  padding: const EdgeInsets.symmetric(
                      horizontal: paddingHor, vertical: paddingVer),
                  duration: const Duration(milliseconds: 1000),
                  curve: Curves.fastLinearToSlowEaseIn,
                  color: _background,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      initType != 0
                          ? GestureDetector(
                              onTap: () {
                                if (initPage == 1) {
                                  if (buModel.init > 0) {
                                    _buController.moveListPage();
                                  } else {
                                    indexModel.setInitPage(0);
                                    indexModel.setInitType(0);
                                  }
                                } else if (initPage == 2) {
                                  indexModel.setInitPage(0);
                                  indexModel.setInitType(0);
                                } else if (initPage == 3) {
                                  if (hrModel.init > 0) {
                                    _hrController.moveAddPage();
                                  }
                                } else if (initPage == 4) {
                                  if (interViewModel.init > 0) {
                                    _interViewController.moveListPage();
                                  } else {
                                    indexModel.setInitPage(0);
                                    indexModel.setInitType(0);
                                  }
                                }
                              },
                              child: Icon(
                                Icons.arrow_back,
                                color: _colorText,
                              ),
                            )
                          : const SizedBox(),
                      initType == 0
                          ? Text('Tuyển Dụng',
                              style: GoogleFonts.roboto(
                                  textStyle: TextStyle(
                                      color: _colorText,
                                      fontWeight: FontWeight.w700,
                                      fontSize: fontTitle)))
                          : const SizedBox(),
                      initType == 0
                          ? const SizedBox()
                          : Consumer<IndexModel>(
                              builder: (context, value, child) => Text(
                                  value.title,
                                  style: GoogleFonts.roboto(
                                      textStyle: TextStyle(
                                          color: _colorText,
                                          fontWeight: FontWeight.w700,
                                          fontSize: fontTitle))),
                            ),
                    ],
                  ),
                ),
              ),
              Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.fastLinearToSlowEaseIn,
                    height: _height,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(radiusContainer),
                            topRight: Radius.circular(radiusContainer))),
                    child: child,
                  ))
            ],
          ),
        ),
      );

  void setHeightAminited(double height, int type) {
    switch (type) {
      case 0:
        _height = height * 0.85;
        _background = Colors.white;
        _colorText = Colors.black;
        break;
      case 1:
        _height = height * 0.7;
        _background = colorBackgroundMain;
        _colorText = Colors.white;

        break;
      case 2:
        _height = height * 0.85;
        _background = colorBackgroundMain;
        _colorText = Colors.white;
        break;
      case 3:
        _height = height;
        _background = Colors.white;
        _colorText = Colors.black;
        break;
    }
  }

  @override
  void initState() {
    super.initState();
    _buController = BUController(context: context);
    _hrController = HRController(context: context);
    _interViewController = InterViewController(context: context);
    buModel = Provider.of<BUModel>(context, listen: false);
    hrModel = Provider.of<HRModel>(context, listen: false);
    indexModel = Provider.of<IndexModel>(context, listen: false);
    interViewModel = Provider.of<InterViewModel>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Consumer<IndexModel>(
      builder: (context, value, child) {
        setHeightAminited(height, value.initType);
        return scaffold(
            Config.listPage[value.initPage], value.initType, value.initPage);
        // return scaffold(
        //     const InterViewDetail(), value.initType, value.initPage);
      },
    );
  }
}
