import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jsr_tiffin/controllers/auth_controller.dart';

class OTPPage extends StatelessWidget {
  final String verficationCode;

  const OTPPage({super.key, required this.verficationCode});

  @override
  Widget build(BuildContext context) {
    AuthController authController = Get.put(AuthController());
    Size size = MediaQuery.of(context).size;
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: const SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        child: Scaffold(
            body: Wrap(
          children: [
            Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                        const Color.fromARGB(255, 122, 135, 182)
                            .withOpacity(0.5),
                        Colors.blueAccent.withOpacity(0.5),
                        const Color.fromARGB(255, 122, 135, 182)
                            .withOpacity(0.5)
                      ])),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Column(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(25),
                                child: BackdropFilter(
                                  filter:
                                      ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                                  child: Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Container(
                                      height: size.height - 40,
                                      width: size.width,
                                      decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                              begin: Alignment.topLeft,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Colors.white10,
                                                Colors.white60
                                              ]),
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          border: Border.all(
                                              width: 2, color: Colors.white30)),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 200),
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Welcome!',
                                    style: GoogleFonts.lato(
                                      textStyle: Theme.of(context)
                                          .textTheme
                                          .displaySmall,
                                      fontSize: 30,
                                      fontWeight: FontWeight.w700,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(top: 20),
                                    child: Text(
                                      "Welcome you've \n been missed!",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.quicksand(
                                        textStyle: Theme.of(context)
                                            .textTheme
                                            .displaySmall,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    )),
                                Padding(
                                  padding: const EdgeInsets.only(top: 40),
                                  child: SizedBox(
                                    width: size.width - 90,
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      controller: authController.otpController,
                                      decoration: InputDecoration(
                                        hintText: 'Enter Otp',
                                        contentPadding:
                                            const EdgeInsets.symmetric(
                                                horizontal: 16.0),
                                        filled: true,
                                        fillColor: Colors.grey[200],
                                        border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          borderSide: BorderSide.none,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(top: 40),
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          fixedSize: const Size(270, 50),
                                          minimumSize: const Size(60, 20),
                                          backgroundColor:
                                              Colors.red.withOpacity(0.8),
                                          padding: const EdgeInsets.all(16.0),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0),
                                          ),
                                        ),
                                        onPressed: () {
                                          FocusScope.of(context).unfocus();
                                          authController.verifyPhoneNumber(
                                              verficationCode: verficationCode);
                                        },
                                        child: const Text(
                                          "Verify",
                                          style: TextStyle(color: Colors.white),
                                        ))),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 30, vertical: 50),
                                  child: Container(
                                    child: Text(
                                      "───────── Or continue with ─────────",
                                      style: GoogleFonts.lato(
                                          color: Colors.grey[600],
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Container(
                                      height: 50,
                                      width: 60,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 3, color: Colors.white60),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                  "assests/images/google.png",
                                                ),
                                                fit: BoxFit.fitHeight),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      height: 50,
                                      width: 60,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 3, color: Colors.white60),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(10)),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                  "assests/images/apple.png",
                                                ),
                                                fit: BoxFit.fitHeight),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        )));
  }
}
