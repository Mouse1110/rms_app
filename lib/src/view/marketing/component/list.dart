import 'package:flutter/material.dart';
import 'package:flutter_rms_app/src/controller/marketing.dart';
import 'package:flutter_rms_app/src/model/OTD/marketing.dart';
import 'package:flutter_rms_app/src/model/global/page/marketing.dart';
import 'package:flutter_rms_app/src/utils/config/color.dart';
import 'package:flutter_rms_app/src/utils/config/fontsize.dart';
import 'package:flutter_rms_app/src/utils/config/shadow.dart';
import 'package:flutter_rms_app/src/view/component/buttonadd.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MarketingList extends StatefulWidget {
  const MarketingList({Key key}) : super(key: key);

  @override
  State<MarketingList> createState() => _MarketingListState();
}

class _MarketingListState extends State<MarketingList> {
  int indexContainerShow = 0;
  MarketingController _controller;
  //============================================================================
  Widget title(BuildContext context) => Consumer<MarketingModel>(
        builder: (context, value, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: paddingHor),
            child: Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: const BoxDecoration(
                      color: colorBackgroundMain, shape: BoxShape.circle),
                ),
                const SizedBox(
                  width: paddingVer,
                ),
                Text(
                  '${value.countBaiViet} Bài viết',
                  style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                          fontSize: fontTitle, fontWeight: FontWeight.w700)),
                ),
              ],
            ),
          );
        },
      );
//============================================================================
  Widget itemChiTiet(BuildContext context) => Consumer<MarketingModel>(
        builder: (context, value, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                indexContainerShow = 0;
              });
            },
            child: Container(
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                      child: SizedBox(
                    child: Row(
                      children: [
                        Expanded(
                            child: Stack(
                          children: [
                            Positioned(
                                top: 0,
                                left: 0,
                                right: 0,
                                bottom: paddingHor,
                                child: Container(
                                  padding: const EdgeInsets.only(
                                      top: paddingVer, left: paddingVer),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(radiusContainer),
                                    border:
                                        Border.all(width: 2, color: Colors.red),
                                  ),
                                  child: Text('Số bài viết/yêu cầu',
                                      style: GoogleFonts.roboto(
                                          fontSize: fontMini * 0.8,
                                          fontWeight: FontWeight.w500)),
                                )),
                            Positioned(
                                bottom: 0,
                                left: 0,
                                right: 0,
                                child: Center(
                                  child: Column(
                                    children: [
                                      Text(
                                          '${value.listMarketingFolowMonth.length}',
                                          style: GoogleFonts.roboto(
                                              fontSize: fontText,
                                              fontWeight: FontWeight.w500)),
                                      const SizedBox(
                                        height: paddingVer,
                                      ),
                                      Container(
                                        width: 30,
                                        height: (value.listMarketingFolowMonth
                                                    .length *
                                                10)
                                            .toDouble(),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                              radiuscard / 2),
                                          color: colorBackgroundMain,
                                        ),
                                        margin:
                                            const EdgeInsets.only(bottom: 4),
                                      ),
                                      SizedBox(
                                        height: paddingHor,
                                        child: Text('Bài viết',
                                            style: GoogleFonts.roboto(
                                                fontSize: fontMini,
                                                fontWeight: FontWeight.w700)),
                                      )
                                    ],
                                  ),
                                )),
                          ],
                        )),
                        const SizedBox(
                          width: paddingVer,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Số bài viết:',
                                style: GoogleFonts.roboto(
                                    fontSize: fontText,
                                    color: colorBackgroundMain,
                                    fontWeight: FontWeight.w500)),
                            const SizedBox(
                              height: paddingVer,
                            ),
                            Text('${value.listMarketingFolowMonth.length}',
                                style: GoogleFonts.roboto(
                                    fontSize: fontTitle,
                                    fontWeight: FontWeight.w700)),
                            const SizedBox(
                              height: paddingHor,
                            ),
                            Text('Số yêu cầu:',
                                style: GoogleFonts.roboto(
                                    fontSize: fontText,
                                    color: colorBackgroundMain,
                                    fontWeight: FontWeight.w500)),
                            const SizedBox(
                              height: paddingVer,
                            ),
                            Text('${value.countYeuCauMonth}',
                                style: GoogleFonts.roboto(
                                    fontSize: fontTitle,
                                    fontWeight: FontWeight.w700)),
                          ],
                        )
                      ],
                    ),
                  )),
                  Text('Tổng quát >>',
                      style: GoogleFonts.roboto(
                          fontSize: fontTitle,
                          color: colorBackgroundMain,
                          fontWeight: FontWeight.w500)),
                ],
              ),
            ),
          );
        },
      );
  Widget itemTongQuat(BuildContext context) => Consumer<MarketingModel>(
        builder: (context, value, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                indexContainerShow = 1;
              });
            },
            child: Container(
              color: Colors.white,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Thông tin',
                          style: GoogleFonts.roboto(
                              fontSize: fontMini,
                              color: colorBackgroundMain,
                              fontWeight: FontWeight.w500)),
                      const SizedBox(
                        height: paddingVer,
                      ),
                      Text('Số yêu cầu đã nhận: ${value.countYeuCau}',
                          style: GoogleFonts.roboto(
                              fontSize: fontText, fontWeight: FontWeight.w500)),
                    ],
                  ),
                  Text(
                      'Số bài viết còn hoạt động: ${value.countBaiVietHoatDong}',
                      style: GoogleFonts.roboto(
                          fontSize: fontText, fontWeight: FontWeight.w500)),
                  Text(
                      'Số bài viết hết hoạt động: ${value.countBaiVietHetHoatDong}',
                      style: GoogleFonts.roboto(
                          fontSize: fontText, fontWeight: FontWeight.w500)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Tổng chi phí: ${value.countTongChiPhi}',
                          style: GoogleFonts.roboto(
                              fontSize: fontText, fontWeight: FontWeight.w500)),
                      Text('Chi tiết >>',
                          style: GoogleFonts.roboto(
                              fontSize: fontTitle,
                              color: colorBackgroundMain,
                              fontWeight: FontWeight.w500))
                    ],
                  )
                ],
              ),
            ),
          );
        },
      );
  Widget showContainer(BuildContext context) => Container(
      height: 250,
      margin: const EdgeInsets.symmetric(horizontal: paddingHor),
      padding: const EdgeInsets.symmetric(
          horizontal: paddingHor, vertical: paddingHor),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(radiusContainer),
          boxShadow: shadowContainerShow),
      child: indexContainerShow == 0
          ? itemTongQuat(context)
          : itemChiTiet(context));
