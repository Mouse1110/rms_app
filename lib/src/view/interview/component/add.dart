import 'package:flutter/material.dart';
import 'package:flutter_rms_app/src/utils/config/color.dart';
import 'package:flutter_rms_app/src/utils/config/fontsize.dart';
import 'package:flutter_rms_app/src/view/component/buttonsave.dart';
import 'package:flutter_rms_app/src/view/component/textinput.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class InterViewAdd extends StatefulWidget {
  const InterViewAdd({Key key}) : super(key: key);

  @override
  State<InterViewAdd> createState() => _InterViewAddState();
}

class _InterViewAddState extends State<InterViewAdd> {
  TextEditingController _nhanXet;
  TextEditingController _dateInput;
  TextEditingController _scan;
  TextEditingController _nganHang;
  TextEditingController _soTaiKhoan;
  Widget scaffold() => SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(paddingHor),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: paddingHor,
              ),
              Row(
                children: [
                  const Icon(Icons.arrow_back),
                  const SizedBox(
                    width: paddingVer,
                  ),
                  Text(
                    'Cập nhật thông tin',
                    style: GoogleFonts.roboto(
                        fontSize: fontTitle,
                        color: colorBackgroundMain,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
              const SizedBox(
                height: paddingHor,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Đã phỏng vấn',
                      style: GoogleFonts.roboto(
                          fontSize: fontText, fontWeight: FontWeight.w700)),
                  Switch(
                    value: false,
                    onChanged: (value) {
                      setState(() {});
                    },
                    activeTrackColor: colorBackgroundLiner,
                    activeColor: colorBackgroundMain,
                  ),
                ],
              ),
              const SizedBox(
                height: paddingVer,
              ),
              TextInput(
                label: 'Nhận xét',
                controller: _nhanXet,
              ),
              const SizedBox(
                height: paddingVer,
              ),
              Divider(),
              Text('Hồ sơ',
                  style: GoogleFonts.roboto(
                      fontSize: fontTitle, fontWeight: FontWeight.w700)),
              const SizedBox(
                height: paddingHor,
              ),
              TextInput(
                controller: _dateInput,
                readOnly: true,
                icon: const Icon(Icons.calendar_today),
                label: 'Thời gian bắt đầu',
                onTap: () async {
                  DateTime pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101));
                  if (pickedDate != null) {
                    String formattedDate =
                        DateFormat('dd-MM-yyyy').format(pickedDate);
                    setState(() {
                      _dateInput.text = formattedDate;
                    });
                  }
                },
              ),
              const SizedBox(
                height: paddingHor,
              ),
              TextInput(
                label: 'Scan hồ sơ',
                controller: _scan,
              ),
              const SizedBox(
                height: paddingHor,
              ),
              TextInput(
                label: 'Ngân hàng',
                controller: _nganHang,
              ),
              const SizedBox(
                height: paddingHor,
              ),
              TextInput(
                label: 'Só tài khoản',
                controller: _soTaiKhoan,
              ),
            ],
          ),
        ),
      );
  Widget designBackground() => Container(
        width: 300,
        height: 300,
        decoration: const BoxDecoration(
            color: colorLinerAdd,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(color: colorShadow, offset: Offset(3, 3), blurRadius: 7)
            ]),
      );
  Widget colorBackground() => Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.white, colorLinerAdd],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight)),
      );
  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Positioned(
              left: -0, top: 0, bottom: 0, right: 0, child: colorBackground()),
          Positioned(left: -150, top: -150, child: designBackground()),
          Positioned(top: 0, left: 0, right: 0, bottom: 0, child: scaffold()),
          Positioned(
            bottom: paddingHor,
            left: 0,
            right: 0,
            child: Center(
              child: ButtonSave(
                press: () {},
              ),
            ),
          )
        ],
      );
}
