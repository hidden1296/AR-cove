/*import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class ImagePickerPage extends StatefulWidget {
  const ImagePickerPage({super.key});

  @override
  _ImagePickerPageState createState() => _ImagePickerPageState();
}

class _ImagePickerPageState extends State<ImagePickerPage> {
  File? _image;
  final picker = ImagePicker();

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await picker.pickImage(source: source);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Picker'),
        backgroundColor: const Color(0xFFB46146),
      ),
      body: _image == null
          ? const Center(child: Text('No image selected. Tap on the camera or gallery to select an image.'))
          : Image.file(_image!),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => _pickImage(ImageSource.camera),
            tooltip: 'Pick Image from Camera',
            child: const Icon(Icons.camera),
          ),
          const SizedBox(height: 16),
          FloatingActionButton(
            onPressed: () => _pickImage(ImageSource.gallery),
            tooltip: 'Pick Image from Gallery',
            child: const Icon(Icons.photo_library),
          ),
        ],
      ),
    );
  }
}*/