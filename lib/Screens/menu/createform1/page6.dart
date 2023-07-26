import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:provider/provider.dart';
import 'model.dart';
import 'signature.dart';

class Page6 extends StatefulWidget {
  final Uint8List? signatureBytes;
  Page6({super.key, required this.signatureBytes});

  @override
  State<Page6> createState() => _Page6State();
}

class _Page6State extends State<Page6> {
  List<Map<String, dynamic>> data2 = [
    {'id': 1, 'name': 'ไม่พบความเสี่ยง'},
    {'id': 2, 'name': 'พบความเสี่ยงเบื้องต้นต่อโรค'},
  ];
  List<Map<String, dynamic>> data3 = [
    {'id': 3, 'name': 'DM'},
    {'id': 4, 'name': 'HT'},
    {'id': 5, 'name': 'Stroke'},
    {'id': 6, 'name': 'Obesity'},
    {'id': 7, 'name': 'หัวใจและหลอดเลือด'},
  ];

  List<Map<String, dynamic>> data4 = [
    {'id': 1, 'name': 'ยินยอม'},
  ];
//ของสรุป
  List<bool> checkedState2 =
      List.filled(2, false); // ตั้งค่าเริ่มต้นให้ทุก Checkbox เป็น false

  List<bool> checkedState3 =
      List.filled(5, false); // ตั้งค่าเริ่มต้นให้ทุก Checkbox เป็น false

//ของยินยอม
  List<bool> checkedState4 =
      List.filled(1, false); // ตั้งค่าเริ่มต้นให้ทุก Checkbox เป็น false

  @override
  void initState() {
    super.initState();
    final dataModel = Provider.of<DataModel>(context, listen: false);
    if (dataModel.page6.isNotEmpty && dataModel.page6.length >= 1) {
      checkedState2 = dataModel.page6[0]['smlist'];
      checkedState3 = dataModel.page6[0]['sub_smlist'];
      checkedState4 = dataModel.page6[0]['accept'];
    }
    print('init');
  }

  @override
  Widget build(BuildContext context) {
    DataModel dataModel = Provider.of<DataModel>(context);

    void updateValue() {
      List<Map<String, dynamic>> formvalues = [
        {
          'smlist': checkedState2,
          'sub_smlist': checkedState3,
          'accept': checkedState4,
        }
      ];
      dataModel.setFormValues(formvalues, 6);
    }

    void handleCheckbox2Changed(int index, bool value) {
      setState(() {
        checkedState2[index] = value;
        updateValue();
        print(checkedState2);
      });
    }

    void handleCheckbox3Changed(int index, bool value) {
      setState(() {
        checkedState3[index] = value;
        updateValue();
        print(checkedState3);
      });
    }

    void handleCheckbox4Changed(int index, bool value) {
      setState(() {
        checkedState4[index] = value;
        updateValue();
        print(checkedState4);
      });
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
              updateValue();
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
                      _subtitle(name: 'สรุปผลการตรวจคัดกรอก'),
                      _listbox(
                        titles: data2,
                        checkedState: checkedState2,
                        onChanged: handleCheckbox2Changed,
                        textOther: false,
                      ),
                      if (checkedState2[1] == true)
                        Padding(
                          padding: const EdgeInsets.only(left: 50.0),
                          child: _listbox(
                            titles: data3,
                            checkedState: checkedState3,
                            onChanged: handleCheckbox3Changed,
                          ),
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
                      _subtitle(
                        name:
                            'คุณยินยอมให้เปิดเผยข้อมูลสุขภาพสำหรับหน่วยบริการสุขภาพ',
                      ),
                      _listbox(
                        titles: data4,
                        checkedState: checkedState4,
                        onChanged: handleCheckbox4Changed,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              if (checkedState4[0] == true)
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
                        _title(
                          name: 'ลงชื่อผู้ส่ง',
                        ),
                        if (widget.signatureBytes != null)
                          Image.memory(
                            widget.signatureBytes!,
                            width: 100,
                            height: 100,
                          ),
                        if (widget.signatureBytes == null)
                          Column(
                            children: [
                              SizedBox(
                                height: 100,
                                child: Text('กรุณาลงชื่อ'),
                              ),
                            ],
                          ),
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      SignaturePage(), // คลาสที่คุณต้องการเปิดหน้าใหม่
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue[500],
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                'ลงชื่อ',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
                          ),
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
                    updateValue();
                    Navigator.pushNamed(context, '/checkdata');
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
                      'บันทึก',
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

Widget _title({required String name}) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Text(
      name,
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
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
                // controller: controller,
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
