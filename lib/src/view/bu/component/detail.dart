import 'package:flutter/material.dart';
import 'package:flutter_rms_app/src/controller/bu.dart';
import 'package:flutter_rms_app/src/model/OTD/bu.dart';
import 'package:flutter_rms_app/src/model/global/page/bu.dart';
import 'package:flutter_rms_app/src/utils/config/color.dart';
import 'package:flutter_rms_app/src/utils/config/fontsize.dart';
import 'package:flutter_rms_app/src/utils/sheetapi/index.dart';
import 'package:flutter_rms_app/src/utils/urllauncher/index.dart';
import 'package:flutter_rms_app/src/view/component/buttonadd.dart';
import 'package:flutter_rms_app/src/view/component/dialog.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:provider/provider.dart';

class BUDetail extends StatefulWidget {
  const BUDetail({
    Key key,
  }) : super(key: key);

  @override
  State<BUDetail> createState() => _BUDetailState();
}

class _BUDetailState extends State<BUDetail> {
  Widget itemTitle(String title, String text) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                  fontSize: fontText,
                  fontWeight: FontWeight.w300,
                ),
              )),
          const SizedBox(
            height: paddingVer,
          ),
          Text(text,
              style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                  fontSize: fontTitle,
                  fontWeight: FontWeight.w500,
                ),
              )),
        ],
      );

  Widget scaffold(BuOTD data, BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: paddingHor, vertical: paddingVer),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Chi tiết',
                        style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                            fontSize: fontTitle,
                            fontWeight: FontWeight.w500,
                          ),
                        )),
                    const SizedBox(
                      height: paddingHor,
                    ),
                    Text(data.soLuocYeuCau,
                        style: GoogleFonts.roboto(
                          textStyle: const TextStyle(
                              fontSize: fontTitle,
                              color: colorBackgroundMain,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 1.5),
                        )),
                    const SizedBox(
                      height: paddingHor * 2,
                    ),
                    itemTitle('Phòng ban yêu cầu', data.phongBan),
                    const SizedBox(
                      height: paddingHor,
                    ),
                    itemTitle('Vị trí', data.viTri),
                    const SizedBox(
                      height: paddingHor,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              if (data.tinhTrang == 'in') {
                                data.tinhTrang = 'out';
                              } else {
                                data.tinhTrang = 'in';
                              }
                            });
                            SheetAPI.init('BU').then((value) =>
                                SheetAPI.update(data.toJson(), data.id));
                          },
                          child: Text('Hoạt động',
                              style: GoogleFonts.roboto(
                                  fontSize: fontTitle,
                                  fontWeight: FontWeight.w700)),
                        ),
                        Switch(
                          value: data.tinhTrang == 'in' ? true : false,
                          onChanged: (value) {
                            setState(() {
                              if (value) {
                                data.tinhTrang = 'in';
                              } else {
                                data.tinhTrang = 'out';
                              }
                            });
                            SheetAPI.init('BU').then((value) =>
                                SheetAPI.update(data.toJson(), data.id));
                          },
                          activeTrackColor: colorBackgroundLiner,
                          activeColor: colorBackgroundMain,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            ButtonAdd(
              icon: Icons.assessment,
              title: 'Tiêu chí',
              press: () {
                URLLauncher.openLink(url: data.tieuChi);
              },
            )
          ],
        ),
      );

  @override
  Widget build(BuildContext context) => Consumer<BUModel>(
        builder: (context, value, child) {
          return value.detailData.id != null
              ? scaffold(value.detailData, context)
              : Center(
                  child: Text('Xin chờ trong giây lát',
                      style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                            fontSize: fontTitle,
                            color: colorBackgroundMain,
                            letterSpacing: 1.5),
                      )));
        },
      );
}
