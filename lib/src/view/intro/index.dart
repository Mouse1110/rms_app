import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rms_app/src/app.dart';
import 'package:flutter_rms_app/src/utils/config/color.dart';
import 'package:flutter_rms_app/src/utils/config/fontsize.dart';
import 'package:flutter_rms_app/src/utils/config/shadow.dart';
import 'package:flutter_rms_app/src/utils/file/file.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key key}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  double rating = 0;
  double posleft = 0;
  double posBottom = 0;
  List<Widget> screen;
  Widget screen3() => Container(
        padding: const EdgeInsets.symmetric(
            vertical: paddingHor, horizontal: paddingHor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text('Bạn đã sẵn sàng để tiếp tục với chúng tôi',
                textAlign: TextAlign.center,
                style: GoogleFonts.roboto(
                  fontSize: fontTitle,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                )),
          ],
        ),
      );
  Widget screen2() => Container(
        padding: const EdgeInsets.symmetric(vertical: paddingHor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('RMS',
                style: GoogleFonts.roboto(
                  fontSize: fontTitle,
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                )),
            const SizedBox(
              height: paddingHor,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: paddingHor),
              child: Text(
                  'Mô hình giúp bạn quản lý 1 cách dễ dàng trong quá trình tuyển dụng',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                    fontSize: fontTitle,
                    color: Colors.white,
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.w300,
                  )),
            ),
          ],
        ),
      );

  Widget screen1() => Container(
        padding: const EdgeInsets.symmetric(vertical: paddingHor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text('Chào bạn',
                    style: GoogleFonts.roboto(
                      fontSize: fontTitle,
                      color: colorBackgroundMain,
                      fontWeight: FontWeight.w700,
                    )),
                const SizedBox(
                  height: paddingHor,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: paddingHor),
                  child: Text('Cảm ơn bạn đã tham gia với chúng tôi',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.roboto(
                        fontSize: fontTitle,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.w300,
                      )),
                ),
              ],
            ),
            Image.asset('assets/images/manager.png'),
            const SizedBox(),
          ],
        ),
      );

  Widget circle(Size size) => Container(
        width: size.width - paddingHor * 2,
        height: size.width - paddingHor * 2,
        decoration: const BoxDecoration(
            color: colorBackgroundMain, shape: BoxShape.circle),
      );

  Widget canvas(Size size) => Container(
        margin: const EdgeInsets.all(paddingHor),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(radiuscard),
            boxShadow: shadowContainerShow),
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 2000),
              curve: Curves.fastLinearToSlowEaseIn,
              top: 0,
              left: posleft,
              bottom: posBottom,
              child: circle(size),
            ),
            Positioned(
                top: 0,
                left: 0,
                right: 0,
                bottom: 0,
                child: screen[rating.toInt()]),
          ],
        ),
      );

  Widget bottom(BuildContext context) => Container(
      height: 50,
      margin: const EdgeInsets.only(bottom: paddingVer, right: paddingHor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Slider(
            value: rating,
            inactiveColor: Colors.white,
            onChanged: (newRating) {
              setState(() {
                rating = newRating;
              });
            },
            divisions: 2,
            min: 0,
            max: 2,
            label: '$rating',
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                if (rating < 2) {
                  rating++;
                } else {
                  FileConfig.saveToFile('true');
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const HomeScreen()));
                }
              });
            },
            child: Container(
              width: 120,
              height: 40,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: shadowCard),
              child: Center(
                child: Text(rating < 2 ? 'Tiếp tục' : 'Bắt đầu',
                    style: GoogleFonts.roboto(
                        color: rating < 2 ? Colors.black : colorBackgroundMain,
                        fontSize: fontText,
                        fontWeight: FontWeight.w700)),
              ),
            ),
          ),
        ],
      ));

  Widget scaffold(Size size, BuildContext context) => SafeArea(
        child: Scaffold(
          body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [colorBackgroundLiner, colorBackgroundMain],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter)),
            child: Column(
              children: [
                Expanded(child: canvas(size)),
                bottom(context),
              ],
            ),
          ),
        ),
      );

  @override
  void initState() {
    super.initState();
    screen = [screen1(), screen2(), screen3()];
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (rating == 0) {
      posleft = -500;
      posBottom = 0;
    } else if (rating == 1) {
      posleft = 0;
      posBottom = 0;
    } else {
      posBottom = -size.width * 1.4;
      posleft = 0;
    }
    return scaffold(size, context);
  }
}
