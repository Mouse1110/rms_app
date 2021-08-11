import 'package:flutter/material.dart';
import 'package:flutter_rms_app/src/model/OTD/candidate.dart';
import 'package:flutter_rms_app/src/model/OTD/file.dart';
import 'package:flutter_rms_app/src/model/OTD/interview.dart';
import 'package:flutter_rms_app/src/model/global/page/interview.dart';
import 'package:flutter_rms_app/src/utils/config/color.dart';
import 'package:flutter_rms_app/src/utils/config/fontsize.dart';
import 'package:flutter_rms_app/src/utils/config/images.dart';
import 'package:flutter_rms_app/src/utils/config/shadow.dart';
import 'package:flutter_rms_app/src/utils/urllauncher/index.dart';
import 'package:flutter_rms_app/src/view/component/buttonadd.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class InterViewDetail extends StatelessWidget {
  const InterViewDetail({Key key}) : super(key: key);

  Widget scaffold({
    InterViewOTD interView,
    FileOTD file,
    CandidateOTD candidate,
  }) =>
      SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(paddingHor),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Chi tiết',
                    style: GoogleFonts.roboto(
                        fontSize: fontTitle,
                        color: colorBackgroundMain,
                        fontWeight: FontWeight.w700),
                  )
                ],
              ),
              const SizedBox(
                height: paddingVer,
              ),
              ClipOval(
                child: Image.network(
                  candidate.image,
                  fit: BoxFit.fill,
                  width: 128,
                  height: 128,
                  errorBuilder: (context, url, error) =>
                      const Icon(Icons.error),
                ),
              ),
              const SizedBox(
                height: paddingHor,
              ),
              Text(
                candidate.name,
                style: GoogleFonts.roboto(
                    fontSize: fontTitle, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: paddingVer,
              ),
              Text(
                candidate.viTri,
                style: GoogleFonts.roboto(
                    fontSize: fontMini, fontWeight: FontWeight.w300),
              ),
              const SizedBox(
                height: paddingHor,
              ),
              Text(
                candidate.note,
                style: GoogleFonts.roboto(
                    fontSize: fontText,
                    letterSpacing: 1.25,
                    fontWeight: FontWeight.w300),
                textAlign: TextAlign.justify,
              ),
              const Divider(),
              const SizedBox(
                height: paddingHor,
              ),
              Container(
                padding: const EdgeInsets.all(paddingHor),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(radiuscard),
                    boxShadow: shadowContainerShow),
                child: interView.ketLuan == 'true'
                    ? Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                file.timeStart,
                                style: GoogleFonts.roboto(
                                    fontSize: fontMini,
                                    color: colorBackgroundMain,
                                    fontWeight: FontWeight.w300),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: paddingHor,
                          ),
                          Text(
                            interView.nhanXet == ''
                                ? 'Hiện chưa có nhận xét nào'
                                : interView.nhanXet,
                            style: GoogleFonts.roboto(
                              fontSize: fontTitle,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(
                            height: paddingHor,
                          ),
                          Text(
                            'Số tài khoản: ${file.soTaiKhoan == '' ? 'Không rõ' : file.soTaiKhoan}',
                            style: GoogleFonts.roboto(
                              fontSize: fontText,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(
                            height: paddingVer,
                          ),
                          Text(
                            'Ngân hàng :${file.nganHang == '' ? 'Không rõ' : file.nganHang}',
                            style: GoogleFonts.roboto(
                              fontSize: fontText,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      )
                    : Center(
                        child: Text(
                        'Ứng viên không được nhận',
                        style: GoogleFonts.roboto(
                            fontSize: fontTitle, fontWeight: FontWeight.w500),
                      )),
              ),
              const SizedBox(
                height: paddingHor,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    'Liên Hệ:',
                    style: GoogleFonts.roboto(
                      fontSize: fontTitle,
                      color: colorBackgroundMain,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    width: paddingHor,
                  ),
                  GestureDetector(
                    onTap: () {
                      URLLauncher.openCall(phone: candidate.phone);
                    },
                    child: ClipOval(
                      child: Image.asset(
                        iconCallLH,
                        width: 24,
                        height: 24,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: paddingVer,
                  ),
                  GestureDetector(
                    onTap: () {
                      URLLauncher.openEmail(toEmail: [candidate.email]);
                    },
                    child: ClipOval(
                      child: Image.asset(
                        iconGmail,
                        width: 24,
                        height: 24,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: paddingHor * 2,
              ),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) =>
      Consumer<InterViewModel>(builder: (context, value, index) {
        return Stack(
          children: [
            scaffold(
                interView: value.interViewIndex,
                file: value.fileIndex,
                candidate: value.candidateIndex),
            Positioned(
              bottom: paddingHor,
              left: 0,
              right: 0,
              child: Center(
                  child: ButtonAdd(
                press: () {
                  URLLauncher.openLink(url: value.candidateIndex.soYeu);
                },
                title: 'Minh chứng',
                icon: Icons.assignment,
              )),
            )
          ],
        );
      });
}
