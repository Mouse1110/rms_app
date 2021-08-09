import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:flutter_rms_app/src/controller/hr.dart';
import 'package:flutter_rms_app/src/model/OTD/candidate.dart';
import 'package:flutter_rms_app/src/model/global/page/hr.dart';

import 'package:flutter_rms_app/src/utils/config/color.dart';
import 'package:flutter_rms_app/src/utils/config/fontsize.dart';
import 'package:flutter_rms_app/src/utils/config/shadow.dart';
import 'package:flutter_rms_app/src/view/component/buttonsave.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HRList extends StatefulWidget {
  const HRList({Key key}) : super(key: key);

  @override
  State<HRList> createState() => _HRListState();
}

class _HRListState extends State<HRList> {
  HRController _hrController;
  HRModel model;
  //=================================================
  Widget itemOld(CandidateOTD data) => GestureDetector(
        onTap: () {
          model.setCandidateIndex(data);
          _hrController.moveDetailPage();
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: paddingVer),
          padding: const EdgeInsets.all(paddingHor),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(radiusContainer),
              boxShadow: shadowCard),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ClipOval(
                child: Image.network(
                  data.image,
                  fit: BoxFit.fill,
                  width: 48,
                  height: 48,
                  errorBuilder: (context, url, error) =>
                      const Icon(Icons.error),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        data.name,
                        style: GoogleFonts.roboto(
                            fontSize: fontTitle, fontWeight: FontWeight.w700),
                      ),
                      const SizedBox(
                        width: paddingVer,
                      ),
                      Text(
                        'Đã liên hệ',
                        style: GoogleFonts.roboto(
                            fontSize: fontMini,
                            color: Colors.red,
                            fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: paddingVer,
                  ),
                  Text(
                    data.viTri,
                    style: GoogleFonts.roboto(
                      fontSize: fontMini,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
              Text(
                'Chi tiết >>',
                style: GoogleFonts.roboto(
                  fontSize: fontMini,
                  color: colorBackgroundMain,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
      );

  Widget listOld(List<CandidateOTD> list) => Column(
        children: list.map((e) => itemOld(e)).toList(),
      );
//=================================================
  Widget itemNew(CandidateOTD data) => Container(
      margin: const EdgeInsets.symmetric(vertical: paddingVer),
      padding: const EdgeInsets.all(paddingVer),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(radiusContainer),
          boxShadow: shadowCard),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipOval(
            child: Image.network(
              data.image,
              fit: BoxFit.fill,
              width: 64,
              height: 64,
              errorBuilder: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          const SizedBox(
            width: paddingVer,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.name,
                  style: GoogleFonts.roboto(
                      fontSize: fontTitle,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 1.5),
                ),
                const SizedBox(
                  height: paddingVer,
                ),
                Text(
                  data.viTri,
                  style: GoogleFonts.roboto(
                    fontSize: fontText,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                const SizedBox(
                  height: paddingHor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ButtonSave(
                      press: () {
                        _hrController.postRemoveCandidateChuaLH(data.phone);
                      },
                      title: 'Hủy bỏ',
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ));

  Widget listNew(Size size, List<CandidateOTD> list) => list.length > 0
      ? Swiper(
          itemHeight: 180,
          itemWidth: size.width,
          layout: SwiperLayout.TINDER,
          itemBuilder: (BuildContext context, int index) {
            return itemNew(list[index]);
          },
          itemCount: list.length,
          pagination: const SwiperPagination(margin: EdgeInsets.only(top: 210)),
        )
      : SizedBox(
          height: 100,
          child: Center(
              child: Text('Hiện tại không có ứng viên mới',
                  style: GoogleFonts.roboto(
                    fontSize: fontText,
                    fontWeight: FontWeight.w300,
                  ))),
        );
  //=================================================
  Widget scaffold(Size size, BuildContext context) =>
      Consumer<HRModel>(builder: (context, value, index) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(paddingHor),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(value.buIndex.soLuocYeuCau,
                        style: GoogleFonts.roboto(
                            fontSize: fontTitle,
                            color: colorBackgroundMain,
                            letterSpacing: 1.5,
                            fontWeight: FontWeight.w700)),
                    const SizedBox(
                      height: paddingVer,
                    ),
                    Text('${value.buIndex.phongBan}/${value.buIndex.viTri}',
                        style: GoogleFonts.roboto(
                            fontSize: fontMini, fontWeight: FontWeight.w300)),
                    const SizedBox(
                      height: paddingHor,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                            'Ứng viên mới: ${value.listCandidateChuaLH.length}',
                            style: GoogleFonts.roboto(
                                fontSize: fontTitle,
                                fontWeight: FontWeight.w500)),
                        GestureDetector(
                          onTap: () {
                            _hrController.moveAddInfoPage();
                          },
                          child: value.listCandidateChuaLH.length > 0
                              ? Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: paddingHor,
                                      vertical: paddingVer),
                                  decoration: BoxDecoration(
                                    color: colorBackgroundMain.withOpacity(0.8),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Text(
                                    'Liên hệ tất cả',
                                    style: GoogleFonts.roboto(
                                      fontSize: fontText,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ))
                              : const SizedBox(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              listNew(size, value.listCandidateChuaLH),
              const SizedBox(
                height: paddingHor,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: paddingHor),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Lịch Sử',
                        style: GoogleFonts.roboto(
                            fontSize: fontTitle, fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
              listOld(value.listCandidateDaLH),
            ],
          ),
        );
      });
  //=================================================
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _hrController = HRController(context: context);
    model = Provider.of<HRModel>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return scaffold(size, context);
  }
}
