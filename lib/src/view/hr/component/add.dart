import 'package:flutter/material.dart';
import 'package:flutter_card_swipper/flutter_card_swiper.dart';
import 'package:flutter_rms_app/src/controller/hr.dart';
import 'package:flutter_rms_app/src/controller/loading.dart';
import 'package:flutter_rms_app/src/model/OTD/bu.dart';
import 'package:flutter_rms_app/src/model/OTD/candidate.dart';
import 'package:flutter_rms_app/src/model/global/index.dart';
import 'package:flutter_rms_app/src/model/global/page/hr.dart';
import 'package:flutter_rms_app/src/utils/config/color.dart';
import 'package:flutter_rms_app/src/utils/config/fontsize.dart';
import 'package:flutter_rms_app/src/utils/config/shadow.dart';
import 'package:flutter_rms_app/src/view/component/buttonsave.dart';
import 'package:flutter_rms_app/src/view/splash/index.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HRAdd extends StatefulWidget {
  const HRAdd({Key key}) : super(key: key);

  @override
  State<HRAdd> createState() => _HRAddState();
}

class _HRAddState extends State<HRAdd> {
  HRController _controller;
  IndexModel _indexController;
  //============================================
  Widget itemCandidate(CandidateOTD data) => Container(
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ButtonSave(
                      press: () {
                        LoadingController loading = LoadingController();
                        loading.loading =
                            _controller.postNewCandidate(data.phone);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SplashPage(
                                      controller: loading,
                                    )));
                      },
                      title: 'thêm vào',
                    ),
                    ButtonSave(
                      press: () {
                        _controller
                            .setIndexCandidate(data)
                            .then((value) => _controller.moveDetailPage());
                      },
                      title: 'Xem thêm',
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ));

  Widget listItemCandidate(List<CandidateOTD> list) => Swiper(
        itemHeight: 170,
        itemWidth: double.infinity,
        layout: SwiperLayout.TINDER,
        itemBuilder: (BuildContext context, int index) {
          return itemCandidate(list[index]);
        },
        itemCount: list.length,
        pagination: const SwiperPagination(margin: EdgeInsets.only(top: 180)),
      );
//============================================
  Widget itemYeuCau(BuOTD data) => GestureDetector(
        onTap: () {
          _controller.setIndexBU(data).then((value) => _controller
              .setListCandidateDaLH()
              .then((value) => _controller.setListCandidateChuaLH().then(
                    (value) => _controller.moveListPage(),
                  )));
        },
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: paddingVer),
          padding: const EdgeInsets.all(paddingHor),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(radiusContainer),
              boxShadow: shadowCard),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Yêu cầu',
                    style: GoogleFonts.roboto(
                      fontSize: fontMini,
                      color: colorBackgroundMain,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(
                    height: paddingVer,
                  ),
                  Text(
                    data.soLuocYeuCau,
                    style: GoogleFonts.roboto(
                        fontSize: fontTitle,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.5),
                  ),
                  const SizedBox(
                    height: paddingVer,
                  ),
                  Text(
                    '${data.phongBan}/${data.viTri}',
                    style: GoogleFonts.roboto(
                      fontSize: fontText,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Tổng ứng viên: ${data.phoneList.length}',
                    style: GoogleFonts.roboto(
                      fontSize: fontText,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'Xác nhận ứng viên >>',
                    style: GoogleFonts.roboto(
                      fontSize: fontMini,
                      color: colorBackgroundMain,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      );

  Widget listItemYeuCau(Size size, List<BuOTD> list) => list.length > 0
      ? Swiper(
          itemHeight: 250,
          itemWidth: size.width * 0.8,
          layout: SwiperLayout.STACK,
          itemBuilder: (BuildContext context, int index) {
            return itemYeuCau(list[index]);
          },
          itemCount: list.length,
          pagination: const SwiperPagination(margin: EdgeInsets.only(top: 270)),
          onIndexChanged: (int i) {
            _controller.setIndexBU(list[i]);
          },
        )
      : SizedBox(
          height: 100,
          child: Center(
              child: Text('Hiện tại không có yêu cầu khả dụng',
                  style: GoogleFonts.roboto(
                    fontSize: fontText,
                    fontWeight: FontWeight.w300,
                  ))),
        );
//============================================
  Widget scaffold(Size size, BuildContext context) => Consumer<HRModel>(
        builder: (context, value, index) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: paddingHor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(
                      height: paddingHor,
                    ),
                    GestureDetector(
                        onTap: () {
                          _indexController.setInitPage(0);
                          _indexController.setInitType(0);
                        },
                        child: const Icon(Icons.arrow_back)),
                    Column(
                      children: [
                        Text('Đào tạo/Chuyên viên học vụ',
                            style: GoogleFonts.roboto(
                              fontSize: fontTitle,
                              fontWeight: FontWeight.w700,
                            )),
                      ],
                    ),
                    const SizedBox()
                  ],
                ),
                const SizedBox(
                  height: paddingHor,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: paddingHor),
                  child: Text('Danh sách yêu cầu: ${value.listBU.length}',
                      style: GoogleFonts.roboto(
                        fontSize: fontTitle,
                        fontWeight: FontWeight.w700,
                      )),
                ),
                const SizedBox(
                  height: paddingVer,
                ),
                listItemYeuCau(size, value.listBU),
                const SizedBox(
                  height: paddingVer,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: paddingHor),
                  child: Text('Ứng viên mới: ${value.listCandidateNew.length}',
                      style: GoogleFonts.roboto(
                        fontSize: fontTitle,
                        fontWeight: FontWeight.w700,
                      )),
                ),
                const SizedBox(
                  height: paddingVer,
                ),
                listItemCandidate(value.listCandidateNew)
              ],
            ),
          );
        },
      );
  @override
  void initState() {
    super.initState();
    _controller = HRController(context: context);
    _indexController = Provider.of<IndexModel>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return scaffold(size, context);
  }
}
