import 'package:flutter/material.dart';
import 'package:myproject/Screens/menu/createform1/page1.dart';
import 'package:provider/provider.dart';
import 'model.dart';

class Page4 extends StatefulWidget {
  Page4({super.key});
  List<int> selectedIds = List.filled(4, 0);
  @override
  State<Page4> createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  List<Map<String, dynamic>> answer3 = [
    {'id': 1, 'name': 'รับการรักษาอยู่/ปฏิบัติตามแพทย์แนะนำ'},
    {'id': 2, 'name': 'รับการรักษา แต่ไม่สม่ำเสมอ'},
    {'id': 3, 'name': 'เคยรักษา ขณะที่ไม่รักษา/หายาทานเอง'},
  ];
  List<Map<String, dynamic>> answer4 = [
    {'id': 1, 'name': 'สูบ'},
    {'id': 2, 'name': 'ไม่สูบ'},
    {'id': 3, 'name': 'เคยแต่เลิกสูบแล้ว'},
  ];
  List<Map<String, dynamic>> answer5 = [
    {'id': 1, 'name': 'ดื่ม'},
    {'id': 2, 'name': 'ไม่ดื่ม'},
    {'id': 3, 'name': 'เคยดื่มแต่เลิกแล้ว'},
  ];
  List<Map<String, dynamic>> answer6 = [
    {'id': 1, 'name': 'ออกกำลังกายทุกวัน ครั้งละ 30 นาที'},
    {
      'id': 2,
      'name': 'ออกกำลังกายสัปดาห์ละมากกว่า 3 ครั้ง ครั้งละ 30 นาที สม่ำเสมอ'
    },
    {'id': 3, 'name': 'ออกกำลังกายสัปดาห์ละ 3 ครั้ง ครั้งละะ 30 นาที สม่ำเสมอ'},
    {'id': 4, 'name': 'ออกกำลังกายน้อยกว่าสัปดาห์ละ 3 ครั้ง'},
    {'id': 5, 'name': 'ไม่ออกกำลังกายเลย'},
  ];
  List<Map<String, dynamic>> answer7 = [
    {'id': 1, 'name': 'หวาน'},
    {'id': 2, 'name': 'เค็ม'},
    {'id': 3, 'name': 'มัน'},
    {'id': 4, 'name': 'ไม่ชอบทุกข้อ'},
  ];

  final List<TextEditingController> _controllers = [
    TextEditingController(), // จำนวนม้วน[0]
    TextEditingController(), // จำนวนแพ็ค[1]
    TextEditingController(), // ชนิดของบุหรี่[2]
    TextEditingController(), // ระยะเวลา[3]
    TextEditingController(), // จำนวนม้วน[4]
    TextEditingController(), // จำนวนแพ็ค[5]
    TextEditingController(), // ดื่ม[6]
  ];
  @override
  void initState() {
    super.initState();
    final dataModel = Provider.of<DataModel>(context, listen: false);
    if (dataModel.page4.isNotEmpty && dataModel.page4.length >= 1) {
      widget.selectedIds[0] = dataModel.page4[0]['D1'] ?? 0;
      widget.selectedIds[1] = dataModel.page4[0]['D2'] ?? 0;
      widget.selectedIds[2] = dataModel.page4[0]['D3'] ?? 0;
      widget.selectedIds[3] = dataModel.page4[0]['D4'] ?? 0;
      _controllers[0].text = dataModel.page4[1]['T1'] ?? '';
      _controllers[1].text = dataModel.page4[1]['T2'] ?? '';
      _controllers[2].text = dataModel.page4[1]['T3'] ?? '';
      _controllers[3].text = dataModel.page4[1]['T4'] ?? '';
      _controllers[4].text = dataModel.page4[1]['T5'] ?? '';
      _controllers[5].text = dataModel.page4[1]['T6'] ?? '';
      _controllers[6].text = dataModel.page4[1]['T7'] ?? '';
      selectStates[0] = dataModel.page4[2]['sweet'] ?? false;
      selectStates[1] = dataModel.page4[2]['salty'] ?? false;
      selectStates[2] = dataModel.page4[2]['oil'] ?? false;
      selectStates[3] = dataModel.page4[2]['notlike'] ?? false;
    }
    print('dropdown : ${widget.selectedIds}');
    print('dataModel : ${dataModel.page4}');
  }

  List<bool> selectStates = List.generate(4, (index) => false);

  void handleselectStateChanged(int index, bool state) {
    setState(() {
      selectStates[index] = state;
    });
    print(selectStates);
  }

