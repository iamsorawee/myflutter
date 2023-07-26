import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model.dart';

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  final _formKey = GlobalKey<FormState>();
  List<bool> checkedState1 = List.filled(9, false);
  List<bool> checkedState2 = List.filled(9, false);
  final List<TextEditingController> _controllers = [
    TextEditingController(), // อื่นๆ1.1[0]
    TextEditingController(), // อื่นๆ1.2[1]
  ];
  List<Map<String, dynamic>> answer1 = [
    {'id': 1, 'name': 'เบาหวาน (DM)', 'state': false},
    {'id': 2, 'name': 'ความดันโลหิตสูง (HT)', 'state': false},
    {'id': 3, 'name': 'โรคเก๊าท์ (Gout)', 'state': false},
    {'id': 4, 'name': 'ไตวายเรื้อรัง (CRF)', 'state': false},
    {'id': 5, 'name': 'กล้ามเนื้อหัวใจตาย (MI)', 'state': false},
    {'id': 6, 'name': 'เส้นเลือดสมอง (Stroke)', 'state': false},
    {'id': 7, 'name': 'ถุงลมโป่งพอง (COPD)', 'state': false},
    {'id': 8, 'name': 'ไม่ทราบ', 'state': false},
    {'id': 9, 'name': 'อื่นๆ ระบุ', 'state': true},
  ];
  @override
  void initState() {
    super.initState();
    final dataModel = Provider.of<DataModel>(context, listen: false);
    checkedState1 = dataModel.checkedState1;
    checkedState2 = dataModel.checkedState2;
    if (dataModel.page2.isNotEmpty && dataModel.page2.length >= 1) {
      _controllers[0].text = dataModel.page2[0]['other'];
      _controllers[1].text = dataModel.page2[1]['other'];
    }
    print('init');
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DataModel dataModel = Provider.of<DataModel>(context);

    //update ทุกตัวแปร
    void updateValue() {
          List<Map<String, dynamic>> formValues = [
      {
        'DM': checkedState1[0],
        'HT': checkedState1[1],
        'Gout': checkedState1[2],
        'CRF': checkedState1[3],
        'MI': checkedState1[4],
        'Stroke': checkedState1[5],
        'COPD': checkedState1[6],
        'ไม่ทราบ': checkedState1[7],
        'อื่นๆระบุ': checkedState1[8],
        'other': _controllers[0].text,
      },
      {
        'DM': checkedState2[0],
        'HT': checkedState2[1],
        'Gout': checkedState2[2],
        'CRF': checkedState2[3],
        'MI': checkedState2[4],
        'Stroke': checkedState2[5],
        'COPD': checkedState2[6],
        'ไม่ทราบ': checkedState2[7],
        'อื่นๆระบุ': checkedState2[8],
        'other': _controllers[1].text,
      }
    ];
      dataModel.setFormValues(formValues, 2);
      // dataModel.page2[0]['other'] = _controllers[0].text ?? '';
      // dataModel.page2[1]['other'] = _controllers[1].text ?? '';
    }

    void handleCheckbox1Changed(int index, bool value) {
      setState(() {
        checkedState1[index] = value;
        updateValue();
      });
    }

    void handleCheckbox2Changed(int index, bool value) {
      setState(() {
        checkedState2[index] = value;
        updateValue();
      });
    }
    //end

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
          child: Form(
            key: _formKey,
            child: Column(
              children: [
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
                    child: _title(name: '1. ข้อมูลครอบครัว'),
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
                                '1.1 บิดาหรือมารดาของท่านมีประวัติการเจ็บป่วยด้วยโรค'),
                        _listbox(
                          titles: answer1,
                          onChanged: handleCheckbox1Changed,
                          checkedState: checkedState1,
                          controller: _controllers[0],
                          textOther: true,
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
                                '1.2 พี่น้อง (สายตรง) ของท่านมีประวัติการเจ็บป่วยด้วยโรค'),
                        _listbox(
                          titles: answer1,
                          onChanged: handleCheckbox2Changed,
                          checkedState: checkedState2,
                          controller: _controllers[1],
                          textOther: true,
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
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                      updateValue();
                      Navigator.pushNamed(context, '/page3');
                      }
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
  final TextEditingController? controller,
  bool? textOther,
}) {
  bool hasCheckedItem = checkedState.contains(true);
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
              titles[index]['state'] == true &&
              checkedState[index])
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: TextFormField(
                controller: controller,
                decoration: InputDecoration(
                  labelText: 'อื่นๆ',
                  hintText: 'โปรดระบุ',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'โปรดระบุอื่นๆ.';
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
