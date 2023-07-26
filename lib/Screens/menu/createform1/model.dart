import 'package:flutter/foundation.dart';

class DataModel extends ChangeNotifier {
  List<Map<String, dynamic>> page1 = [];
  List<Map<String, dynamic>> page2 = [];
  List<Map<String, dynamic>> page3 = [];
  List<Map<String, dynamic>> page4 = [];
  List<Map<String, dynamic>> page5 = [];
  List<Map<String, dynamic>> page6 = [];
  List<String> checklistValues = [];
  List<String> dropdownValue = [];
  //ตัวแปร checklist หน้าที่ 2
  List<bool> checkedState1 = List.filled(9, false);
  List<bool> checkedState2 = List.filled(9, false);
  List<bool> checkedState3 = List.filled(4, false);
  //ตัวแปร dropdown หน้าที่ 3
  List<int> dropdownIds = List.generate(16, (index) => index);

  void resetform() {
    page1 = [];
    page2 = [];
    page3 = [];
    page4 = [];
    page5 = [];
    page6 = [];
    checkedState1 = List.filled(9, false);
    checkedState2 = List.filled(9, false);
    checkedState3 = List.filled(4, false);
    dropdownIds = List.filled(16, 0);
    print('reset');
    notifyListeners();
  }

  void setFormValues(List<Map<String, dynamic>> value, int id) {
    if (id == 1) {
      page1 = value;
    }
    if (id == 2) {
      page2 = value;
    }
    if (id == 3) {
      page3 = value;
    }
    if (id == 4) {
      page4 = value;
    }
    if (id == 5) {
      page5 = value;
    }
    if (id == 6) {
      page6 = value;
    }
    print('updated on model');
    notifyListeners();
  }

  //page2
  // เพิ่ม methods สำหรับการเปลี่ยนแปลงข้อมูลอื่นๆ ได้ตามต้องการ
  void setCheckedState1(List<bool> state) {
    checkedState1 = state;
    notifyListeners();
  }

  void setCheckedState2(List<bool> state) {
    checkedState2 = state;
    notifyListeners();
  }

//page3
  void updateSelected(List<int> id) {
    dropdownIds = id;
    print('model update');
    notifyListeners(); // Notify listeners to rebuild the UI when the ID changes
  }

  void setCheckedState3(List<bool> state) {
    checkedState3 = state;
    notifyListeners();
  }
}
