import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerExample extends StatefulWidget {
  const ImagePickerExample({super.key});

  @override
  ImagePickerExampleState createState() => ImagePickerExampleState();
}

class ImagePickerExampleState extends State<ImagePickerExample> {
  List<File> images = [];
  final List<String> _paths = [];
  Future<void> _getImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      // final appDir = await getApplicationDocumentsDirectory();
      setState(() {
        _paths.add(pickedFile.name);
        images.add(File(pickedFile.path));
      });
    }
  }

  void _removeImage(index) {
    setState(() {
      _paths.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          for (int i = 0; i < _paths.length; i++)
            Stack(children: [
              Container(
                  margin: const EdgeInsetsDirectional.all(10.0),
                  width: 370, // Set the width
                  height: 200,
                  color: Colors.white,
                  alignment: Alignment.topCenter,
                  child: Image.asset(
                    "lib/images/${_paths[i]}",
                    fit: BoxFit.cover,
                  )),
              IconButton(
                alignment: Alignment.topLeft,
                icon: const Icon(Icons.close),
                iconSize: 24,
                onPressed: () {
                  _removeImage(i);
                },
              ),
            ]),
          GestureDetector(
              onTap: _getImage,
              child: Container(
                width: 370, // Set the width
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  border: const Border(bottom: BorderSide(width: 0.1)),
                ),
                alignment: Alignment.center,
                child: const Text(
                  'Add Image',
                  style: TextStyle(
                    fontSize: 32,
                    color: Color.fromARGB(255, 102, 3, 3),
                  ),
                  textAlign: TextAlign.center,
                ),
              )),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
