import 'package:flutter/material.dart';
import 'package:flutter_rms_app/src/controller/loading.dart';
import 'package:flutter_rms_app/src/utils/config/color.dart';
import 'package:flutter_rms_app/src/utils/config/fontsize.dart';
import 'package:flutter_rms_app/src/utils/config/images.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key key, this.controller}) : super(key: key);
  final LoadingController controller;
  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  Widget child() => Material(
        child: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [colorBackgroundLiner, colorBackgroundMain],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(),
              Image.asset(
                iconLinkLoading,
                width: 86,
                height: 86,
              ),
              Text('Xin chờ đợi trong giây lát',
                  style: GoogleFonts.roboto(
                      fontSize: fontTitle,
                      letterSpacing: 1.25,
                      fontWeight: FontWeight.w500,
                      color: Colors.white))
            ],
          ),
        ),
      );

  @override
  void initState() {
    super.initState();
    widget.controller.loading;
  }

  @override
  Widget build(BuildContext context) => child();
}
