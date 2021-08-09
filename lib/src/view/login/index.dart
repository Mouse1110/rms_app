import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_rms_app/src/controller/loading.dart';
import 'package:flutter_rms_app/src/controller/login.dart';
import 'package:flutter_rms_app/src/model/global/index.dart';

import 'package:flutter_rms_app/src/utils/config/color.dart';
import 'package:flutter_rms_app/src/utils/config/fontsize.dart';
import 'package:flutter_rms_app/src/utils/config/images.dart';

import 'package:flutter_rms_app/src/view/splash/index.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  LoginController _controller;
  Widget button(
          String icon, String title, BuildContext context, Function press) =>
      GestureDetector(
        onTap: press,
        child: Container(
          width: 250,
          height: 50,
          padding: const EdgeInsets.symmetric(horizontal: paddingHor / 2),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radiuscard),
              border: Border.all(color: Colors.red, width: 2)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset(
                icon,
                width: 26,
                height: 26,
              ),
              Text(title,
                  style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                          fontSize: fontText, fontWeight: FontWeight.w700)))
            ],
          ),
        ),
      );

  Widget scaffold(BuildContext context) => Material(
        child: SizedBox(
          child: Stack(
            children: [
              Positioned(
                  bottom: -100,
                  right: -100,
                  child: Container(
                    height: 350,
                    width: 350,
                    decoration: const BoxDecoration(
                        color: colorBackgroundLiner, shape: BoxShape.circle),
                  )),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    height: 150,
                    width: 150,
                    decoration: const BoxDecoration(
                        gradient: RadialGradient(radius: 0.8, colors: [
                          colorBackgroundLiner,
                          colorBackgroundMain
                        ]),
                        color: colorBackgroundMain,
                        shape: BoxShape.circle),
                  )),
              Positioned(
                  left: -100,
                  top: 0,
                  bottom: 0,
                  child: Center(
                    child: Container(
                      height: 200,
                      width: 200,
                      decoration: const BoxDecoration(
                          gradient: RadialGradient(radius: 0.8, colors: [
                            colorBackgroundMain,
                            colorBackgroundLiner
                          ]),
                          shape: BoxShape.circle),
                    ),
                  )),
              Positioned(
                  right: 0,
                  top: 0,
                  child: Center(
                    child: Container(
                      height: 150,
                      width: 150,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 20),
                      decoration: const BoxDecoration(
                          gradient: RadialGradient(radius: 0.8, colors: [
                            colorBackgroundLiner,
                            colorBackgroundMain
                          ]),
                          shape: BoxShape.circle),
                    ),
                  )),
              Positioned(
                  bottom: 0,
                  top: 0,
                  left: 0,
                  right: 0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Đăng Nhập',
                          style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                                  color: colorBackgroundMain,
                                  fontSize: fontTitleLogin,
                                  fontWeight: FontWeight.w700))),
                      button(iconGmail, 'Đăng nhập với Gmail', context, () {
                        login(context);
                      })
                    ],
                  ))
            ],
          ),
        ),
      );

  void login(BuildContext context) {
    LoadingController _loadingcontroller;
    _controller.signIn().then((value) => {
          _loadingcontroller = LoadingController(
              context: context, loading: _controller.loading(value)),
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => SplashPage(
                        controller: _loadingcontroller,
                      )))
        });
    ;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = LoginController(context: context);
  }

  @override
  Widget build(BuildContext context) => scaffold(context);
}
