import 'package:flutter/material.dart';
import 'package:flutter_rms_app/src/controller/hr.dart';
import 'package:flutter_rms_app/src/model/OTD/candidate.dart';
import 'package:flutter_rms_app/src/model/global/page/hr.dart';
import 'package:flutter_rms_app/src/utils/config/color.dart';
import 'package:flutter_rms_app/src/utils/config/fontsize.dart';
import 'package:flutter_rms_app/src/utils/sheetapi/index.dart';
import 'package:flutter_rms_app/src/utils/urllauncher/index.dart';
import 'package:flutter_rms_app/src/view/component/buttonsave.dart';
import 'package:flutter_rms_app/src/view/component/textinput.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class HRAddInf extends StatefulWidget {
  const HRAddInf({Key key}) : super(key: key);

  @override
  State<HRAddInf> createState() => _HRAddInfState();
}

class _HRAddInfState extends State<HRAddInf> {
  TextEditingController thongTin;
  TextEditingController date;
  HRController _controller;
  Widget scaffold(List<CandidateOTD> list) => Padding(
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
                  controller: date,
                  readOnly: true,
                  icon: const Icon(Icons.calendar_today),
                  label: 'Ngày phỏng vấn',
                  onTap: () async {
                    DateTime pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2101));

                    if (pickedDate != null) {
                      String formattedDate =
                          DateFormat('dd-MM-yyyy').format(pickedDate);
                      setState(() {
                        date.text = formattedDate;
                      });
                    }
                  },
                ),
              ],
            ),
            ButtonSave(
              press: () {
                List<String> lEmail = [];
                list.forEach((element) {
                  lEmail.add(element.email);
                });
                if (lEmail.length >= 1) {
                  URLLauncher.openEmail(
                    toEmail: lEmail,
                    subject: date.text,
                    body: thongTin.text,
                  ).then((value) => SheetAPI.init('InterView').then((value) =>
                      SheetAPI.getLastRow().then((value) => _controller
                          .getID(value)
                          .then((value) => _controller
                              .postInterView(value, date.text, thongTin.text)
                              .then(
                                (value) => _controller.parseListPhone().then((value) => _controller.postCandidateDaLH(value).then((value) => _controller.moveListPage()))
                              )))));
                }
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
    _controller = HRController(context: context);
    thongTin = TextEditingController();
    date = TextEditingController();
  }

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Positioned(
              left: -0, top: 0, bottom: 0, right: 0, child: colorBackground()),
          Positioned(left: -150, top: -150, child: designBackground()),
          Consumer<HRModel>(builder: (context, value, index) {
            return scaffold(value.listCandidateChuaLH);
          }),
        ],
      );
}
