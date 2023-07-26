import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'page1.dart';
import 'model.dart';

class Page5 extends StatefulWidget {
  const Page5({super.key});

  @override
  State<Page5> createState() => _Page5State();
}

class _Page5State extends State<Page5> {
  List<Map<String, dynamic>> data = [
    {'id': 1, 'name': 'CVD risk', 'checkbox': true},
    {'id': 2, 'name': 'สิ่งที่ต้องการสนับสนุน', 'checkbox': true},
  ];

  final List<TextEditingController> _controllers = [
    TextEditingController(), //น้ำหนัก [0]
    TextEditingController(), //ส่วนสูง [1]
    TextEditingController(), //เส้นรอบเอว ซม. [2]
    TextEditingController(), //เส้นรอบเอว นิ้ว [3]
    TextEditingController(), //ความดันครั้งที่ 1 [4]
    TextEditingController(), //ความดันครั้งที่ 2 [5]
    TextEditingController(), //DTX การตรวจวัดน้ำตาลในเลือด [6]
    TextEditingController(), //CVDRISKOther [7]
    TextEditingController(), //reportOther [8]
  ];

  final List<String> _textFieldValues = [
    '', // น้ำหนัก[0]
    '', // ส่วนสูง[1]
    '', // bmi[2]
    '', // ผลการวัดผอมอ้วน[3]
    '', // วัดเส้นรอบเอว[4]
  ];

  // 'Weight': _controllers[0].text,
  // 'Height': _controllers[1].text,
  // 'waist_cm': _controllers[2].text,
  // 'waist_in': _controllers[3].text,
  // 'blood_pressure_1': _controllers[4].text,
  // 'blood_pressure_2': _controllers[5].text,
  // 'BMI': _textFieldValues[2],
  // 'BMI_TEXT': _textFieldValues[3],
  // 'WHR': _textFieldValues[4],
  // 'DTX': _textFieldValues[5],
  // 'CVD_risk': checkedState[0],
  // 'CVD_riskOther': _controllers[7].text,
  // 'report': checkedState[1],
  // 'reportOther': _controllers[8].text,

  @override
  void initState() {
    super.initState();
    final dataModel = Provider.of<DataModel>(context, listen: false);
    if (dataModel.page5.isNotEmpty && dataModel.page5.length >= 1) {
      _controllers[0].text = dataModel.page5[0]['Weight'];
      _controllers[1].text = dataModel.page5[0]['Height'];
      _controllers[2].text = dataModel.page5[0]['waist_cm'];
      _controllers[3].text = dataModel.page5[0]['waist_in'];
      _controllers[4].text = dataModel.page5[0]['blood_pressure_1'];
      _controllers[5].text = dataModel.page5[0]['blood_pressure_2'];
      _controllers[6].text = dataModel.page5[0]['DTX'];
      _controllers[7].text = dataModel.page5[0]['CVD_riskOther'];
      _controllers[8].text = dataModel.page5[0]['reportOther'];
      _textFieldValues[2] = dataModel.page5[0]['BMI'];
      _textFieldValues[3] = dataModel.page5[0]['BMI_TEXT'];
      _textFieldValues[4] = dataModel.page5[0]['WHR'];
      checkedState[0] = dataModel.page5[0]['CVD_risk'];
      checkedState[1] = dataModel.page5[0]['report'];
    }
  }

// ฟังก์ชันเพื่อคำนวณค่า BMI จากน้ำหนักและส่วนสูง
  double calculateBMI(double weight, double height) {
    height = height / 100;
    if (height > 0) {
      return weight / (height * height);
    }
    return 0.0;
  }

// อัปเดตค่า BMI ข้างนอก TFF_String โดยเรียกใช้ฟังก์ชัน calculateBMI
  void updateBMI() {
    double weight = double.tryParse(_controllers[0].text) ?? 0.0;
    double height = double.tryParse(_controllers[1].text) ?? 0.0;
    double bmi = calculateBMI(weight, height);
    String result = bmi.toStringAsFixed(2);
    String status = '';
    if (bmi == 0.00) {
      status = '';
    } else if (bmi < 18.5) {
      status = 'อยู่ในเกณฑ์ น้ำหนักน้อย / ผอม ภาวะเสี่ยงต่อโรค มากว่าคนปกติ';
    } else if (bmi >= 18.50 && bmi <= 22.90) {
      status = 'ปกติ (สุขภาพดี) ภาวะเสี่ยงต่อโรค เท่าคนปกติ';
    } else if (bmi >= 23.00 && bmi <= 24.90) {
      status = 'ท้วม / โรคอ้วนระดับ 1 ภาวะเสี่ยงต่อโรค อันตรายระดับ 1';
    } else if (bmi >= 25 && bmi <= 29.90) {
      status = 'อ้วน / โรคอ้วนระดับ 2 ภาวะเสี่ยงต่อโรค อันตรายระดับ 2';
    } else if (bmi >= 30.00) {
      status = 'อ้วนมาก / โรคอ้วนระดับ 3 ภาวะเสี่ยงต่อโรค อันตรายระดับ 3';
    }
    print('BMI: $result $status');
    _textFieldValues[2] = result;
    _textFieldValues[3] = status;
  }

