import 'package:flutter/material.dart';
import 'package:flutter_rms_app/src/controller/bu.dart';
import 'package:flutter_rms_app/src/model/OTD/bu.dart';
import 'package:flutter_rms_app/src/model/global/page/bu.dart';
import 'package:flutter_rms_app/src/utils/config/color.dart';
import 'package:flutter_rms_app/src/utils/config/fontsize.dart';
import 'package:flutter_rms_app/src/view/component/buttonadd.dart';
import 'package:flutter_rms_app/src/view/component/dialog.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:provider/provider.dart';

class BUDetail extends StatelessWidget {
  const BUDetail({
    Key key,
  }) : super(key: key);
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
                    const SizedBox(
                      height: paddingHor,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Hoạt động',
                            style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                                fontSize: fontText,
                                fontWeight: FontWeight.w300,
                              ),
                            )),
                        const SizedBox(
                          height: paddingVer,
                        ),
                        // LiteRollingSwitch(
                        //   value: true,
                        //   textOff: 'Khởi chạy',
                        //   textOn: 'Đã khởi chạy',
                        //   textSize: fontMini,
                        //   colorOff: Colors.redAccent,
                        //   colorOn: Colors.greenAccent,
                        //   iconOff: Icons.arrow_right,
                        //   iconOn: Icons.arrow_left,
                        //   onChanged: (bool value) {
                        //     if (value) {
                        //       data.tinhTrang = 'in';
                        //     } else {
                        //       data.tinhTrang = 'out';
                        //     }
                        //     dialog.showPopup(
                        //         context,
                        //         const Text('Thông báo'),
                        //         Text(data.tinhTrang == 'in'
                        //             ? 'Bạn muốn chuyển trạng thái yêu cầu về hoạt động'
                        //             : 'Bạn muốn tắt hoạt động của yêu cầu này'),
                        //         () {},
                        //         () {});
                        //   },
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            ButtonAdd(
              press: () {
                BUController _controller = BUController(context: context);
                _controller.moveAddPage();
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
