import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class ScannerScreen extends StatefulWidget {
  @override
  ScannerScreenState createState() => ScannerScreenState();
}

class ScannerScreenState extends State<ScannerScreen> {
  Image? imageToOCR;
  final ImagePicker picker = ImagePicker();

  Future pickImage() async {
    final selectedImage = await picker.pickImage(source: ImageSource.gallery);

    if (selectedImage == null) return;

    setState(() {
      imageToOCR = Image.network(selectedImage.path); // For web
    });
  }

  Future captureImage() async {
    final XFile? selectedPhoto = await picker.pickImage(
      source: ImageSource.camera,
    );

    if (selectedPhoto == null) return null;

    setState(() {
      //imageToOCR = XFile(selectedPhoto!.path);
      imageToOCR = Image.network(selectedPhoto.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan receipt')),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MaterialButton(
              color: Colors.blue,
              child: Text("Grab receipt photo from gallery"),
              onPressed: () {
                pickImage();
              },
            ),
            Center(
              child:
                  imageToOCR ?? Text('No image selected'),
            ),
          ],
        ),
      ),
    );
  }
}