//============================================================================
  Widget iconBackNext(IconData icon, Function press) => SizedBox.fromSize(
        size: const Size(56, 56),
        child: ClipOval(
          child: Material(
            color: colorBackgroundMain,
            child: InkWell(
              splashColor: colorBackgroundLiner,
              onTap: press,
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
          ),
        ),
      );

  Widget buttonAndShowDate() =>
      Consumer<MarketingModel>(builder: (context, value, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: paddingHor),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              iconBackNext(Icons.arrow_back, () {
                _controller.refeshList(false);
              }),
              Text('tháng ${value.dateIndex[1]} năm ${value.dateIndex[2]}',
                  style: GoogleFonts.roboto(
                    fontSize: fontTitle,
                    fontWeight: FontWeight.w700,
                  )),
              iconBackNext(Icons.arrow_forward, () {
                _controller.refeshList(true);
              }),
            ],
          ),
        );
      });
//============================================================================
  Widget itemList(MarketingOTD data) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: paddingHor),
        child: Row(
          children: [
            Column(
              children: [
                Text(
                    '${data.timeStart.split('/')[0]}/${data.timeStart.split('/')[1]}',
                    style: GoogleFonts.roboto(
                        fontSize: fontText, fontWeight: FontWeight.w500)),
                const SizedBox(
                  height: paddingHor * 2,
                ),
                Text(
                    '${data.timeEnd.split('/')[0]}/${data.timeEnd.split('/')[1]}',
                    style: GoogleFonts.roboto(
                        fontSize: fontText, fontWeight: FontWeight.w500)),
              ],
            ),
            const SizedBox(
              width: paddingVer,
            ),
            Expanded(
                child: GestureDetector(
              onTap: () {},
              child: Container(
                height: 120,
                padding: const EdgeInsets.all(paddingVer),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(radiuscard),
                    boxShadow: shadowCard),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(data.tenBai,
                        style: GoogleFonts.roboto(
                            fontSize: fontTitle, fontWeight: FontWeight.w700)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(data.kenhDangTuyen,
                            style: GoogleFonts.roboto(
                                fontSize: fontMini,
                                fontWeight: FontWeight.w700)),
                        Text('Xem minh chứng >>',
                            style: GoogleFonts.roboto(
                                fontSize: fontMini,
                                color: colorBackgroundMain,
                                fontWeight: FontWeight.w500))
                      ],
                    )
                  ],
                ),
              ),
            )),
          ],
        ),
      );

  Widget list(BuildContext context) =>
      Consumer<MarketingModel>(builder: (context, value, index) {
        return Expanded(
          child: ListView.builder(
            itemCount: value.listMarketingFolowMonth.length,
            itemBuilder: (context, index) => Column(
              children: [
                const SizedBox(
                  height: paddingHor,
                ),
                itemList(value.listMarketingFolowMonth[index]),
              ],
            ),
          ),
        );
      });
//============================================================================
  Widget scaffold(BuildContext context) => Column(
        children: [
          const SizedBox(
            height: paddingVer,
          ),
          title(context),
          const SizedBox(
            height: paddingVer,
          ),
          showContainer(context),
          const SizedBox(
            height: paddingVer,
          ),
          buttonAndShowDate(),
          const SizedBox(height: paddingVer),
          list(context),
        ],
      );
//============================================================================
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = MarketingController(context: context);
  }

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          scaffold(context),
          Positioned(
              bottom: paddingHor,
              left: 0,
              right: 0,
              child: Center(
                child: ButtonAdd(
                  press: () {
                    _controller.moveAddPage();
                  },
                ),
              ))
        ],
      );
}
