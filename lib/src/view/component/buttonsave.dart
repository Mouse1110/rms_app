import 'package:flutter/material.dart';
import 'package:flutter_rms_app/src/utils/config/color.dart';
import 'package:flutter_rms_app/src/utils/config/fontsize.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonSave extends StatelessWidget {
  final Function press;
  final String title;
  const ButtonSave({Key key, this.press, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          press();
        },
        child: Container(
            width: 100,
            height: 40,
            decoration: BoxDecoration(
                color: colorBackgroundMain.withOpacity(0.6),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  const BoxShadow(
                      offset: Offset(0, 3), blurRadius: 7, color: colorShadow)
                ]),
            child: Center(
              child: Text(title != null ? title : 'Xác Nhận',
                  style: GoogleFonts.roboto(
                      textStyle: const TextStyle(
                          color: Colors.white,
                          fontSize: fontTitle,
                          fontWeight: FontWeight.w700))),
            )),
      );
}
