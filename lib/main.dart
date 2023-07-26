import 'package:flutter/material.dart';
import 'package:myproject/Screens/menu/historyCRUD/crud.dart';
import 'package:myproject/Screens/menu/usercontroller/profile.dart';
import 'package:provider/provider.dart';
import 'Screens/menu/createform1/model.dart';
import 'Screens/Home.dart';
import 'Screens/menu/historyCRUD/crud.dart';
import 'Screens/menu/usercontroller/profile.dart';
import 'Screens/menu/usercontroller/profile_update.dart';
import 'Screens/menu/createform1/page1.dart';
import 'Screens/menu/createform1/page2.dart';
import 'Screens/menu/createform1/page3.dart';
import 'Screens/menu/createform1/page4.dart';
import 'Screens/menu/createform1/page5.dart';
import 'Screens/menu/createform1/page6.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DataModel(),
      child: MaterialApp(
        title: 'Home Page',
        home: const MyHomePage(),
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/':
              return PageTransition(
                child: const MyHomePage(),
                type: PageTransitionType.rightToLeft,
                settings: settings,
                reverseDuration: const Duration(milliseconds: 200),
              );
            case '/history':
              return PageTransition(
                child: const listCRUD(),
                type: PageTransitionType.rightToLeft,
                settings: settings,
                reverseDuration: const Duration(milliseconds: 200),
              );
            case '/profile':
              return PageTransition(
                child: const userProfile(),
                type: PageTransitionType.rightToLeft,
                settings: settings,
                reverseDuration: const Duration(milliseconds: 200),
              );
            case '/page1':
              return PageTransition(
                child: const AddHealth(),
                type: PageTransitionType.rightToLeft,
                settings: settings,
                reverseDuration: const Duration(milliseconds: 200),
              );
            case '/page2':
              return PageTransition(
                child: const Page2(),
                type: PageTransitionType.rightToLeft,
                settings: settings,
                reverseDuration: const Duration(milliseconds: 200),
              );
            case '/page3':
              return PageTransition(
                child: Page3(),
                type: PageTransitionType.rightToLeft,
                settings: settings,
                reverseDuration: const Duration(milliseconds: 200),
              );
            case '/page4':
              return PageTransition(
                child: Page4(),
                type: PageTransitionType.rightToLeft,
                settings: settings,
                reverseDuration: const Duration(milliseconds: 200),
              );
            case '/page5':
              return PageTransition(
                child: const Page5(),
                type: PageTransitionType.rightToLeft,
                settings: settings,
                reverseDuration: const Duration(milliseconds: 200),
              );
            case '/page6':
              return PageTransition(
                child: Page6(
                  signatureBytes: null,
                ),
                type: PageTransitionType.rightToLeft,
                settings: settings,
                reverseDuration: const Duration(milliseconds: 200),
              );
            default:
              return null;
          }
        },
      ),
    );
  }
}
