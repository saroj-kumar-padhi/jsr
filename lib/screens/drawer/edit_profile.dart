import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:jsr_tiffin/controllers/basic_controller.dart';
import 'package:jsr_tiffin/controllers/edit_controller.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({super.key});

  @override
  Widget build(BuildContext context) {
    BasicController basicController = Get.put(BasicController());
    EditController editController = Get.put(EditController());

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: size.height * 0.1,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Stack(
              alignment: Alignment.center,
              children: [
                CircleAvatar(
                    radius: 55,
                    backgroundColor: Colors.blue,
                    child: Obx(() {
                      return editController.Filex.value == ''
                          ? CircleAvatar(
                              radius: 50,
                              backgroundImage: CachedNetworkImageProvider(
                                basicController.userData.value.profilePic,
                              ),
                            )
                          : CircleAvatar(
                              radius: 50,
                              backgroundImage:
                                  FileImage(File(editController.Filex.value)),
                            );
                    })),
                Positioned(
                  right: 0,
                  top: 0,
                  child: GestureDetector(
                    onTap: () {
                      editController.PickImage();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: const Icon(
                        Icons.edit,
                        color: Colors.blue,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          customTextField(
              hintText: "First name",
              controller: editController.firstNameController),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: customTextField(
                hintText: "Last name",
                controller: editController.lastNameController),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: customTextField(
                hintText: "Email", controller: editController.email),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: customTextField(
                hintText: "Phone no", controller: editController.phoneText),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: ElevatedButton.icon(
              onPressed: () async {
                // Your button action
                await editController.putDatabase();
                Fluttertoast.showToast(
                    timeInSecForIosWeb: 1,
                    msg:
                        "Profile has been updated please restart your app to see desired changes ");
                Get.back();
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor:
                    const Color(0xff64e687), // Set button background color
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(10.0), // Adjust corner radius
                ),
              ),
              icon: Obx(
                () => editController.isLoading.value
                    ? const CircularProgressIndicator(
                        // Show CircularProgressIndicator when isLoading is true
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      )
                    : const Icon(Icons
                        .update), // Show update icon when isLoading is false
              ),
              label: const Text('Update profile'),
            ),
          )
        ],
      ),
    );
  }

  Container customTextField(
      {required String hintText, required TextEditingController controller}) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        controller: controller, // Add your TextEditingController here

        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(horizontal: 20),
          hintText: hintText,
          border: InputBorder.none,
        ),
      ),
    );
  }
}
