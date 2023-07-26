import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model.dart';

class Page3 extends StatefulWidget {
  Page3({super.key});
  List<int> selectedIds = List.filled(16, 0);
  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  List<Map<String, dynamic>> answer2 = [
    {'id': 1, 'name': 'โรคเบาหวาน (DM)', 'state': true},
    {'id': 2, 'name': 'ความดันโลหิตสูง (HT)', 'state': true},
    {'id': 3, 'name': 'โรคตับ', 'state': true},
    {'id': 4, 'name': 'โรคอัมพาต', 'state': true},
    {'id': 5, 'name': 'โรคหัวใจ', 'state': true},
    {'id': 6, 'name': 'ไขมันในเลือดผิดปกติ', 'state': true},
    {'id': 7, 'name': 'แผลที่เท่า/ตัดขา (จากโรคเบาหวาน)', 'state': false},
    {'id': 8, 'name': 'คลอดบุตรน้ำหนักเกิน 4 กิโลกรัม', 'state': false},
    {'id': 9, 'name': 'ดื่มน้ำบ่อยและมาก', 'state': false},
    {'id': 10, 'name': 'ปัสสาวะกลางคืน 3 ครั้งขึ้นไป', 'state': false},
    {'id': 11, 'name': 'กินจุแต่ผอมลง', 'state': false},
    {'id': 12, 'name': 'น้ำหนักลด/อ่อนเพลีย', 'state': false},
    {'id': 13, 'name': 'เป็นแผลริมฝีปากบ่อยและหายยาก', 'state': false},
    {'id': 14, 'name': 'คันตามผิวหนังและอวัยวะสืบพันธุ์', 'state': false},
    {'id': 15, 'name': 'ตาพร่ามัว ต้องเปลี่ยนแว่นบ่อย', 'state': false},
    {'id': 16, 'name': 'ชาปลายมือปลายเท้าโดยไม่ทราบสาเหตุ', 'state': false},
  ];
  @override
  void initState() {
    super.initState();
    final dataModel = Provider.of<DataModel>(context, listen: false);
    if (dataModel.page3.isNotEmpty && dataModel.page3.length >= 16) {
      widget.selectedIds = dataModel.dropdownIds;
    }
    print('widget : ${widget.selectedIds}');
    print('dataModel : ${dataModel.dropdownIds}');
    print('init');
  }

  @override
  Widget build(BuildContext context) {
    DataModel dataModel = Provider.of<DataModel>(context);
    
    void updateValue() {
          List<Map<String, dynamic>> formValues = [];
    for (int i = 0; i < widget.selectedIds.length; i++) {
      int id = widget.selectedIds[i];
      String name = answer2[i]['name'];
      formValues.add({'name': name, 'select': id});
    }
      dataModel.setFormValues(formValues, 3);
      dataModel.updateSelected(widget.selectedIds);
      print('updated');
    }

    void updateSelectedId(int index, int id) {
      setState(() {
        widget.selectedIds[index] = id;
        updateValue();
        print(widget.selectedIds);
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
              // Text('TextFormField Value: ${dataModel.page3}'),
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
                          name:
                              '2. ท่านมีประวัติการเจ็บป่วย หรือต้องพบแพทย์ ด้วยโรคหรืออาการ'),
                      DDown(
                        titles: answer2,
                        values: widget.selectedIds,
                        onChanged: updateSelectedId,
                      ),
                      const SizedBox(
                        height: 20.0,
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
                    Navigator.pushNamed(context, '/page4');
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

class DDown extends StatefulWidget {
  final List<Map<String, dynamic>> titles;
  final List<int> values;
  final void Function(int, int) onChanged;

  DDown({
    Key? key,
    required this.titles,
    required this.values,
    required this.onChanged,
  }) : super(key: key);

  @override
  _DDownState createState() => _DDownState();
}

class _DDownState extends State<DDown> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: widget.titles.map((disease) {
        String name = disease['name'];
        bool diseaseState = disease['state'];
        int selectedId = widget.values[widget.titles.indexOf(
            disease)]; // ดึงค่า id ที่เลือกจาก List ที่เก็บค่า id ใน widget.values
        return Column(
          children: [
            const SizedBox(
              height: 10.0,
            ),
            _subtitle(name: name),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.grey),
                ),
                child: DropdownButtonFormField<int>(
                  value:
                      selectedId, // ใช้ค่า selectedId ที่ได้จาก widget.values เป็นค่าเริ่มต้น
                  onChanged: (int? value) {
                    widget.onChanged(
                        widget.titles.indexOf(disease), value ?? -1);
                  },
                  items: _buildDropdownItems(diseaseState),
                  validator: (value) {
                    if (value == null || value == -1) {
                      return 'โปรดระบุ';
                    }
                    return null;
                  },
                  decoration: const InputDecoration.collapsed(hintText: ''),
                ),
              ),
            ),
          ],
        );
      }).toList(),
    );
  }

  // ฟังก์ชันสร้าง DropdownMenuItem ให้กับ DropdownButtonFormField
  List<DropdownMenuItem<int>> _buildDropdownItems(bool diseaseState) {
    List<int> dropdownItems = [0, 1, 2]; // เปลี่ยนเป็น List<int>
    if (diseaseState) {
      dropdownItems.add(3); // เพิ่มตัวเลือก 'ไม่เคยตรวจ'
    }
    return dropdownItems.map((value) {
      String title = (value == 0)
          ? 'ระบุ'
          : (value == 1)
              ? 'มี'
              : (value == 2)
                  ? 'ไม่มี'
                  : 'ไม่เคยตรวจ'; // ใช้ value เพื่อสร้าง title ให้กับ DropdownMenuItem
      return DropdownMenuItem<int>(
        value: value,
        child: Text(title),
      );
    }).toList();
  }
}
