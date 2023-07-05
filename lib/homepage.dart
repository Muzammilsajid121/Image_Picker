import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? _image;

  Future getImage(ImageSource) async {
    final image = await ImagePicker().pickImage(source: ImageSource);

    if (image == null) return;

    final imageTemporary = File(image.path);

    setState(() {
      this._image = imageTemporary;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            _image != null
                ? Image.file(
                    _image!,
                    width: 300,
                    height: 300,
                  )
                : Image.network(
                    "https://dfstudio-d420.kxcdn.com/wordpress/wp-content/uploads/2019/06/digital_camera_photo-980x653.jpg",
                    height: 300,
                    width: 300,
                  ),

            //buttons
            ElevatedButton(
                onPressed: () {
                  getImage(ImageSource.gallery);
                },
                child: Text("pick an Image from Gallery")),
            //
            ElevatedButton(
                onPressed: () {
                  getImage(ImageSource.camera);
                },
                child: Text("Take a picture from Camera ")),
          ],
        ),
      ),
    );
  }
}
