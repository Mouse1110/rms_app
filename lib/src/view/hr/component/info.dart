import 'package:flutter/material.dart';
import 'package:flutter_rms_app/src/controller/hr.dart';
import 'package:flutter_rms_app/src/utils/config/color.dart';
import 'package:flutter_rms_app/src/utils/config/fontsize.dart';
import 'package:flutter_rms_app/src/view/component/buttonsave.dart';
import 'package:flutter_rms_app/src/view/component/textinput.dart';
import 'package:google_fonts/google_fonts.dart';

class HRAddInf extends StatefulWidget {
  const HRAddInf({Key key}) : super(key: key);

  @override
  State<HRAddInf> createState() => _HRAddInfState();
}

class _HRAddInfState extends State<HRAddInf> {
  TextEditingController thongTin;
  TextEditingController date;
  HRController _controller;
  Widget scaffold() => Padding(
        padding: const EdgeInsets.all(paddingHor),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                const SizedBox(
                  height: paddingHor,
                ),
                Row(
                  children: [
                    GestureDetector(
                        onTap: () {
                          _controller.moveListPage();
                        },
                        child: const Icon(Icons.arrow_back)),
                    const SizedBox(
                      width: paddingVer,
                    ),
                    Text('Thêm thông tin',
                        style: GoogleFonts.roboto(
                            fontSize: fontTitle,
                            color: colorBackgroundMain,
                            fontWeight: FontWeight.w700)),
                  ],
                ),
                const SizedBox(height: paddingHor),
                TextInput(
                  label: 'Thông tin Phỏng vấn',
                  controller: thongTin,
                ),
                const SizedBox(height: paddingHor),
                TextInput(
                  label: 'Ngày phỏng vấn',
                  controller: date,
                  maxLine: 20,
                ),
              ],
            ),
            ButtonSave(
              press: () {},
            )
          ],
        ),
      );
  Widget designBackground() => Container(
        width: 300,
        height: 300,
        decoration: const BoxDecoration(
            color: colorLinerAdd,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(color: colorShadow, offset: Offset(3, 3), blurRadius: 7)
            ]),
      );
  Widget colorBackground() => Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.white, colorLinerAdd],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
      );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = HRController(context: context);
  }

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Positioned(
              left: -0, top: 0, bottom: 0, right: 0, child: colorBackground()),
          Positioned(left: -150, top: -150, child: designBackground()),
          scaffold(),
        ],
      );
}
