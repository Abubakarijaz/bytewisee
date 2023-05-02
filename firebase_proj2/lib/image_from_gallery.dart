
import 'package:image_cropper/image_cropper.dart';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class GetImage extends StatefulWidget {
  const GetImage({Key? key}) : super(key: key);

  @override
  State<GetImage> createState() => _GetImageState();
}

class _GetImageState extends State<GetImage> {
  File? image;
  void getFromGallery () async{
    XFile? PickedFile=await ImagePicker().pickImage(source: ImageSource.gallery);
    cropImage(PickedFile!);
    Navigator.pop(context);
  }
  void cropImage(filepath) async{
    CroppedFile? cropImage=await ImageCropper().cropImage(sourcePath: filepath,
      maxWidth: 100,maxHeight: 100
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
