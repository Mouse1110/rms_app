import 'package:flutter/material.dart';
import 'package:flutter_rms_app/src/controller/interview.dart';
import 'package:flutter_rms_app/src/controller/loading.dart';
import 'package:flutter_rms_app/src/model/OTD/file.dart';
import 'package:flutter_rms_app/src/model/OTD/interview.dart';
import 'package:flutter_rms_app/src/utils/config/color.dart';
import 'package:flutter_rms_app/src/utils/config/fontsize.dart';
import 'package:flutter_rms_app/src/view/component/buttonsave.dart';
import 'package:flutter_rms_app/src/view/component/textinput.dart';
import 'package:flutter_rms_app/src/view/splash/index.dart';
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
  bool isPhongVan = false;
  bool isKetLuan = false;
  InterViewController _controller;
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
                  GestureDetector(
                      onTap: () {
                        _controller.moveListPage();
                      },
                      child: const Icon(Icons.arrow_back)),
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
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isPhongVan = !isPhongVan;
                      });
                    },
                    child: Text('Đã phỏng vấn',
                        style: GoogleFonts.roboto(
                            fontSize: fontText, fontWeight: FontWeight.w700)),
                  ),
                  Switch(
                    value: isPhongVan,
                    onChanged: (value) {
                      setState(() {
                        isPhongVan = value;
                      });
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isKetLuan = !isKetLuan;
                      });
                    },
                    child: Text('Kết luận',
                        style: GoogleFonts.roboto(
                            fontSize: fontText, fontWeight: FontWeight.w700)),
                  ),
                  Switch(
                    value: isKetLuan,
                    onChanged: (value) {
                      setState(() {
                        isKetLuan = value;
                      });
                    },
                    activeTrackColor: colorBackgroundLiner,
                    activeColor: colorBackgroundMain,
                  ),
                ],
              ),

              // Hồ Sơ ====================
              isKetLuan
                  ? Column(
                      children: [
                        Divider(),
                        Text('Hồ sơ',
                            style: GoogleFonts.roboto(
                                fontSize: fontTitle,
                                fontWeight: FontWeight.w700)),
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
                          type: TextInputType.url,
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
                          type: TextInputType.number,
                        ),
                      ],
                    )
                  : const SizedBox(),
              const SizedBox(
                height: paddingHor * 2,
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
  void initState() {
    super.initState();
    _controller = InterViewController(context: context);
    _nhanXet = TextEditingController();
    _dateInput = TextEditingController();
    _scan = TextEditingController();
    _nganHang = TextEditingController();
    _soTaiKhoan = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _nhanXet.dispose();
    _dateInput.dispose();
    _scan.dispose();
    _nganHang.dispose();
    _soTaiKhoan.dispose();
  }

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
                press: () {
                  InterViewOTD interView = InterViewOTD();
                  interView.phongVan = '$isPhongVan';
                  interView.nhanXet = _nhanXet.text;
                  interView.ketLuan = '$isKetLuan';
                  FileOTD file = FileOTD();
                  file.timeStart = _dateInput.text;
                  file.scan = _scan.text;
                  file.nganHang = _nganHang.text;
                  file.soTaiKhoan = _soTaiKhoan.text;
                  LoadingController loading = LoadingController(
                      context: context,
                      loading: _controller.postDataInterView(
                          interViewInput: interView,
                          fileInput: file,
                          isKetLuan: isKetLuan));
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SplashPage(
                                controller: loading,
                              )));
                },
              ),
            ),
          )
        ],
      );
}
