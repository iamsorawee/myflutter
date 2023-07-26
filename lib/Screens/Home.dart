import 'package:flutter/material.dart';
// import 'package:new_version/new_version.dart';
import 'menu/createform1/page1.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // @override
  // void initState() {
  //   super.initState();

  //   // Instantiate NewVersion manager object (Using GCP Console app as example)
  //   final newVersion = NewVersion(
  //     iOSId: 'com.google.Vespa',
  //     androidId: 'com.google.android.apps.cloudconsole',
  //   );

  //   // You can let the plugin handle fetching the status and showing a dialog,
  //   // or you can fetch the status and display your own dialog, or no dialog.
  //   const simpleBehavior = true;

  //   if (simpleBehavior) {
  //     basicStatusCheck(newVersion);
  //   } else {
  //     advancedStatusCheck(newVersion);
  //   }
  // }

  // basicStatusCheck(NewVersion newVersion) {
  //   newVersion.showAlertIfNecessary(context: context);
  // }

  // advancedStatusCheck(NewVersion newVersion) async {
  //   final status = await newVersion.getVersionStatus();
  //   if (status != null) {
  //     debugPrint(status.releaseNotes);
  //     debugPrint(status.appStoreLink);
  //     debugPrint(status.localVersion);
  //     debugPrint(status.storeVersion);
  //     debugPrint(status.canUpdate.toString());
  //     newVersion.showUpdateDialog(
  //       context: context,
  //       versionStatus: status,
  //       dialogTitle: 'Custom Title',
  //       dialogText: 'Custom Text',
  //     );
  //   }
  // }

  int _currentIndex = 0;
  final List<String> _pages = ['/', '/history', '/profile'];

  @override
  Widget build(BuildContext context) {
    _currentIndex = 0;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xfff5f7fa),
      body: Builder(builder: (context) {
        return Container(
          clipBehavior: Clip.none,
          child: ListView(
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: size.height * .4,
                    width: size.width,
                  ),
                  GradientContainer(size),
                  Container(
                    alignment: Alignment.bottomCenter,
                    // decoration: BoxDecoration(color: Colors.black),
                    height: size.height * 0.36,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 50.0),
                        child: Row(
                          children: [
                            CustomCard(size, context),
                            CustomCard(size, context),
                            CustomCard(size, context),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Positioned(
                      top: size.height * .10,
                      left: 30,
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "หมอใกล้บ้าน",
                            style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.bold,
                                fontSize: 38),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              DevicesGridDashboard(size: size),
              // const ScenesDashboard(), //เมนูล่าง
            ],
          ),
        );
      }),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          if (index == _currentIndex) {
            return;
          }
          setState(() {
            _currentIndex = index;
            print(_currentIndex);
          });
          Navigator.pushNamed(context, _pages[_currentIndex]);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'หน้าแรก',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'ประวัติ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'ข้อมูลบุคคล',
          ),
        ],
        selectedItemColor: Colors.green[400],
      ),
    );
  }

  Padding CustomCard(
    Size size,
    context,
  ) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: GestureDetector(
        // onTap: () => Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => const AddHealth(),
        //   ),
        // ),
        child: Container(
          height: size.height * .15,
          width: size.width * .5,
          decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(8),
              image: const DecorationImage(
                image: AssetImage(
                  "assets/bg.jpg",
                ),
                fit: BoxFit.cover,
              )),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.black.withOpacity(0.3),
            ),
            child: Padding(
              padding: EdgeInsets.only(left: 15, top: size.height * .12),
              child: const Text(
                'สำนักอนามัย',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container GradientContainer(Size size) {
    return Container(
      height: size.height * .3,
      width: size.width,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)),
          image: DecorationImage(
              image: AssetImage('assets/bg.jpg'), fit: BoxFit.cover)),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30)),
            gradient: LinearGradient(colors: [
              const Color(0xFF81C784).withOpacity(0.9),
              const Color(0xFF66BB6A).withOpacity(0.9)
            ])),
      ),
    );
  }
}

class ScenesDashboard extends StatelessWidget {
  const ScenesDashboard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 15),
            child: Text(
              "เมนูล่าง",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CardWidget(
                    icon: const Icon(
                      Icons.home_work_outlined,
                      color: Colors.black,
                    ),
                    title: 'เมนู 1'),
                CardWidget(
                    icon: const Icon(
                      Icons.home,
                      color: Colors.red,
                    ),
                    title: 'เมนู 2'),
                CardWidget(
                    icon: const Icon(
                      Icons.home,
                      color: Colors.green,
                    ),
                    title: 'เมนู 3'),
                CardWidget(
                    icon: const Icon(
                      Icons.home,
                      color: Colors.cyan,
                    ),
                    title: 'เมนู 4'),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CardWidget extends StatelessWidget {
  Icon icon;
  String title;
  CardWidget({Key? key, required this.icon, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 80,
        width: 200,
        child: Center(
          child: ListTile(
            leading: icon,
            title: Text(
              title,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 14),
            ),
          ),
        ),
      ),
    );
  }
}

class DevicesGridDashboard extends StatelessWidget {
  const DevicesGridDashboard({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 15),
            child: Text(
              "คัดกรองสุขภาพ",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 17),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const AddHealth(), // คลาสที่คุณต้องการเปิดหน้าใหม่
                    ),
                  );
                },
                child: CardField(
                    size,
                    Colors.green,
                    const Icon(
                      Icons.note_alt,
                      color: Colors.white,
                    ),
                    'เพิ่มประวัติ',
                    'สุขภาพ'),
              ),
              // CardField(
              //     size,
              //     Colors.amber,
              //     const Icon(Icons.lightbulb_outline, color: Colors.white),
              //     '',
              //     ''),
            ],
          ),
        ],
      ),
    );
  }
}

CardField(
  Size size,
  Color color,
  Icon icon,
  String title,
  String subtitle,
) {
  return Padding(
    padding: const EdgeInsets.all(2),
    child: Card(
        child: SizedBox(
            height: size.height * .1,
            width: size.width * .39,
            child: Center(
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: color,
                  child: icon,
                ),
                title: Text(
                  title,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 14),
                ),
                subtitle: Text(
                  subtitle,
                  style: const TextStyle(
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                      fontSize: 13),
                ),
              ),
            ))),
  );
}