  @override
  Widget build(BuildContext context) {
    DataModel dataModel = Provider.of<DataModel>(context);

    void updateValue() {
      List<Map<String, dynamic>> formValues = [
        {
          'D1': widget.selectedIds[0], // selectedId1
          'D2': widget.selectedIds[1], // selectedId2
          'D3': widget.selectedIds[2], // selectedId3
          'D4': widget.selectedIds[3], // selectedId4
        },
        {
          'T1': _controllers[0].text, // จำนวนม้วน
          'T2': _controllers[1].text, // จำนวน pack ต่อปี
          'T3': _controllers[2].text, // ชนิดของบุหรี่
          'T4': _controllers[3].text, // ระยะเวลา
          'T5': _controllers[4].text, // จำนวนม้วนต่อปี 3
          'T6': _controllers[5].text, // จำนวน pack ต่อปี 3
          'T7': _controllers[6].text, // ดื่มเหล้า
        },
        {
          'sweet': selectStates[0],
          'salty': selectStates[1],
          'oil': selectStates[2],
          'notlike': selectStates[3],
        }
      ];
      dataModel.setFormValues(formValues, 4);
      // dataModel.page4[1]['T1'] = _controllers[0].text ??
      //     ''; //แก้ไขปัญหาอัพเดทแล้ว  textfield ไม่ตามไม่ทราบวิธีแก้ใช้วิธีแก้นี้เบื้องต้น
      // dataModel.page4[1]['T2'] = _controllers[1].text ?? '';
      // dataModel.page4[1]['T3'] = _controllers[2].text ?? '';
      // dataModel.page4[1]['T4'] = _controllers[3].text ?? '';
      // dataModel.page4[1]['T5'] = _controllers[4].text ?? '';
      // dataModel.page4[1]['T6'] = _controllers[5].text ?? '';
      // dataModel.page4[1]['T7'] = _controllers[6].text ?? '';
      print('dataModel : ${dataModel.page4}');
    }

    void updateSelectedId1(int index, int id) {
      setState(() {
        widget.selectedIds[0] = id;
        updateValue();
      });
    }

    void updateSelectedId2(int index, int id) {
      setState(() {
        widget.selectedIds[1] = id;
        updateValue();
      });
    }

    void updateSelectedId3(int index, int id) {
      setState(() {
        widget.selectedIds[2] = id;
        updateValue();
      });
    }

    void updateSelectedId4(int index, int id) {
      setState(() {
        widget.selectedIds[3] = id;
        updateValue();
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
        child: Column(
          children: [
            // Text('TextFormField Value: ${dataModel.page1}'),
            // Text('TextFormField Value: ${dataModel.page2}'),
            // Text('TextFormField Value: ${dataModel.page3}'),
            // Text('TextFormField Value: ${dataModel.page4}'),
            // Text('TextFormField Value: ${dataModel.page5}'),
            // Text('TextFormField Value: ${dataModel.page6}'),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
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
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: _title(
                          name:
                              '3. กรณีท่านมีประวัติเจ็บป่วย ตามข้อ 2 ท่านปฏิบัติตนอย่างไร'),
                    ),
                    const SizedBox(height: 10),
                    DropdownWidget(
                      titles: answer3,
                      values: widget.selectedIds[0],
                      onChanged: updateSelectedId1,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
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
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: _title(name: '4. ท่านสูบบุหรี่หรือไม่'),
                    ),
                    const SizedBox(height: 10),
                    DropdownWidgetId4(
                      titles: answer4,
                      values: widget.selectedIds[1],
                      controller: _controllers,
                      onChanged: updateSelectedId2,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
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
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: _title(
                          name: '5. ท่านดื่มเครื่องดื่มที่มีแอลกอฮอล์หรือไม่'),
                    ),
                    const SizedBox(height: 10),
                    DropdownWidgetId5(
                      titles: answer5,
                      values: widget.selectedIds[2],
                      controllers: _controllers[6],
                      onChanged: updateSelectedId3,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
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
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: _title(name: '6. ท่านออกกำลังกาย/เล่นกีฬา'),
                    ),
                    const SizedBox(height: 10),
                    DropdownWidget(
                      titles: answer6,
                      values: widget.selectedIds[3],
                      onChanged: updateSelectedId4,
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
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
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: _title(
                          name: '7. ท่านชอบอาหารรสใด (เลือกได้มากกว่า 1 ข้อ)'),
                    ),
                    const SizedBox(height: 10),
                    _listbox(
                        titles: answer7,
                        checkedState: selectStates,
                        onChanged: handleselectStateChanged),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // if (_formKey.currentState!.validate()) {
                  updateValue();
                  Navigator.pushNamed(context, '/page5');
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

//ข้อ 3
class DropdownWidget extends StatefulWidget {
  final List<Map<String, dynamic>> titles;
  final int values;
  final void Function(int, int) onChanged;

  DropdownWidget({
    Key? key,
    required this.titles,
    required this.values,
    required this.onChanged,
  }) : super(key: key);

  @override
  _DropdownWidgetState createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  bool hasAddedSpecifyOption = false;

  @override
  Widget build(BuildContext context) {
    int selectedId = widget.values; // เลือกค่า selectedId อันแรก
    List<DropdownMenuItem<int>> items = _buildDropdownItems();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8.0),
              border: Border.all(color: Colors.grey),
            ),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<int>(
                value: selectedId,
                onChanged: (int? value) {
                  widget.onChanged(
                      0,
                      value ??
                          -1); // ให้ index เป็น 0 เพื่อให้อัปเดตค่าใน selectedId อันแรก
                },
                items: items,
              ),
            ),
          ),
        ),
      ],
    );
  }

  List<DropdownMenuItem<int>> _buildDropdownItems() {
    List<DropdownMenuItem<int>> items = [];

    if (!hasAddedSpecifyOption) {
      // เพิ่ม "ระบุ" เข้าไปในรายการ options ครั้งเดียว
      widget.titles.insert(0, {'id': 0, 'name': 'ระบุ'});
      hasAddedSpecifyOption = true; // ตั้งค่าเป็น true เพื่อไม่ให้เพิ่มอีก

      for (var item in widget.titles) {
        items.add(DropdownMenuItem<int>(
          value: item['id'] as int,
          child: SizedBox(
            width: 300,
            child: Text(
              item['name'] as String,
              softWrap: true,
            ),
          ),
        ));
      }

      return items;
    }

    // กรณีที่มี "ระบุ" อยู่แล้ว ไม่ต้องเพิ่มใหม่
    for (var item in widget.titles) {
      items.add(DropdownMenuItem<int>(
        value: item['id'] as int,
        child: SizedBox(
          width: 300,
          child: Text(
            item['name'] as String,
            softWrap: true,
          ),
        ),
      ));
    }

    return items;
  }
}

