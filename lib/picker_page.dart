import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickerPage extends StatefulWidget {
  const PickerPage({super.key});

  @override
  State<PickerPage> createState() => _PickerPageState();
}

class _PickerPageState extends State<PickerPage> {
  File? _xFile;
  String path = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () {
                  pickImage();
                },
                child: const Text("IMAGEN")),
            Image.asset("assets/images/charmander.png"),
            if (_xFile != null) Image.file(_xFile!),
          ],
        ),
      ),
    );
  }

  void pickImage() async {
    final image = await ImagePicker().pickImage(
        source: ImageSource.gallery, maxWidth: 1080, maxHeight: 1080);
    if (image == null) return;

    path = image.path;
    print(path);
    _xFile = File(path);

    setState(() {});
  }
}
