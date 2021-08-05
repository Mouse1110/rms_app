import 'package:flutter/material.dart';
import 'package:flutter_rms_app/src/utils/config/color.dart';
import 'package:flutter_rms_app/src/utils/config/fontsize.dart';
import 'package:flutter_rms_app/src/utils/config/images.dart';
import 'package:flutter_rms_app/src/utils/config/shadow.dart';
import 'package:flutter_rms_app/src/view/component/buttonadd.dart';
import 'package:google_fonts/google_fonts.dart';

class InterViewDetail extends StatelessWidget {
  const InterViewDetail({Key key}) : super(key: key);

  Widget scaffold() => SingleChildScrollView(
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
                  'https://scontent.fdad1-1.fna.fbcdn.net/v/t1.6435-9/199124078_1691083864613019_308611881408296256_n.jpg?_nc_cat=100&ccb=1-3&_nc_sid=09cbfe&_nc_ohc=fL5rDakOZcQAX__9Udn&tn=UoupMpUUf_NcHwTg&_nc_ht=scontent.fdad1-1.fna&oh=42ae3b8eb2cc1f0cfa906f3cdc7d4905&oe=612ECB82',
                  fit: BoxFit.fill,
                  width: 128,
                  height: 128,
                ),
              ),
              const SizedBox(
                height: paddingHor,
              ),
              Text(
                'Nguyễn Long Bá',
                style: GoogleFonts.roboto(
                    fontSize: fontTitle, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: paddingVer,
              ),
              Text(
                'Giáo viên, Chuyên viên học vụ',
                style: GoogleFonts.roboto(
                    fontSize: fontMini, fontWeight: FontWeight.w300),
              ),
              const SizedBox(
                height: paddingHor,
              ),
              Text(
                'Tôi phấn đấu trở thành một giáo viên dạy tiếng Anh chuyên nghiệp, có khả năng giảng dạy mọi trình độ, và học hỏi thêm về mảng giáo dục trực tuyến. Vì muốn học hỏi một lĩnh vực mới cho đến nơi đến chốn nên tôi sẽ cam kết làm việc tối thiểu 1 năm nếu như cách chính sách lương bổng và phúc lợi phù hợp và thỏa đáng với nguyện vọng tìm việc.',
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
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '11/10/2000',
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
                      'Tạm ổn',
                      style: GoogleFonts.roboto(
                        fontSize: fontTitle,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: paddingHor,
                    ),
                    Text(
                      'Số tài khoản: 123213123',
                      style: GoogleFonts.roboto(
                        fontSize: fontText,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(
                      height: paddingVer,
                    ),
                    Text(
                      'Ngân hàng : Aribank',
                      style: GoogleFonts.roboto(
                        fontSize: fontText,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
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
                height: paddingHor * 2,
              ),
            ],
          ),
        ),
      );

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          scaffold(),
          Positioned(
            bottom: paddingHor,
            left: 0,
            right: 0,
            child: Center(
                child: ButtonAdd(
              press: () {},
              title: 'Minh chứng',
              icon: Icons.assignment,
            )),
          )
        ],
      );
}