//ข้อ 4
class DropdownWidgetId4 extends StatefulWidget {
  final List<Map<String, dynamic>> titles;
  final int values;
  List<TextEditingController>? controller;
  final void Function(int, int) onChanged;

  DropdownWidgetId4({
    Key? key,
    required this.titles,
    required this.values,
    this.controller,
    required this.onChanged,
  }) : super(key: key);

  @override
  _DropdownWidgetId4State createState() => _DropdownWidgetId4State();
}

class _DropdownWidgetId4State extends State<DropdownWidgetId4> {
  // List<TextEditingController> controllers = [];
  bool hasAddedSpecifyOption = false;

  @override
  Widget build(BuildContext context) {
    int selectedId = widget.values; // เลือกค่า selectedId อันแรก
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: Colors.grey),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<int>(
                  value: selectedId,
                  onChanged: (value) {
                    setState(() {
                      widget.onChanged(
                          0,
                          value ??
                              -1); // ให้ index เป็น 0 เพื่อให้อัปเดตค่าใน selectedId อันแรก
                    });
                  },
                  items: _buildDropdownItems(),
                ),
              ),
            ),
          ),
          if (selectedId == 1)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                margin: const EdgeInsets.symmetric(vertical: 16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.grey),
                ),
                child: Column(
                  children: [
                    _subtitle(name: 'จำนวนม้วนต่อวัน'),
                    SizedBox(
                      height: 10,
                    ),
                    TFF_String(
                      text: 'จำนวนม้วนต่อวัน',
                      controller: widget.controller![0],
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        widget.controller![0].text = value;
                        print(widget.controller?[0].text);
                      },
                    ),
                    _subtitle(name: 'จำนวน Pack ต่อปี'),
                    SizedBox(
                      height: 10,
                    ),
                    TFF_String(
                      text: 'จำนวน Pack ต่อปี',
                      controller: widget.controller![1],
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        widget.controller![1].text = value;
                      },
                    ),
                    _subtitle(name: 'ชนิดของบุหรี่'),
                    SizedBox(
                      height: 10,
                    ),
                    TFF_String(
                      text: 'ชนิดของบุหรี่',
                      controller: widget.controller![2],
                      onChanged: (value) {
                        widget.controller![2].text = value;
                      },
                    ),
                    _subtitle(
                        name:
                            'ระยะเวลากี่ปี (ตั้งแต่เริ่มสูบบุหรี่จนถึงปัจจุบัน'),
                    SizedBox(
                      height: 10,
                    ),
                    TFF_String(
                      text:
                          'ระยะเวลากี่ปี (ตั้งแต่เริ่มสูบบุหรี่จนถึงปัจจุบัน)',
                      controller: widget.controller![3],
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        widget.controller![3].text = value;
                      },
                    ),
                  ],
                ),
              ),
            ),
          if (selectedId == 3)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                margin: const EdgeInsets.symmetric(vertical: 16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.grey),
                ),
                child: Column(
                  children: [
                    _subtitle(name: 'จำนวนม้วนต่อวัน'),
                    SizedBox(
                      height: 10,
                    ),
                    TFF_String(
                      text: 'จำนวนม้วนต่อวัน',
                      controller: widget.controller![4],
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        widget.controller![4].text = value;
                      },
                    ),
                    _subtitle(name: 'จำนวน Pack ต่อปี'),
                    SizedBox(
                      height: 10,
                    ),
                    TFF_String(
                      text: 'จำนวน Pack ต่อปี',
                      controller: widget.controller![5],
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        widget.controller![5].text = value;
                      },
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  List<DropdownMenuItem<int>> _buildDropdownItems() {
    List<DropdownMenuItem<int>> items = [];

    if (!hasAddedSpecifyOption) {
      // เพิ่ม "ระบุ" เข้าไปในรายการ options ครั้งเดียว
      widget.titles.insert(0, {'id': 0, 'name': 'ระบุ'});
      hasAddedSpecifyOption = true; // ตั้งค่าเป็น true เพื่อไม่ให้เพิ่มอีก

      for (var item in widget.titles) {
        items.add(DropdownMenuItem<int>(
          value: item['id'] as int,
          child: SizedBox(
            width: 300,
            child: Text(
              item['name'] as String,
              softWrap: true,
            ),
          ),
        ));
      }

      return items;
    }

    // กรณีที่มี "ระบุ" อยู่แล้ว ไม่ต้องเพิ่มใหม่
    for (var item in widget.titles) {
      items.add(DropdownMenuItem<int>(
        value: item['id'] as int,
        child: SizedBox(
          width: 300,
          child: Text(
            item['name'] as String,
            softWrap: true,
          ),
        ),
      ));
    }

    return items;
  }
}

