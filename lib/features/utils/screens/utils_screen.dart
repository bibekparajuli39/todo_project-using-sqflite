import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class UtilsScreen extends StatefulWidget {
  const UtilsScreen({super.key});

  @override
  State<UtilsScreen> createState() => _UtilsScreenState();
}

class _UtilsScreenState extends State<UtilsScreen> {
  final ImagePicker picker = ImagePicker();
  File? imageCamera;
  File? imageGallery;
  String? fileName;
  String? filePath;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Utils App')),
      body: SingleChildScrollView(
        child: Column(
          spacing: 10,
          crossAxisAlignment: .start,
          children: [
            ElevatedButton(
              onPressed: () {
                pickCamer();
              },
              child: Text('Open Camera'),
            ),
            imageCamera != null
                ? Image.file(imageCamera!)
                : Text('please click the image again'),

            ElevatedButton(
              onPressed: () {
                pickGallery();
              },
              child: Text('Image from Gallery'),
            ),
            imageGallery != null
                ? Image.file(imageGallery!)
                : Text('Please click image from gallery'),
            ElevatedButton(
              onPressed: () {
                pickFile();
              },
              child: Text('Please pick a file'),
            ),

            fileName != null
                ? CustomTextWidget(fileName: fileName)
                : CustomTextWidget(fileName: "please select file first"),
            filePath != null
                ? Text(filePath!)
                : Text('please select file first'),
          ],
        ),
      ),
    );
  }

  Future pickCamer() async {
    final XFile? pickedImage = await picker.pickImage(
      source: ImageSource.camera,
    );
    if (pickedImage != null) {
      setState(() {
        imageCamera = File(pickedImage.path);
      });
    }
  }

  Future pickGallery() async {
    final XFile? pickGallery = await picker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickGallery != null) {
      setState(() {
        imageGallery = File(pickGallery.path);
      });
    }
  }

  Future<void> pickFile() async {
    final PlatformFile? file = await FilePicker.pickFile(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );
    if (file != null) {
      setState(() {
        fileName = file.name;
        filePath = file.path;
      });
    }
  }
}

class CustomTextWidget extends StatelessWidget {
  const CustomTextWidget({super.key, required this.fileName});

  final String? fileName;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: Text(fileName!),
    );
  }
}
