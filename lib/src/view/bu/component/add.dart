import 'package:flutter/material.dart';
import 'package:flutter_rms_app/src/controller/bu.dart';
import 'package:flutter_rms_app/src/controller/loading.dart';
import 'package:flutter_rms_app/src/model/OTD/bu.dart';
import 'package:flutter_rms_app/src/utils/config/color.dart';
import 'package:flutter_rms_app/src/utils/config/fontsize.dart';
import 'package:flutter_rms_app/src/view/component/buttonsave.dart';
import 'package:flutter_rms_app/src/view/component/textinput.dart';
import 'package:flutter_rms_app/src/view/splash/index.dart';
import 'package:google_fonts/google_fonts.dart';

class BUAdd extends StatefulWidget {
  const BUAdd({Key key}) : super(key: key);

  @override
  State<BUAdd> createState() => _BUAddState();
}

class _BUAddState extends State<BUAdd> {
  TextEditingController _pbController;
  TextEditingController _vtController;
  TextEditingController _tcController;
  TextEditingController _soLuocController;
  BUController _controller;
  Widget listInput() => SingleChildScrollView(
        child: Column(
          children: [
            TextInput(
              controller: _pbController,
              label: 'Phòng ban yêu cầu',
              maxLine: 30,
            ),
            const SizedBox(
              height: paddingHor,
            ),
            TextInput(
              controller: _vtController,
              label: 'Vị trí',
              maxLine: 30,
            ),
            const SizedBox(
              height: paddingHor,
            ),
            TextInput(
              controller: _tcController,
              label: 'Tiêu chí',
            ),
            const SizedBox(
              height: paddingHor,
            ),
            TextInput(
              controller: _soLuocController,
              label: 'Sơ lược yêu cầu',
              maxLine: null,
            ),
          ],
        ),
      );

  Widget scaffold() => Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: paddingHor, vertical: paddingVer),
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
                    Text('Thêm yêu cầu',
                        style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                          color: colorBackgroundMain,
                          fontSize: fontTitle,
                          fontWeight: FontWeight.w700,
                        )))
                  ],
                ),
                const SizedBox(
                  height: paddingHor,
                ),
                listInput(),
              ],
            ),
            ButtonSave(
              press: () {
                LoadingController loading = LoadingController();
                BuOTD data = BuOTD(
                    phongBan: _pbController.text,
                    viTri: _vtController.text,
                    tieuChi: _tcController.text,
                    tinhTrang: 'none',
                    phoneList: [],
                    candidateLH: [],
                    soLuocYeuCau: _soLuocController.text);

                loading.loading = _controller.postData(data);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SplashPage(
                              controller: loading,
                            )));
              },
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
    super.initState();
    _pbController = TextEditingController();
    _vtController = TextEditingController();
    _tcController = TextEditingController();
    _soLuocController = TextEditingController();
    _controller = BUController(context: context);
  }

  @override
  void dispose() {
    super.dispose();
    _pbController.dispose();
    _vtController.dispose();
    _tcController.dispose();
    _soLuocController.dispose();
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
