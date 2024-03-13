import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jsr_tiffin/screens/foodItems.dart';

import '../controllers/basic_controller.dart';

class BasicDetails extends StatelessWidget {
  const BasicDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    BasicController basicController = Get.put(BasicController());
    return Scaffold(
      body: ListView(
        children: [
          FadeInUp(
            duration: const Duration(seconds: 2),
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 50, horizontal: 20),
                    child: FAProgressBar(
                        maxValue: 100,
                        displayText: '%',
                        borderRadius: BorderRadius.circular(20),
                        animatedDuration: const Duration(seconds: 1),
                        progressColor: const Color.fromARGB(153, 33, 44, 243),
                        backgroundColor:
                            Colors.greenAccent[200] ?? Colors.black,
                        currentValue: 50)),
                Text(
                  "Your Personal details",
                  style: GoogleFonts.robotoCondensed(
                    textStyle: Theme.of(context).textTheme.displaySmall,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.italic,
                  ),
                ),
                Obx(() {
                  if (basicController.Filex.value == '') {
                    return InkWell(
                      onTap: () async {
                        basicController.PickImage();
                      },
                      child: Container(
                        height: size.height * 0.2,
                        width: size.width * 0.8,
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(100)),
                            image: DecorationImage(
                                scale: 1,
                                image: AssetImage(
                                  'assests/images/profile.png',
                                ))),
                      ),
                    );
                  } else {
                    return InkWell(
                      onTap: () async {
                        basicController.PickImage();
                      },
                      child: Container(
                        height: size.height * 0.2,
                        width: size.width * 0.8,
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(100)),
                            image: DecorationImage(
                              scale: 1,
                              image: FileImage(
                                File(basicController.Filex.value),
                              ),
                            )),
                      ),
                    );
                  }
                }),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8),
                        child: Heading("First Name"),
                      ),
                      textFields("Enter Your First Name",
                          basicController.firstNameController),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 10, 0, 0),
                        child: Heading("Last Name"),
                      ),
                      textFields('Enter Your Last Name',
                          basicController.lastNameController),
                      //email
                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 10, 0, 0),
                        child: Heading("Email"),
                      ),
                      textFields('Enter Your Email', basicController.email),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(8, 10, 0, 0),
                        child: Heading("Mobile No"),
                      ),
                      textFields('+91', basicController.phoneText),

                      //Button

                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              fixedSize: const Size(310, 50),
                              minimumSize: const Size(60, 20),
                              backgroundColor: Colors.red.withOpacity(0.8),
                              padding: const EdgeInsets.all(16.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                            onPressed: () {
                              Get.to(BasicFoodItems());
                            },
                            child: const Text(
                              "Proceed",
                              style: TextStyle(color: Colors.white),
                            )),
                      ),

                      SizedBox(
                        height: size.height * 0.03,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding textFields(hintText, controller) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }

  Align Heading(heading) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Text(
        heading,
        style: GoogleFonts.lato(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }
}
