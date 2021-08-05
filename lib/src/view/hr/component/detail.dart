import 'package:flutter/material.dart';
import 'package:flutter_rms_app/src/model/OTD/candidate.dart';
import 'package:flutter_rms_app/src/model/global/page/hr.dart';
import 'package:flutter_rms_app/src/utils/config/color.dart';
import 'package:flutter_rms_app/src/utils/config/fontsize.dart';
import 'package:flutter_rms_app/src/utils/config/images.dart';
import 'package:flutter_rms_app/src/view/component/buttonadd.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HRDetail extends StatelessWidget {
  const HRDetail({Key key}) : super(key: key);

  Widget itemCandidate(CandidateOTD data) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipOval(
            child: Image.network(
              data.image,
              fit: BoxFit.fill,
              width: 128,
              height: 128,
              errorBuilder: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          const SizedBox(
            height: paddingHor,
          ),
          Text(
            data.name,
            style: GoogleFonts.roboto(
              fontSize: fontTitle,
              fontWeight: FontWeight.w700,
            ),
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
          const SizedBox(
            height: paddingHor,
          ),
          Text(
            data.note,
            textAlign: TextAlign.justify,
            style: GoogleFonts.roboto(
              fontSize: fontText,
              letterSpacing: 1.5,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      );

  Widget scaffold(BuildContext context) =>
      Consumer<HRModel>(builder: (context, value, index) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: paddingHor),
            child: Column(
              children: [
                const SizedBox(
                  height: paddingHor,
                ),
                Row(
                  children: [
                    Text(
                      'Chi tiết',
                      style: GoogleFonts.roboto(
                        fontSize: fontTitle,
                        color: colorBackgroundMain,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox()
                  ],
                ),
                const SizedBox(
                  height: paddingVer,
                ),
                itemCandidate(value.candidateIndex),
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
                    ClipOval(
                      child: Image.asset(
                        iconCallLH,
                        width: 24,
                        height: 24,
                      ),
                    ),
                    const SizedBox(
                      width: paddingVer,
                    ),
                    ClipOval(
                      child: Image.asset(
                        iconGmail,
                        width: 24,
                        height: 24,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
        );
      });

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Positioned(
              bottom: 0, top: 0, left: 0, right: 0, child: scaffold(context)),
          Positioned(
              bottom: paddingHor,
              left: 0,
              right: 0,
              child: Center(
                  child: ButtonAdd(
                press: () {},
                title: 'Minh chứng',
                icon: Icons.assignment,
              ))),
        ],
      );
}
