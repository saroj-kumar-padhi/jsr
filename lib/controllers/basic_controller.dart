import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';

class BasicController extends GetxController {
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phoneText = TextEditingController();
  Logger logger = Logger();
  final ImagePicker picker = ImagePicker();
  RxString imageLink = ''.obs;
  RxString Filex = ''.obs;

  Future<void> PickImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      Filex.value = image.path;
      try {
        Reference firebaseStorageRef = FirebaseStorage.instance
            .ref()
            .child('profile_images')
            .child('image_${DateTime.now().millisecondsSinceEpoch}.jpg');

        final UploadTask uploadTask =
            firebaseStorageRef.putFile(File(image.path));
        final TaskSnapshot downloadUrl = (await uploadTask);
        final String url = await downloadUrl.ref.getDownloadURL();
        imageLink.value = url;
        logger.d(url);
      } catch (e) {}
    }
  }
}
