//libary
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';
import 'page2.dart';
import 'model.dart';

class AddHealth extends StatefulWidget {
  const AddHealth({super.key});
  @override
  State<AddHealth> createState() => _AddHealthState();
}

class _AddHealthState extends State<AddHealth> {
  final _formKey = GlobalKey<FormState>();
  final List<TextEditingController> _controllers = [
    TextEditingController(), // ชื่อนามสกุล[0]
    TextEditingController(), // อายุ[1]
    TextEditingController(), // บัตรประชาชน[2]
    TextEditingController(), // ที่อยู่[3]
    TextEditingController(), // โทรศัพท์[4]
    TextEditingController(), // สิทธิการรักษาอื่นๆ[5]
  ];
  final List<String> _textFieldValues = [
    '', //ID เพศ [1]
    '', //ID สิทธิการรักษา [2]
  ];
  List<Map<String, dynamic>> sex = [
    {'id': 0, 'name': 'ระบุ'},
    {'id': 1, 'name': 'ชาย'},
    {'id': 2, 'name': 'หญิง'},
  ];

  List<Map<String, dynamic>> healths = [
    {'id': 0, 'name': 'ระบุ'},
    {'id': 1, 'name': 'ผู้ประกันตน'},
    {'id': 2, 'name': 'ข้าราชการ'},
    {'id': 3, 'name': 'สิทธิหลักประกันสุขภาพถ้วนหน้า'},
    {'id': 4, 'name': 'อื่นๆ ระบุ'},
  ];
  @override
  Widget build(BuildContext context) {
    DataModel dataModel = Provider.of<DataModel>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text('ข้อมูลผู้ป่วย'),
        centerTitle: true,
        titleTextStyle:
            const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.of(context).pop();
              dataModel.resetform();
            }),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    // Text('TextFormField Value: ${dataModel.page1}'),
                    const SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5,
                                spreadRadius: 1,
                                offset: Offset(4, 4)),
                          ],
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: _title(name: 'ข้อมูลผู้ป่วย'),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5,
                                spreadRadius: 1,
                                offset: Offset(4, 4)),
                          ],
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            _subtitle(name: 'ระบุชื่อ-นามสกุล'),
                            const SizedBox(height: 10),
                            TFF_String(
                              text: 'ระบุชื่อ-นามสกุล',
                              controller: _controllers[0],
                              isNum: false,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5,
                                spreadRadius: 1,
                                offset: Offset(4, 4)),
                          ],
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _subtitle(name: 'อายุ'),
                              const SizedBox(height: 10.0),
                              TFF_String(
                                text: 'ระบุอายุ',
                                controller: _controllers[1],
                                keyboardType: TextInputType.number,
                                isNum: true,
                              ),
                            ]),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5,
                                spreadRadius: 1,
                                offset: Offset(4, 4)),
                          ],
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _subtitle(name: 'เพศ'),
                              const SizedBox(height: 10.0),
                              DDownOther(
                                values: const [true, false, false],
                                onChanged: (index, value) {
                                  print(
                                      'Dropdown item at index $index changed to $value');
                                  _textFieldValues[0] = index.toString();
                                },
                                titles: sex,
                                textOther: false,
                              ),
                            ]),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5,
                                spreadRadius: 1,
                                offset: Offset(4, 4)),
                          ],
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _subtitle(name: 'บัตรประจำตัวประชาชน'),
                            const SizedBox(height: 10.0),
                            TFF_String(
                              text: 'ระบุบัตรประชาชน',
                              validator: thaiNationalIDValidator,
                              controller: _controllers[2],
                              keyboardType: TextInputType.number,
                              isNum: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5,
                                spreadRadius: 1,
                                offset: Offset(4, 4)),
                          ],
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _subtitle(name: 'สิทธิการรักษา'),
                            const SizedBox(height: 10.0),
                            DDownOther(
                              values: const [
                                true,
                                false,
                                false,
                                false,
                                false,
                              ],
                              onChanged: (index, value) {
                                print(
                                    'Dropdown item at index $index changed to $value');
                                _textFieldValues[1] = index.toString();
                              },
                              titles: healths,
                              width: 300.0,
                              textOther: true,
                              controller: _controllers[5],
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5,
                                spreadRadius: 1,
                                offset: Offset(4, 4)),
                          ],
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _subtitle(name: 'ที่อยู่'),
                            const SizedBox(height: 10.0),
                            TFF_String(
                              text: 'ระบุที่อยู่',
                              controller: _controllers[3],
                              maxLines: 4,
                              isNum: false,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                                color: Colors.grey,
                                blurRadius: 5,
                                spreadRadius: 1,
                                offset: Offset(4, 4)),
                          ],
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _subtitle(name: 'เบอร์โทรศัพท์'),
                            const SizedBox(height: 10.0),
                            TFF_String(
                              text: 'ระบุเบอร์โทรศัพท์',
                              controller: _controllers[4],
                              keyboardType: TextInputType.phone,
                              isNum: true,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    List<Map<String, dynamic>> formValues = [
                      {
                        'fullname': _controllers[0].text,
                        'age': _controllers[1].text,
                        'sex': _textFieldValues[0],
                        'nationalId': _controllers[2].text,
                        'treatment_rt': _textFieldValues[1],
                        'treatment_rtOther': _controllers[5].text,
                        'address': _controllers[3].text,
                        'phoneNumber': _controllers[4].text,
                      }
                    ];
                    // if (_formKey.currentState!.validate()) {
                    dataModel.setFormValues(formValues, 1);
                    Navigator.pushNamed(context, '/page2');
                    // }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[500],
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'ถัดไป',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

typedef TextFieldChangedCallback = void Function(String value);
Widget TFF_String({
  String? text,
  FormFieldValidator<String>? validator,
  double? width,
  int? maxLines,
  final TextEditingController? controller,
  TextFieldChangedCallback? onChanged,
  TextInputType? keyboardType,
  bool? isNum,
}) {
  final _controller = controller ?? TextEditingController();
  return SizedBox(
    width: width,
    child: TextFormField(
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: text,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      validator: (value) {
        if (validator != null) {
          return validator(value);
        }
        if (value == null || value.isEmpty) {
          return 'โปรด${text}';
        }
        if (isNum == true) {
          if (!isNumber(value)) {
            return 'โปรด${text}เป็นตัวเลขเท่านั้น';
          }
        }
        return null;
      },
      controller: _controller,
      onChanged: onChanged != null ? (value) => onChanged(value) : null,
      keyboardType: keyboardType,
    ),
  );
}

bool isNumber(value) {
  final isNumber = RegExp(r'^[0-9]+$').hasMatch(value);
  return isNumber;
}

class DDownOther extends StatefulWidget {
  final List<bool> values;
  final void Function(int, bool) onChanged;
  final List<Map<String, dynamic>> titles;
  final double? width;
  final FormFieldValidator<int>? validator;
  final bool? textOther;
  final TextEditingController? controller;

  DDownOther({
    required this.values,
    required this.onChanged,
    required this.titles,
    this.width = 200.0,
    this.validator,
    this.textOther,
    this.controller,
  });

  @override
  _DDownOtherState createState() => _DDownOtherState();
}

class _DDownOtherState extends State<DDownOther> {
  bool showOtherTextField = false;
  TextEditingController _otherTextController = TextEditingController();
  @override
  void initState() {
    super.initState();
    // ถ้า widget.controller มีค่า ให้ใช้ค่านั้นเป็น controller ที่ต้องใช้
    // ถ้า widget.controller ไม่มีค่า ให้ใช้ _otherTextController ที่สร้างไว้เพื่อใช้งาน
    _otherTextController = widget.controller ?? TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: Colors.grey),
            ),
            child: DropdownButtonFormField<String>(
              value: _getSelectedValue(),
              onChanged: (String? value) {
                int index =
                    widget.titles.indexWhere((title) => title['name'] == value);
                if (index >= 0) {
                  setState(() {
                    showOtherTextField = (index == widget.titles.length - 1);
                  });
                  widget.onChanged(index, widget.values[index]);
                }
              },
              items: widget.titles.map((title) {
                return DropdownMenuItem<String>(
                  value: title['name'],
                  child: Text(title['name'] as String),
                );
              }).toList(),
              validator: (value) {
                int index =
                    widget.titles.indexWhere((title) => title['name'] == value);
                if (index == 0) {
                  return 'โปรดระบุ';
                }
                return null;
              },
              decoration: const InputDecoration.collapsed(hintText: ''),
            ),
          ),
        ),
        if (showOtherTextField && widget.textOther == true)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: TFF_String(
              text: 'ระบุอื่นๆ',
              controller: _otherTextController,
            ),
          ),
      ],
    );
  }

  String? _getSelectedValue() {
    int selectedIndex = widget.values.indexOf(true);
    if (selectedIndex >= 0) {
      return widget.titles[selectedIndex]['name'] as String;
    }
    return null;
  }
}

String? thaiNationalIDValidator(String? value) {
  if (value == null || value.isEmpty) {
    return 'โปรดระบุเลขบัตรประจำตัวประชาชน';
  }

  final RegExp thaiIDRegExp = RegExp(r'^[1-4]\d{12}$');
  if (!thaiIDRegExp.hasMatch(value)) {
    return 'เลขบัตรประจำตัวประชาชนไม่ถูกต้อง';
  }

  // Validate the checksum (last digit)
  int sum = 0;
  for (int i = 0; i < 12; i++) {
    sum += int.parse(value[i]) * (13 - i);
  }

  int checksum = (11 - (sum % 11)) % 10;
  if (checksum != int.parse(value[12])) {
    return 'เลขบัตรประจำตัวประชาชนไม่ถูกต้อง';
  }

  return null; // Return null if the validation is successful
}

Widget _title({required String name}) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Text(
      name,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
    ),
  );
}

Widget _subtitle({required String name}) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Text(
        name,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
    ),
  );
}
