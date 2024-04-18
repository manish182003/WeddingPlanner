import 'dart:io';

import 'package:image_picker/image_picker.dart';

class CreateVendor {
  Future<File> pickImage() async {
    var imagepicker = ImagePicker();
    var pickedImage = await imagepicker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedImage != null) {
      return File(pickedImage.path);
    } else {
      return File('');
    }
  }
}
