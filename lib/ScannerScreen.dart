import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScannerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan receipt')),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(child: Text('Scan the QR')),
            Center(child: Container(color: Colors.blue)),
          ],
        ),
      ),
    );
  }
}
