import 'package:flutter/material.dart';
import 'package:signature/signature.dart';
import 'page6.dart';

class SignaturePage extends StatefulWidget {
  @override
  _SignaturePageState createState() => _SignaturePageState();
}

class _SignaturePageState extends State<SignaturePage> {
  final SignatureController _controller = SignatureController(
    penStrokeWidth: 5, // กำหนดความหนาของเส้นลายเซ็น
    penColor: Colors.black, // กำหนดสีของเส้นลายเซ็น
    exportBackgroundColor:
        Colors.transparent, // กำหนดสีพื้นหลังเมื่อ export ลายเซ็น
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('เซ็นส์ชื่อ'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              color: Colors.white,
              child: Signature(
                controller: _controller,
                height: MediaQuery.of(context).size.height -
                    kToolbarHeight -
                    50, // กำหนดความสูงของ signature area
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.clear),
                onPressed: () {
                  setState(() {
                    _controller.clear();
                  });
                },
              ),
              IconButton(
                icon: Icon(Icons.check),
                onPressed: () {
                  _navigateToPage6(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _navigateToPage6(BuildContext context) async {
    final signatureResult = await _controller.toPngBytes();

    if (signatureResult != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => Page6(
              signatureBytes: signatureResult), // ระบุชื่อของ named argument
        ),
      );
    }
  }
}
