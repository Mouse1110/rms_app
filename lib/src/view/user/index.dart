import 'package:flutter/material.dart';
import 'package:flutter_rms_app/src/controller/account.dart';
import 'package:flutter_rms_app/src/model/global/page/account.dart';
import 'package:flutter_rms_app/src/utils/config/color.dart';
import 'package:flutter_rms_app/src/utils/config/fontsize.dart';
import 'package:flutter_rms_app/src/utils/config/images.dart';
import 'package:flutter_rms_app/src/utils/sheetapi/index.dart';
import 'package:flutter_rms_app/src/view/component/buttonsave.dart';
import 'package:flutter_rms_app/src/view/component/textinput.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  AccountController _controller;
  Widget showDataWithText(
          {String label,
          String text,
          IconData icon,
          Function press,
          TextInputType type,
          bool isHeigh,
          TextEditingController controller}) =>
      Container(
        height: isHeigh ? 60 : null,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(width: 0.5)),
        padding: EdgeInsets.symmetric(
            horizontal: paddingVer, vertical: paddingVer / 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    label,
                    style: GoogleFonts.roboto(
                      fontSize: fontMini,
                      color: Colors.blue,
                    ),
                  ),
                  Text(
                    text,
                    style: GoogleFonts.roboto(
                        fontSize: fontText, fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(),
                ],
              ),
            ),
            Icon(icon)
          ],
        ),
      );

  Widget scaffold({
    String url,
    String name,
    String id,
    String sheet,
  }) =>
      Padding(
        padding: const EdgeInsets.all(paddingHor),
        child: Column(
          children: [
            Row(
              children: [Icon(Icons.arrow_back)],
            ),
            const SizedBox(
              height: paddingHor,
            ),
            ClipOval(
              child: Image.network(
                url,
                fit: BoxFit.fill,
                width: 80,
                height: 80,
                errorBuilder: (context, url, error) => Image.asset(
                  iconUser,
                  width: 80,
                  height: 80,
                ),
              ),
            ),
            const SizedBox(
              height: paddingVer,
            ),
            Text('Đăng nhập bằng gmail',
                style: GoogleFonts.roboto(
                    fontSize: fontMini,
                    color: colorBackgroundMain,
                    fontWeight: FontWeight.w300)),
            const SizedBox(
              height: paddingHor,
            ),
            Divider(),
            const SizedBox(
              height: paddingVer,
            ),
            showDataWithText(
                isHeigh: true,
                label: 'Tên của bạn',
                text: name,
                icon: Icons.touch_app,
                press: () {}),
            const SizedBox(
              height: paddingHor,
            ),
            showDataWithText(
                isHeigh: true,
                label: 'ID',
                text: id,
                icon: Icons.touch_app,
                press: () {}),
            Divider(),
            const SizedBox(
              height: paddingVer,
            ),
            Row(
              children: [
                Text('Hệ thống',
                    style: GoogleFonts.roboto(
                        fontSize: fontTitle, fontWeight: FontWeight.w300))
              ],
            ),
            const SizedBox(
              height: paddingHor,
            ),
            showDataWithText(
                isHeigh: false,
                label: 'Sheet Hiện Tại',
                text: sheet,
                icon: Icons.touch_app,
                press: () {}),
          ],
        ),
      );

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AccountController(context: context);
  }

  @override
  Widget build(BuildContext context) =>
      Consumer<AccountModel>(builder: (context, value, index) {
        return Stack(
          children: [
            scaffold(
                url: '${value.user.photoUrl}',
                id: value.user.email,
                name: value.user.displayName,
                sheet: SheetAPI.sheetShow),
            Positioned(
                bottom: paddingHor,
                left: 0,
                right: 0,
                child: Center(
                  child: ButtonSave(
                    title: 'Đăng xuất',
                    press: () {
                      _controller.logout();
                    },
                  ),
                ))
          ],
        );
      });
}
