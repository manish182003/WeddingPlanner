import 'dart:io';

import 'package:cloudinary_public/cloudinary_public.dart';
import 'package:eternal_tie/Utility/snackbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class CreateVendor {
  Future<File> pickImage() async {
    var imagepicker = ImagePicker();
    var pickedImage = await imagepicker.pickImage(
      source: ImageSource.gallery,
      preferredCameraDevice: CameraDevice.rear,
    );
    if (pickedImage != null) {
      return File(pickedImage.path);
    } else {
      return File('');
    }
  }

  Future<String> uplaodImage(BuildContext context, File? image) async {
    try {
      var cloudinaryPublic = CloudinaryPublic('dasexcwzj', 'rd91bss4');
      CloudinaryResponse res = await cloudinaryPublic.uploadFile(
        CloudinaryFile.fromFile(
          image!.path,
          folder: 'Vendor_Images',
          resourceType: CloudinaryResourceType.Image,
        ),
      );

      return res.secureUrl;
    } catch (e) {
      showSnackBar(
        context,
        e.toString(),
      );
      return '';
    }
  }

  UploadDataToServer(BuildContext context, String name, String image,
      String description, String price) async {
    try {
      var res = await http.post(
        Uri.parse('http://192.168.65.10:3000/api/vendor'),
        body: {
          "vendor_Name": name,
          "vendor_Image": image,
          "vendor_Discription": description,
          "vendor_Price": price,
        },
      );

      print(res.body);

      if (res.statusCode != 201) {
        showSnackBar(context, 'Server Not Responding!');
      } else {
        showSnackBar(context, 'Venue Created Successfully');
      }
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
