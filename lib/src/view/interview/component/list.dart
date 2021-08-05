import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:flutter_rms_app/src/controller/interview.dart';
import 'package:flutter_rms_app/src/model/OTD/bu.dart';
import 'package:flutter_rms_app/src/model/OTD/candidate.dart';
import 'package:flutter_rms_app/src/model/global/page/interview.dart';
import 'package:flutter_rms_app/src/utils/config/color.dart';
import 'package:flutter_rms_app/src/utils/config/fontsize.dart';
import 'package:flutter_rms_app/src/utils/config/shadow.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:provider/provider.dart';

class InterViewList extends StatefulWidget {
  const InterViewList({Key key}) : super(key: key);

  @override
  State<InterViewList> createState() => _InterViewListState();
}

class _InterViewListState extends State<InterViewList> {
  bool isShow = false;
  InterViewController _controller;

  Widget itemCandidate(CandidateOTD data) => Column(
        children: [
          const SizedBox(
            height: paddingVer,
          ),
          GestureDetector(
            onTap: () {
              print('aaa');
            },
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(radiuscard),
                boxShadow: shadowCard,
              ),
              padding: const EdgeInsets.symmetric(
                  horizontal: paddingVer, vertical: paddingVer),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ClipOval(
                    child: Image.network(
                      data.image,
                      fit: BoxFit.fill,
                      width: 64,
                      height: 64,
                      errorBuilder: (context, url, error) =>
                          const Icon(Icons.error),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            data.name,
                            style: GoogleFonts.roboto(
                                fontSize: fontText,
                                fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            width: paddingVer,
                          ),
                          Text(
                            'Chưa cập nhật',
                            style: GoogleFonts.roboto(
                                color: Colors.redAccent,
                                fontSize: 8,
                                fontWeight: FontWeight.w300),
                          )
                        ],
                      ),
                      Text(
                        data.viTri,
                        style: GoogleFonts.roboto(
                            fontSize: fontMini, fontWeight: FontWeight.w300),
                      )
                    ],
                  ),
                  Text(
                    'Cập nhật >>',
                    style: GoogleFonts.roboto(
                        color: colorBackgroundMain,
                        fontSize: fontMini,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.w300),
                  )
                ],
              ),
            ),
          ),
        ],
      );
  //======================================
  Widget itemShowYeuCau() => GestureDetector(
        onTap: () {
          setState(() {
            isShow = false;
          });
        },
        child: Container(
          height: 220,
          margin: const EdgeInsets.symmetric(vertical: paddingHor),
          padding: const EdgeInsets.all(paddingHor),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(radiuscard),
            boxShadow: shadowContainerShow,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Tuyển Dev phát triển app di động và vận hành hệ thống',
                    style: GoogleFonts.roboto(
                        color: colorBackgroundMain,
                        fontSize: fontTitle,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: paddingHor,
                  ),
                  Text(
                    'Đào tạo/Chuyên viên học vụ',
                    style: GoogleFonts.roboto(
                        fontSize: fontMini, fontWeight: FontWeight.w300),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '<< Quay về',
                    style: GoogleFonts.roboto(
                        color: colorBackgroundMain,
                        fontSize: fontMini,
                        fontWeight: FontWeight.w300),
                  ),
                  LiteRollingSwitch(
                    value: true,
                    textOff: 'Ngừng hoạt động',
                    textOn: 'Đang hoạt động',
                    textSize: 8,
                    iconOn: Icons.arrow_back,
                    iconOff: Icons.arrow_forward,
                    colorOn: colorBackgroundMain,
                    colorOff: Colors.redAccent,
                    onChanged: (bool value) {
                      print(value);
                    },
                  )
                ],
              )
            ],
          ),
        ),
      );

  Widget itemYeuCau(BuOTD data) => GestureDetector(
        onTap: () {
          _controller.setListCandidateDaLH(data.candidateLH);
          setState(() {
            isShow = true;
          });
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: paddingHor),
          padding: const EdgeInsets.all(paddingHor),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(radiuscard),
            boxShadow: shadowCard,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.soLuocYeuCau,
                    style: GoogleFonts.roboto(
                        color: colorBackgroundMain,
                        fontSize: fontTitle,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: paddingHor,
                  ),
                  Text(
                    '${data.phongBan}/${data.viTri}',
                    style: GoogleFonts.roboto(
                        fontSize: fontMini, fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(
                    height: paddingVer,
                  ),
                  Text(
                    'Tổng ứng viên: ${data.phoneList.length}',
                    style: GoogleFonts.roboto(
                        fontSize: fontText, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              Text(
                'Số ứng viên chưa liên hệ: ${data.phoneList.length - data.candidateLH.length}',
                style: GoogleFonts.roboto(
                    fontSize: fontText, fontWeight: FontWeight.w500),
              ),
              Text(
                'Số ứng viên đã liên hệ: ${data.candidateLH.length}',
                style: GoogleFonts.roboto(
                    fontSize: fontText, fontWeight: FontWeight.w500),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text('Cập nhật >>',
                      style: GoogleFonts.roboto(
                          fontSize: fontMini,
                          fontWeight: FontWeight.w300,
                          color: colorBackgroundMain))
                ],
              )
            ],
          ),
        ),
      );

  Widget chooseYeuCau(Size size, List<BuOTD> list) => list.length > 0
      ? !isShow
          ? Swiper(
              itemHeight: 350,
              itemWidth: size.width,
              layout: SwiperLayout.TINDER,
              itemBuilder: (BuildContext context, int index) {
                return itemYeuCau(list[index]);
              },
              itemCount: list.length,
              pagination:
                  const SwiperPagination(margin: EdgeInsets.only(top: 360)),
            )
          : itemShowYeuCau()
      : SizedBox(
          height: 100,
          child: Center(
              child: Text('Hiện tại chưa có yêu cầu nào khả dụng',
                  style: GoogleFonts.roboto(
                      fontSize: fontText, fontWeight: FontWeight.w300))),
        );
