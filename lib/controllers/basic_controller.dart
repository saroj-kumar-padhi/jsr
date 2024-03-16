import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jsr_tiffin/models/userData.dart';
import 'package:logger/logger.dart';

class BasicController extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController phoneText = TextEditingController();
  RxBool isLoading = false.obs;
  Logger logger = Logger();
  final ImagePicker picker = ImagePicker();
  RxString imageLink = ''.obs;
  RxString Filex = ''.obs;

  Future<void> putDatabase() async {
    try {
      isLoading(true);
      UserData userData = UserData(
          firstName: firstNameController.text,
          lastName: lastNameController.text,
          email: email.text,
          phoneText: phoneText.text,
          profilePic: imageLink.value);
      await firestore
          .collection('kitchen')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set(userData.toMap());
      isLoading(false);
    } catch (e) {
      logger.d(e);
      isLoading(false);
    }
  }

  Future<void> PickImage() async {
    isLoading(true);
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
        isLoading(false);
      } catch (e) {
        isLoading(false);
      }
    }
  }
}
