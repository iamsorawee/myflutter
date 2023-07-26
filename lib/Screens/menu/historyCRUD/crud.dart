import 'package:flutter/material.dart';

class listCRUD extends StatefulWidget {
  const listCRUD({super.key});

  @override
  State<listCRUD> createState() => _listCRUDState();
}

class _listCRUDState extends State<listCRUD> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('test'),
      ),
      body: Text('list crud pages'),
    );
  }
}
