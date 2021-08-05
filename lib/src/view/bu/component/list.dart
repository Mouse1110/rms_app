import 'package:flutter/material.dart';
import 'package:flutter_rms_app/src/controller/bu.dart';
import 'package:flutter_rms_app/src/model/OTD/bu.dart';
import 'package:flutter_rms_app/src/model/global/page/bu.dart';
import 'package:flutter_rms_app/src/utils/config/color.dart';
import 'package:flutter_rms_app/src/utils/config/fontsize.dart';
import 'package:flutter_rms_app/src/view/component/buttonadd.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class BUList extends StatefulWidget {
  BUList({Key key}) : super(key: key);

  @override
  _BUListState createState() => _BUListState();
}

class _BUListState extends State<BUList> {
  BUController _controller;
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  Widget textHeaderContainer(String tilte, String value) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            tilte,
            style: GoogleFonts.roboto(
                textStyle: const TextStyle(
              fontSize: fontTitle,
              fontWeight: FontWeight.w500,
            )),
          ),
          Text(value,
              style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                fontSize: fontText,
                fontWeight: FontWeight.w700,
              )))
        ],
      );

  Widget header(Size size) => Consumer<BUModel>(
        builder: (context, value, child) {
          return Container(
            width: size.width * 0.85,
            height: 200,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(radiusContainer),
                boxShadow: [
                  const BoxShadow(
                      offset: Offset(0, 7), blurRadius: 29, color: colorShadow)
                ]),
            padding: const EdgeInsets.symmetric(
                horizontal: paddingHor, vertical: paddingHor),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Thông tin',
                        style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                                fontSize: fontMini,
                                color: colorBackgroundMain))),
                    const SizedBox(height: paddingVer),
                    textHeaderContainer(
                        'Tổng số yêu cầu:', '${value.listData.length}'),
                  ],
                ),
                textHeaderContainer(
                    'Tổng số người tham gia:', '${value.coutMember}'),
                textHeaderContainer(
                    'Tổng số người được nhận:', '${value.coutMemberAccept}')
              ],
            ),
          );
        },
      );

  Widget cirShowActivity(Color color, String title) => Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          ),
          const SizedBox(
            width: paddingVer / 2,
          ),
          SizedBox(
            width: 100,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(title,
                  style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                        fontSize: fontMini, fontWeight: FontWeight.w500),
                  )),
            ),
          ),
        ],
      );

  Widget title(Size size) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: paddingHor),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Yêu cầu',
                  style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                          fontSize: fontTitle,
                          color: colorBackgroundMain,
                          fontWeight: FontWeight.w700)),
                ),
                Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: paddingHor / 2, vertical: paddingVer / 2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(radiuscard),
                        border: Border.all(width: 2, color: Colors.red)),
                    child: Text(
                      'Mới nhất',
                      style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                            fontSize: fontText, fontWeight: FontWeight.w500),
                      ),
                    )),
              ],
            ),
            const SizedBox(
              height: paddingVer,
            ),
            Consumer<BUModel>(
              builder: (context, value, child) => Text(
                value.dateRequestNew,
                style: GoogleFonts.roboto(
                  textStyle: const TextStyle(
                      fontSize: fontMini, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            const SizedBox(
              height: paddingVer,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Mức tình trạng:',
                    style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                          fontSize: fontText, fontWeight: FontWeight.w500),
                    )),
                const SizedBox(
                  width: paddingVer,
                ),
                cirShowActivity(cirRed, 'Chưa hoạt động')
              ],
            ),
            const SizedBox(
              height: paddingVer,
            ),
            cirShowActivity(colorBackgroundMain, 'Đang hoạt động'),
            const SizedBox(
              height: paddingVer,
            ),
            cirShowActivity(cirBrown, 'Hết hoạt động')
          ],
        ),
      );
  Widget showTinhTrang(String check) {
    Color col = Colors.white;
    if (check == 'in') {
      col = colorBackgroundMain;
    } else if (check == 'none') {
      col = cirRed;
    } else {
      col = cirBrown;
    }
    return Container(
      width: 32,
      height: 32,
      decoration: BoxDecoration(shape: BoxShape.circle, color: col),
    );
  }

  Widget object(
    BuOTD data,
    int index,
    Function press,
  ) =>
      GestureDetector(
        onTap: () {
          press();
        },
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: paddingHor / 2),
          child: Row(
            children: [
              SizedBox(
                  child: Consumer<BUModel>(
                builder: (context, value, child) => Stack(
                  children: [
                    Positioned(
                        child: SizedBox(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 40,
                            child: Text(value.listDateShow[index],
                                style: GoogleFonts.roboto(
                                    textStyle: const TextStyle(
                                        fontSize: fontMini,
                                        fontWeight: FontWeight.w500))),
                          ),
                          const SizedBox(
                            width: paddingHor,
                          ),
                          Container(
                            width: 10,
                            height: 200,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      offset: Offset(3, 0),
                                      blurRadius: 7,
                                      color: colorShadow),
                                  BoxShadow(
                                      offset: Offset(-3, 0),
                                      blurRadius: 7,
                                      color: colorShadow),
                                ]),
                          ),
                          const SizedBox(
                            width: paddingHor,
                          ),
                        ],
                      ),
                    )),
                    Positioned(
                        bottom: 0,
                        top: 0,
                        right: 14,
                        child: Center(child: showTinhTrang(data.tinhTrang))),
                    Positioned(
                      top: 10,
                      right: 40,
                      child: Text(value.listDateYear[index],
                          style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                                  fontSize: fontMini,
                                  fontWeight: FontWeight.w300))),
                    )
                  ],
                ),
              )),
              Expanded(
                child: Container(
                  height: 180,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(radiuscard),
                    boxShadow: [
                      const BoxShadow(
                        offset: Offset(0, 3),
                        blurRadius: 7,
                        color: colorShadow,
                      )
                    ],
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: paddingHor, vertical: paddingVer),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${data.phongBan}/${data.viTri}',
                            style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                                  color: colorBackgroundMain,
                                  fontSize: fontMini),
                            ),
                          ),
                          Text(
                            data.soLuocYeuCau,
                            style: GoogleFonts.roboto(
                              textStyle: const TextStyle(
                                  fontWeight: FontWeight.w700,
                                  fontSize: fontTitle),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Tổng ứng viên: ${data.phoneList.length}',
                                  style: GoogleFonts.roboto(
                                    textStyle: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: fontText),
                                  )),
                            ],
                          ),
                          const SizedBox(
                            height: paddingVer,
                          ),
                          Text('Xem thêm >>',
                              style: GoogleFonts.roboto(
                                textStyle: TextStyle(
                                    color: Colors.black.withOpacity(0.6),
                                    fontWeight: FontWeight.w500,
                                    fontSize: fontText),
                              ))
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );

  Widget list() => Consumer<BUModel>(
        builder: (context, value, child) {
          int i = -1;
          return value.listData.length > 0
              ? Column(
                  children: value.listData
                      .map((e) => object(e, ++i, () {
                            _controller
                                .saveModelDetail(e)
                                .then((value) => _controller.moveDetailPage());
                          }))
                      .toList(),
                )
              : const Center(
                  child: Text('Hiện Không có Yêu Cầu Nào'),
                );
        },
      );

  Widget scaffold(Size size) => SizedBox(
        height: size.height * 0.85,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: paddingHor * 2,
              ),
              header(size),
              const SizedBox(
                height: paddingHor,
              ),
              title(size),
              const SizedBox(
                height: paddingHor,
              ),
              list(),
            ],
          ),
        ),
      );
  @override
  void initState() {
    super.initState();
    _controller = BUController(context: context);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        scaffold(size),
        Positioned(
            bottom: paddingHor,
            left: 0,
            right: 0,
            child: Center(child: ButtonAdd(
              press: () {
                _controller.moveAddPage();
              },
            ))),
      ],
    );
  }
}
