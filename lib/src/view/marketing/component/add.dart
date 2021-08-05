import 'package:flutter/material.dart';
import 'package:flutter_rms_app/src/controller/marketing.dart';
import 'package:flutter_rms_app/src/model/OTD/marketing.dart';
import 'package:flutter_rms_app/src/model/global/page/marketing.dart';
import 'package:flutter_rms_app/src/utils/config/color.dart';
import 'package:flutter_rms_app/src/utils/config/fontsize.dart';
import 'package:flutter_rms_app/src/view/component/buttonsave.dart';
import 'package:flutter_rms_app/src/view/component/textinput.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MarketingAdd extends StatefulWidget {
  const MarketingAdd({Key key}) : super(key: key);

  @override
  State<MarketingAdd> createState() => _MarketingAddState();
}

class _MarketingAddState extends State<MarketingAdd> {
  TextEditingController _kenhDK;
  TextEditingController _tenBai;
  TextEditingController _minhChung;
  TextEditingController _chiPhi;
  TextEditingController dateStartInput = TextEditingController();
  TextEditingController dateEndInput = TextEditingController();
  MarketingController _controller;
  bool isSwitched = false;

  String _selectedID;
  List<String> items = [];

  MarketingModel marketingModel;

  Widget scaffold(BuildContext context) => Consumer<MarketingModel>(
        builder: (context, value, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(
                vertical: paddingVer, horizontal: paddingHor),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    Text('Thêm bài viết',
                        style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                          color: colorBackgroundMain,
                          fontSize: fontTitle,
                          fontWeight: FontWeight.w700,
                        )))
                  ],
                ),
                Expanded(
                  child: ListView(
                    children: [
                      const SizedBox(
                        height: paddingHor,
                      ),
                      TextInput(
                        controller: _kenhDK,
                        label: 'Kênh đăng ký',
                        maxLine: 30,
                      ),
                      const SizedBox(
                        height: paddingHor,
                      ),
                      TextInput(
                        controller: _tenBai,
                        label: 'Tên bài viết',
                        maxLine: 120,
                      ),
                      const SizedBox(
                        height: paddingHor,
                      ),
                      Container(
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              width: 0.5,
                            )),
                        child: Center(
                          child: DropdownButton(
                            underline: const SizedBox(),
                            hint: const Text('Chọn yêu cầu phù hợp'),
                            value: _selectedID,
                            onChanged: (newValue) {
                              setState(() {
                                _selectedID = newValue;
                              });
                            },
                            items: items.map((e) {
                              return DropdownMenuItem(
                                child: Text(
                                  e,
                                  style: GoogleFonts.roboto(
                                      fontSize: fontMini,
                                      fontWeight: FontWeight.w700),
                                ),
                                value: e.split('-')[0],
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: paddingHor,
                      ),
                      TextInput(
                        controller: dateStartInput,
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
                              dateStartInput.text = formattedDate;
                            });
                          }
                        },
                      ),
                      const SizedBox(
                        height: paddingHor,
                      ),
                      TextInput(
                        controller: dateEndInput,
                        readOnly: true,
                        icon: const Icon(Icons.calendar_today),
                        label: 'Thời gian kết thúc',
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
                              dateEndInput.text = formattedDate;
                            });
                          }
                        },
                      ),
                      const SizedBox(
                        height: paddingHor,
                      ),
                      TextInput(
                        controller: _minhChung,
                        label: 'Minh chứng',
                        maxLine: 120,
                        type: TextInputType.url,
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Chi phí',
                              style: GoogleFonts.roboto(
                                  fontSize: fontText,
                                  fontWeight: FontWeight.w700)),
                          Switch(
                            value: isSwitched,
                            onChanged: (value) {
                              setState(() {
                                isSwitched = value;
                              });
                            },
                            activeTrackColor: colorBackgroundLiner,
                            activeColor: colorBackgroundMain,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: paddingHor,
                      ),
                      isSwitched
                          ? TextInput(
                              controller: _chiPhi,
                              label: 'Chi phí',
                              type: TextInputType.number,
                            )
                          : const SizedBox(),
                      const SizedBox(
                        height: paddingHor * 2,
                      ),
                    ],
                  ),
                ),
                ButtonSave(
                  press: () {
                    if (_selectedID != null) {
                      MarketingOTD value = MarketingOTD();
                      value.kenhDangTuyen = _kenhDK.text;
                      value.tenBai = _tenBai.text;
                      value.idBU = _selectedID;
                      value.timeStart = dateStartInput.text;
                      value.timeEnd = dateEndInput.text;
                      value.minhChung = _minhChung.text;
                      value.chiPhi = _chiPhi.text;
                      _controller.postData(value);
                    }
                  },
                ),
              ],
            ),
          );
        },
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
    _controller = MarketingController(context: context);
    marketingModel = Provider.of<MarketingModel>(context, listen: false);
    dateStartInput.text = "";
    _kenhDK = TextEditingController();
    _tenBai = TextEditingController();
    _minhChung = TextEditingController();
    _chiPhi = TextEditingController();
    items = _controller.getIDBU(marketingModel.listBU);
  }

  @override
  void dispose() {
    _kenhDK.dispose();
    _tenBai.dispose();
    _minhChung.dispose();
    _chiPhi.dispose();
    dateStartInput.dispose();
    dateEndInput.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Stack(
        children: [
          Positioned(
              left: -0, top: 0, bottom: 0, right: 0, child: colorBackground()),
          Positioned(left: -150, top: -150, child: designBackground()),
          scaffold(context),
        ],
      );
}
