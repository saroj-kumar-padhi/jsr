import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jsr_tiffin/constants.dart';
import 'package:jsr_tiffin/controllers/basic_controller.dart';
import 'package:jsr_tiffin/models/userData.dart';
import 'package:jsr_tiffin/screens/components/drawer.dart';

import '../controllers/basic_food_controller.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  BasicController basicController = Get.put(BasicController());
  BasicFoodItemsController basicFoodItemsController =
      Get.put(BasicFoodItemsController());
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    CarouselController cousalController = CarouselController();
    return FutureBuilder<UserData>(
        future: basicController.getBasicData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Scaffold(
              body: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          } else if (snapshot.hasError) {
            return const Text("some thing went wrong");
          } else {
            return AnnotatedRegion<SystemUiOverlayStyle>(
                value: const SystemUiOverlayStyle(
                  statusBarColor: Colors.amber,
                ),
                child: Scaffold(
                  drawer: const SideDrawer(),
                  appBar: AppBar(
                    title: Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text(
                        "Welcome ${basicController.userData.value.firstName}",
                        style: GoogleFonts.roboto(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                    backgroundColor: Colors.grey[200],
                    actions: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            basicController.userData.value.profilePic),
                      ),
                      SizedBox(
                        width: size.width * 0.05,
                      )
                    ],
                  ),
                  body: SingleChildScrollView(
                    child: AnimationLimiter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: AnimationConfiguration.toStaggeredList(
                          duration: const Duration(milliseconds: 375),
                          childAnimationBuilder: (widget) => SlideAnimation(
                            horizontalOffset: 50.0,
                            child: FadeInAnimation(
                              child: widget,
                            ),
                          ),
                          children: [
                            CarouselSlider(
                              disableGesture: true,
                              carouselController: cousalController,
                              options: CarouselOptions(
                                viewportFraction: 0.999,
                                autoPlay: true,
                                padEnds: false,
                                initialPage: 0,
                              ),
                              items: Constants.courasalList.map((i) {
                                return Builder(
                                  builder: (BuildContext context) {
                                    return SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Image(image: NetworkImage(i)));
                                  },
                                );
                              }).toList(),
                            ),
                            heading(context, "Our Kitchen's Masterpieces!"),
                            SizedBox(
                              height: size.height * 0.2,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: Constants.menu.length,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        CircleAvatar(
                                            radius: 50,
                                            backgroundImage: NetworkImage(
                                                Constants.menu[index])),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 15),
                                          child: Text(
                                            Constants.itemsList[index],
                                            style: GoogleFonts.lato(
                                              color: Colors.brown[800],
                                              textStyle: Theme.of(context)
                                                  .textTheme
                                                  .displaySmall,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700,
                                              fontStyle: FontStyle.italic,
                                            ),
                                          ),
                                        ),
                                      ],
                                    );
                                  }),
                            ),
                            heading(context, "Track your order with a click!"),
                            Image.asset("assests/images/tackOrder.png"),
                          ],
                        ),
                      ),
                    ),
                  ),
                ));
          }
        });
  }

  Padding heading(BuildContext context, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
      child: Text(
        title,
        style: GoogleFonts.robotoCondensed(
          color: Colors.brown[800],
          textStyle: Theme.of(context).textTheme.displaySmall,
          fontSize: 24,
          fontWeight: FontWeight.w700,
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }
}
