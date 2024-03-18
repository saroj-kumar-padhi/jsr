import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jsr_tiffin/models/payments.dart';

class MyPayments extends StatelessWidget {
  const MyPayments({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimationLimiter(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: ListView.builder(
            itemCount: Payment.paymentList.length,
            itemBuilder: (BuildContext context, int index) {
              return AnimationConfiguration.staggeredList(
                position: index,
                duration: const Duration(seconds: 2),
                child: SlideAnimation(
                  verticalOffset: 50.0,
                  child: FadeInAnimation(
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(185, 0, 0, 0),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: ListTile(
                              contentPadding:
                                  EdgeInsets.zero, // Remove ListTile's padding
                              tileColor: Colors
                                  .transparent, // Make ListTile's color transparent
                              leading: Icon(
                                Payment.paymentList[index].icon,
                                color: Payment.paymentList[index].color,
                              ),
                              title: Center(
                                child: Text(
                                  Payment.paymentList[index].title,
                                  style: GoogleFonts.robotoCondensed(
                                    fontWeight: FontWeight.w700,
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
