import 'package:flutter/material.dart';
import 'package:flutter_rms_app/src/controller/account.dart';
import 'package:flutter_rms_app/src/controller/bu.dart';
import 'package:flutter_rms_app/src/controller/hr.dart';
import 'package:flutter_rms_app/src/controller/interview.dart';
import 'package:flutter_rms_app/src/controller/marketing.dart';
import 'package:flutter_rms_app/src/controller/loading.dart';
import 'package:flutter_rms_app/src/utils/config/color.dart';
import 'package:flutter_rms_app/src/utils/config/fontsize.dart';
import 'package:flutter_rms_app/src/utils/config/images.dart';
import 'package:flutter_rms_app/src/view/splash/index.dart';
import 'package:google_fonts/google_fonts.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key key}) : super(key: key);

  Widget child(String title, String pos, String icon, Function press) =>
      GestureDetector(
        onTap: () {
          press();
        },
        child: Container(
          height: 200,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: paddingHor),
          decoration: BoxDecoration(
              color: colorBody,
              borderRadius: BorderRadius.circular(radiuscard),
              boxShadow: [
                BoxShadow(
                    offset: const Offset(0, 3),
                    blurRadius: 7,
                    color: Colors.black.withOpacity(0.3))
              ]),
          child: Stack(
            children: [
              Positioned(
                  bottom: 0,
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Image.asset(icon)),
              Positioned(
                bottom: paddingVer,
                left: 0,
                right: 0,
                child: Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: paddingHor, vertical: paddingVer),
                    decoration:
                        BoxDecoration(color: colorBackgroundMain, boxShadow: [
                      BoxShadow(
                          offset: const Offset(3, 3),
                          blurRadius: 7,
                          color: Colors.black.withOpacity(0.1)),
                      BoxShadow(
                          offset: const Offset(-3, -3),
                          blurRadius: 7,
                          color: Colors.black.withOpacity(0.1))
                    ]),
                    child: SizedBox(
                      width: 200,
                      child: Center(
                        child: Text(title,
                            style: GoogleFonts.roboto(
                                textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: fontText,
                                    fontWeight: FontWeight.w500))),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                child: Container(
                  color: colorBackgroundMain,
                  padding: const EdgeInsets.symmetric(
                      horizontal: paddingHor / 2, vertical: paddingVer / 2),
                  child: Center(
                    child: Text(pos,
                        style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                                color: Colors.white,
                                fontSize: fontText,
                                fontWeight: FontWeight.w700))),
                  ),
                ),
              )
            ],
          ),
        ),
      );

  void buPress(BuildContext context) {
    BUController _buController = BUController(context: context);
    LoadingController _controller = LoadingController(context: context);
    _controller.loading = _buController.getData();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SplashPage(
                  controller: _controller,
                )));
  }

  void marketingPress(BuildContext context) {
    MarketingController _marController = MarketingController(context: context);
    LoadingController _controller = LoadingController(context: context);
    _controller.loading = _marController.getData();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SplashPage(
                  controller: _controller,
                )));
  }

  void hrPress(BuildContext context) {
    HRController _marController = HRController(context: context);
    LoadingController _controller = LoadingController(context: context);
    _controller.loading = _marController.getData();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SplashPage(
                  controller: _controller,
                )));
  }

  void interViewPress(BuildContext context) {
    InterViewController _interViewController =
        InterViewController(context: context);
    LoadingController _controller = LoadingController(context: context);
    _controller.loading = _interViewController.getData();
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SplashPage(
                  controller: _controller,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(
            height: paddingVer,
          ),
          child('Yêu cầu tuyển dụng', 'BU', imgLinkBU, () {
            buPress(context);
          }),
          const SizedBox(
            height: paddingVer,
          ),
          child('Bài viết tuyển dụng', 'Marketing', imgLinkMarketing, () {
            marketingPress(context);
          }),
          const SizedBox(
            height: paddingVer,
          ),
          child('Thông tin ứng viên', 'HR', imgLinkHR, () {
            hrPress(context);
          }),
          const SizedBox(
            height: paddingVer,
          ),
          child('Phỏng vấn tuyển dụng', 'InterView', imgLinkInterView, () {
            interViewPress(context);
          }),
        ],
      ),
    );
  }
}
