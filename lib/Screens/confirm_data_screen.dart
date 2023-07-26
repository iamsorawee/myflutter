import 'package:flutter/material.dart';

class ConfirmDataScreen extends StatelessWidget {
  final List<dynamic> variables;
  final List<String> titles = ['ข้อมูลผู้ป่วย', 'รายละเอียด', 'ผู้ดูแล'];
  final List<String> details1 = ['ชื่อ-นามสกุล'];
  final List<String> details2 = [
    'T:',
    'P:',
    'R:',
    'BP:',
    'BW(น้ำหนัก):',
    'HT(ส่วนสูง):',
    'BMI:',
    'รอบเอว:',
    'รอบสะโพก:',
    'DTX:'
  ];
  final List<String> details3 = [
    'c',
    'bpm',
    'bpm',
    'mmHg',
    'kg',
    'cm',
    'kg/m2',
    'cm',
    'cm',
    'mg %'
  ];
  final List<String> details4 = ['ชื่อ', 'ตำแหน่ง', 'รพ', 'ติดต่อ'];

  ConfirmDataScreen({Key? key, required this.variables}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green[400],
        title: const Text('ตรวจสอบความถูกต้อง'),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Navigator.of(context).pop();
            }),
        centerTitle: true,
        titleTextStyle:
            const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: null,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.white,
                    ),
                    height: null,
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Center(
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: Text(
                                titles[index],
                                style: const TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            // if (index ==
                            //     0) // Group 1: titles = ข้อมูลผู้ป่วย , details1
                            //   Row(
                            //     children: [
                            //       Column(children: [
                            //         Text(
                            //           '${details1} ${variables[index]}', // Assuming variables is a list of strings
                            //           style: const TextStyle(
                            //               fontSize: 16,
                            //               fontWeight: FontWeight.w500),
                            //         ),
                            //       ])
                            //     ],
                            //   ),
                            // if (index == 1)
                            //   Column(
                            //     children: [
                            //       for (int i = 0; i < details2.length; i++)
                            //         Text(
                            //           '${details2[i]} ${variables[1][index]} ${details3[i]}', // Assuming variables is a list of strings
                            //           style: const TextStyle(
                            //             fontSize: 16,
                            //             fontWeight: FontWeight.w500,
                            //           ),
                            //         ),
                            //     ],
                            //   ),
                            // '${details2[index]} ${variables[1][index]} ${details3[index]}', // Assuming variables is a list of strings
                            ///////////////////////////
                            // if (index == 1)
                            //   Column(children: [
                            //     Text(
                            //       '$details2 ${variables[index]} $details3', // Assuming variables is a list of strings
                            //       style: const TextStyle(
                            //         fontSize: 16,
                            //         fontWeight: FontWeight.w500,
                            //       ),
                            //     ),
                            //   ]),
                            /////////////////////
                            // if (index ==
                            //     2) // Group 3: titles = ผู้ดูแล , details3
                            //   Column(
                            //     children: details4
                            //         .map((detail) => Text(
                            //               '$detail ${variables[index]}', // Assuming variables is a list of strings
                            //               style: const TextStyle(
                            //                   fontSize: 16,
                            //                   fontWeight: FontWeight.w500),
                            //             ))
                            //         .toList(),
                            //   ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: SizedBox(
              width: 150,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // Button pressed action
                },
                style: ElevatedButton.styleFrom(
                  // Customize the button style
                  backgroundColor: Colors.blue,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'บันทึก',
                  style: TextStyle(
                      fontSize: 24,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          )
        ],
      ),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       for (var variable in variables) Text('Variable: $variable'),
      //     ],
      //   ),
      // ),
    );
  }
}