//======================================
  Widget scaffold(Size size, BuildContext context) =>
      Consumer<InterViewModel>(builder: (context, value, index) {
        return SizedBox(
          height: size.height * 0.85,
          width: size.width,
          child: ListView(
            children: [
              isShow
                  ? Padding(
                      padding: const EdgeInsets.all(paddingHor),
                      child: Text('Yêu cầu',
                          style: GoogleFonts.roboto(
                              fontSize: fontTitle,
                              color: colorBackgroundMain,
                              fontWeight: FontWeight.w500)),
                    )
                  : const SizedBox(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: paddingHor),
                child: chooseYeuCau(size, value.listBU),
              ),
              isShow
                  ? Column(
                      children: [
                        const Divider(),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: paddingHor),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Ứng viên',
                                  style: GoogleFonts.roboto(
                                      fontSize: fontTitle,
                                      fontWeight: FontWeight.w500)),
                              Text('10',
                                  style: GoogleFonts.roboto(
                                      fontSize: fontTitle,
                                      color: Colors.redAccent,
                                      fontWeight: FontWeight.w700))
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: paddingHor,
                        ),
                        Column(
                            children: value.listCandidateDaLH.length > 0
                                ? value.listCandidateDaLH
                                    .map(
                                      (e) => itemCandidate(e),
                                    )
                                    .toList()
                                : [
                                    Text(
                                        'Hiện tại yêu cầu này chưa có ứng viên nào',
                                        style: GoogleFonts.roboto(
                                            fontSize: fontText,
                                            fontWeight: FontWeight.w300))
                                  ])
                      ],
                    )
                  : const SizedBox()
            ],
          ),
        );
      });

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = InterViewController(context: context);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Stack(
      children: [
        Positioned(top: 0, right: 0, left: 0, child: scaffold(size, context)),
      ],
    );
  }
}
