import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jsr_tiffin/controllers/basic_controller.dart';
import 'package:jsr_tiffin/models/userData.dart';

class EditController extends GetxController {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  BasicController basicController = Get.put(BasicController());
  late final TextEditingController firstNameController;
  late final TextEditingController lastNameController;
  late final TextEditingController email;
  late final TextEditingController phoneText;
  RxBool isLoading = false.obs;
  RxString imageLink = ''.obs;
  RxString Filex = ''.obs;
  final ImagePicker picker = ImagePicker();
  @override
  void onInit() {
    imageLink.value = basicController.userData.value.profilePic;
    firstNameController =
        TextEditingController(text: basicController.userData.value.firstName);
    lastNameController =
        TextEditingController(text: basicController.userData.value.lastName);
    email = TextEditingController(text: basicController.userData.value.email);
    phoneText =
        TextEditingController(text: basicController.userData.value.phoneText);
    // TODO: implement onInit

    super.onInit();
  }

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
