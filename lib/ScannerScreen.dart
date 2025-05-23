import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

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
      if (kIsWeb) { // For web
        imageToOCR = Image.network(selectedImage.path);
      }
      else { // For mobile
        imageToOCR = Image.file(File(selectedImage.path));
      }
    });
  }

  Future captureImage() async {
    final XFile? selectedPhoto = await picker.pickImage(
      source: ImageSource.camera,
    );

    if (selectedPhoto == null) return null;

    setState(() {

      if (kIsWeb){
        imageToOCR = Image.network(selectedPhoto.path);

      } else{
        imageToOCR = Image.file(File(selectedPhoto.path));
      }
       });
  }

  @override
  Widget build(BuildContext context) {
    //ScreenWidth
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width * 0.3;
    double paddingHorizontal = screenWidth /4;

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
            Padding(padding:EdgeInsets.symmetric(horizontal: paddingHorizontal),child: Center(child: imageToOCR ?? Text('No image selected'))),
          ],
        ),
      ),
    );
  }
}
