import 'package:flutter/material.dart';
import 'package:flutter_rms_app/src/utils/config/color.dart';
import 'package:flutter_rms_app/src/utils/config/fontsize.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonAdd extends StatelessWidget {
  final Function press;
  final String title;
  final IconData icon;
  const ButtonAdd({Key key, this.press, this.title, this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () {
          press();
        },
        child: Container(
          width: 170,
          height: 50,
          decoration: BoxDecoration(
              color: colorBackgroundMain.withOpacity(0.6),
              borderRadius: BorderRadius.circular(radiuscard)),
          padding: const EdgeInsets.symmetric(
              horizontal: paddingHor, vertical: paddingVer),
          child: Row(
            children: [
              Icon(
                icon != null ? icon : Icons.add,
                color: Colors.white,
              ),
              const SizedBox(
                width: paddingVer,
              ),
              Text(
                title != null ? title : 'Thêm mới',
                style: GoogleFonts.roboto(
                    textStyle: const TextStyle(
                        color: Colors.white,
                        fontSize: fontText,
                        fontWeight: FontWeight.w500)),
              ),
            ],
          ),
        ),
      );
}