  void updateWHtR() {
    // 1 cm = 0.3937007874 in
    // 1 in = 2.54 cm
    double height = double.tryParse(_controllers[1].text) ?? 0.0;
    double value1 = double.tryParse(_controllers[2].text) ?? 0.0;
    double sum = value1 / height;
    print(sum);
    _textFieldValues[4] = sum.toStringAsFixed(2);
  }

//CVD RISK AND สนับสนุนเพิ่มเติม
  List<bool> checkedState =
      List.filled(2, false); // ตั้งค่าเริ่มต้นให้ทุก Checkbox เป็น false

  void handleCheckboxChanged(int index, bool value) {
    setState(() {
      checkedState[index] = value;
      print(checkedState);
    });
  }

  @override
  Widget build(BuildContext context) {
    DataModel dataModel = Provider.of<DataModel>(context);

    void updatedValue() {
      List<Map<String, dynamic>> formvalues = [
        {
          'Weight': _controllers[0].text,
          'Height': _controllers[1].text,
          'waist_cm': _controllers[2].text,
          'waist_in': _controllers[3].text,
          'blood_pressure_1': _controllers[4].text,
          'blood_pressure_2': _controllers[5].text,
          'BMI': _textFieldValues[2],
          'BMI_TEXT': _textFieldValues[3],
          'WHR': _textFieldValues[4],
          'DTX': _controllers[6].text,
          'CVD_risk': checkedState[0],
          'CVD_riskOther': _controllers[7].text,
          'report': checkedState[1],
          'reportOther': _controllers[8].text,
        }
      ];
      dataModel.setFormValues(formvalues, 5);
      // dataModel.page5[0]['blood_pressure_1'] = _controllers[4].text;
      // dataModel.page5[0]['blood_pressure_2'] = _controllers[5].text;
      // dataModel.page5[0]['CVD_riskOther'] = _controllers[7].text;
      // dataModel.page5[0]['reportOther'] = _controllers[8].text;
      print(dataModel.page5);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text('บันทึกประวัติสุขภาพ'),
        centerTitle: true,
        titleTextStyle:
            const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              updatedValue();
              Navigator.of(context).pop();
            }),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              // Text('TextFormField Value: ${dataModel.page1}'),
              // Text('TextFormField Value: ${dataModel.page2}'),
              // Text('TextFormField Value: ${dataModel.page3}'),
              // Text('TextFormField Value: ${dataModel.page4}'),
              // Text('TextFormField Value: ${dataModel.page5}'),
              // Text('TextFormField Value: ${dataModel.page6}'),
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
                  child: _title(name: '8. ด้านร่างกาย'),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
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
                      _subtitle(name: 'น้ำหนัก(Weight) : Kilogram : kg'),
                      const SizedBox(
                        height: 10,
                      ),
                      TFF_String(
                        text: 'น้ำหนัก(Weight) : Kilogram : kg',
                        controller: _controllers[0],
                        onChanged: (value) {
                          setState(() {
                            updateBMI();
                          });
                        },
                        keyboardType: TextInputType.number,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
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
                      _subtitle(name: 'ส่วนสูง(Height) : Centimeter : cm'),
                      const SizedBox(
                        height: 10,
                      ),
                      TFF_String(
                        text: 'ส่วนสูง(Height) : Centimeter : cm',
                        controller: _controllers[1],
                        onChanged: (value) {
                          setState(() {
                            updateBMI();
                          });
                        },
                        keyboardType: TextInputType.number,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
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
                      _subtitle(name: 'ดัชนีมวลกาย(Body Mess Index) : BMI'),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _subtitle(name: 'ดัชนีมวลกาย : ${_textFieldValues[2] != null &&
                                    _textFieldValues[2].isNotEmpty
                                ? _textFieldValues[2]
                                : '0.0'}'),
                        ],
                      ),
                      // _subtitle(name: _textFieldValues[3]), //เกณฑ์
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
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
                      _subtitle(name: 'วัดเส้นรอบเอว'),
                      const SizedBox(height: 10),
                      _subtitle(name: 'หน่วยเซนติเมตร (ซม.)'),
                      const SizedBox(height: 10),
                      TFF_String(
                        text: 'เซนติเมตร (ซม.)',
                        controller: _controllers[2],
                        onChanged: (value) {
                          setState(() {
                            updateWHtR();
                            double cm = 0.3937007874;
                            double valueDouble =
                                double.tryParse(_controllers[2].text) ?? 0.0;
                            double sum = cm * valueDouble;
                            _controllers[3].text = sum.toStringAsFixed(2);
                            print(sum);
                          });
                        },
                      ),
                      const SizedBox(height: 10),
                      _subtitle(name: 'หน่วยนิ้ว'),
                      const SizedBox(height: 10),
                      TFF_String(
                          text: 'นิ้ว',
                          controller: _controllers[3],
                          onChanged: (value) {
                            setState(() {
                              updateWHtR();
                              double inc = 2.54;
                              double valueDouble =
                                  double.tryParse(_controllers[3].text) ?? 0.0;
                              double sum = inc * valueDouble;
                              _controllers[2].text = sum.toString();
                              print(sum);
                            });
                          }),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _subtitle(name: 'ผลการวัด : ${_textFieldValues[4] != null && //BMI
                                    _textFieldValues[4].isNotEmpty
                                ? _textFieldValues[4]
                                : '0.0'}'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
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
                      _subtitle(name: 'วัดความดัน'),
                      const SizedBox(
                        height: 10,
                      ),
                      _subtitle(name: 'ครั้งที่ 1'),
                      const SizedBox(
                        height: 10,
                      ),
                      TFF_String(
                        text: 'ครั้งที่ 1 : mmHg',
                        keyboardType: TextInputType.number,
                        controller: _controllers[4],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      _subtitle(name: 'ครั้งที่ 2'),
                      const SizedBox(
                        height: 10,
                      ),
                      TFF_String(
                        text: 'ครั้งที่ 2 : mmHg',
                        keyboardType: TextInputType.number,
                        controller: _controllers[5],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
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
                      _subtitle(name: 'การตรวจวัดน้ำตาลในเลือด'),
                      const SizedBox(height: 5.0),
                      TFF_String(
                        text: 'DTX : mg%',
                        controller: _controllers[6],
                        onChanged: ((value) {
                          setState(() {
                            _controllers[6].text = value;
                          });
                        }),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
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
                      _listbox(
                        titles: data,
                        checkedState: checkedState,
                        onChanged: handleCheckboxChanged,
                        textOther: true,
                        controllers: [_controllers[7], _controllers[8]],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // if (_formKey.currentState!.validate()) {
                    updatedValue();
                    Navigator.pushNamed(context, '/page6');
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
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
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

Widget _listbox({
  required List<Map<String, dynamic>> titles,
  required List<bool> checkedState,
  required void Function(int, bool) onChanged,
  bool? textOther,
  List<TextEditingController>? controllers, // Add the controller parameter
}) {
  return Column(
    children: List.generate(titles.length, (index) {
      return Column(
        children: [
          CheckboxListTile(
            value: checkedState[index],
            onChanged: (value) {
              onChanged(index, value ?? false);
            },
            title: Text(titles[index]['name']),
            controlAffinity: ListTileControlAffinity.leading,
          ),
          if (textOther == true &&
              titles[index]['checkbox'] == true &&
              checkedState[index])
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextFormField(
                controller: controllers?[index], // Assign the controller
                decoration: InputDecoration(
                  labelText: 'ระบุ',
                  hintText: 'โปรดระบุ',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'โปรดระบุ${titles[index]['name']}';
                  }
                  return null;
                },
              ),
            ),
        ],
      );
    }),
  );
}
