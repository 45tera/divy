import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PreviousReceiptList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Previous divys')),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(child: Text('HELLO')),
            Center(child: Text('World'))
          ],
        ),
      ),
    );
  }
}