//ข้อ 5
class DropdownWidgetId5 extends StatefulWidget {
  final List<Map<String, dynamic>> titles;
  final int values;
  TextEditingController? controllers;
  final void Function(int, int) onChanged;

  DropdownWidgetId5({
    super.key,
    required this.titles,
    required this.values,
    this.controllers,
    required this.onChanged,
  });

  @override
  _DropdownWidgetId5State createState() => _DropdownWidgetId5State();
}

class _DropdownWidgetId5State extends State<DropdownWidgetId5> {
  bool hasAddedSpecifyOption = false;

  @override
  Widget build(BuildContext context) {
    int selectedValue = widget.values;
    return Align(
      alignment: Alignment.centerLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(color: Colors.grey),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<int>(
                  value: selectedValue,
                  onChanged: (value) {
                    setState(() {
                      widget.onChanged(0, value ?? -1);
                      // ให้ index เป็น 0 เพื่อให้อัปเดตค่าใน selectedId อันแรก
                    });
                  },
                  items: _buildDropdownItems(),
                ),
              ),
            ),
          ),
          if (selectedValue == 1)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                // The container that appears if 'สูบ' is selected
                padding: const EdgeInsets.all(16.0),
                margin: const EdgeInsets.symmetric(vertical: 16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.grey),
                ),
                child: Column(
                  children: [
                    _subtitle(name: 'ดื่มกี่ครั้งต่อสัปดาห์'),
                    const SizedBox(
                      height: 5.0,
                    ),
                    TFF_String(
                      text: 'ระบุดื่มกี่ครั้งต่อสัปดาห์',
                      controller: widget.controllers,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        widget.controllers!.text = value;
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    const Text(
                      '*ดื่มเหล้า > 45 cc ต่อวัน/ดื่มเบียร์ > 240 cc ต่อวัน/ดื่มไวน์ > 120 cc ต่อวัน',
                      style: TextStyle(
                        color: Color(0xFFF44336),
                      ),
                    )
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  List<DropdownMenuItem<int>> _buildDropdownItems() {
    List<DropdownMenuItem<int>> items = [];

    if (!hasAddedSpecifyOption) {
      // เพิ่ม "ระบุ" เข้าไปในรายการ options ครั้งเดียว
      widget.titles.insert(0, {'id': 0, 'name': 'ระบุ'});
      hasAddedSpecifyOption = true; // ตั้งค่าเป็น true เพื่อไม่ให้เพิ่มอีก

      for (var item in widget.titles) {
        items.add(DropdownMenuItem<int>(
          value: item['id'] as int,
          child: SizedBox(
            width: 300,
            child: Text(
              item['name'] as String,
              softWrap: true,
            ),
          ),
        ));
      }

      return items;
    }

    // กรณีที่มี "ระบุ" อยู่แล้ว ไม่ต้องเพิ่มใหม่
    for (var item in widget.titles) {
      items.add(DropdownMenuItem<int>(
        value: item['id'] as int,
        child: SizedBox(
          width: 300,
          child: Text(
            item['name'] as String,
            softWrap: true,
          ),
        ),
      ));
    }

    return items;
  }
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
        ],
      );
    }),
  );
}
