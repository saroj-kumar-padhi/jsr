import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:jsr_tiffin/controllers/basic_food_controller.dart';
import 'package:jsr_tiffin/screens/home.dart';

class BasicFoodItems extends StatelessWidget {
  const BasicFoodItems({Key? key});

  @override
  Widget build(BuildContext context) {
    final BasicFoodItemsController controller =
        Get.put(BasicFoodItemsController());
    return SafeArea(child: Obx(() {
      return FadeInUp(
        duration: const Duration(seconds: 2),
        child: Stack(
          children: [
            Scaffold(
              body: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 10),
                      child: FAProgressBar(
                          maxValue: 100,
                          displayText: '%',
                          borderRadius: BorderRadius.circular(20),
                          animatedDuration: const Duration(seconds: 1),
                          progressColor: Color.fromARGB(255, 34, 117, 56),
                          backgroundColor:
                              Colors.greenAccent[200] ?? Colors.black,
                          currentValue: 100)),
                  Text(
                    "Available Food Items",
                    style: GoogleFonts.robotoCondensed(
                      textStyle: Theme.of(context).textTheme.displaySmall,
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: SizedBox(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: controller.foodItems.length,
                        itemBuilder: (context, index) {
                          return Stack(
                            children: [
                              SizedBox(
                                height: 100,
                                width: 100,
                                child: Card(
                                  color: Colors.blueGrey,
                                  elevation: 3,
                                  shape: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
                                    child: Image(
                                      image: NetworkImage(controller
                                          .foodItems[index]['foodImage']),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                top: 10,
                                left: 10,
                                child: Container(
                                  height: 20,
                                  width: 20,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors
                                        .white, // Choose your desired color
                                  ),
                                  child: IconButton(
                                    padding: EdgeInsets.zero,
                                    iconSize: 20,
                                    color: Colors.black,
                                    onPressed: () {
                                      controller.getSelectItems(index);
                                    },
                                    icon: const Icon(Icons.add),
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "Selected Food Items",
                        style: GoogleFonts.robotoCondensed(
                          textStyle: Theme.of(context).textTheme.displaySmall,
                          fontSize: 30,
                          fontWeight: FontWeight.w700,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Obx(
                      () => ListView.builder(
                        itemCount: controller.selectedItems.length,
                        itemBuilder: (context, index) {
                          return Container(
                            width: MediaQuery.of(context).size.width * 0.94,
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0.0),
                              ),
                              color: Colors.white70,
                              elevation: 10,
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: SizedBox(
                                      height: 100,
                                      width: 100,
                                      child: Image.network(
                                          controller.selectedItems[index]
                                              ['foodImage'],
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        child: Padding(
                                          padding:
                                              EdgeInsets.fromLTRB(10, 10, 0, 0),
                                          child: Text(
                                              controller.selectedItems[index]
                                                  ['foodName'],
                                              style:
                                                  GoogleFonts.robotoCondensed(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.w500)),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.5,
                                          child: const Text(
                                            '100% Australian Angus grain-fed beef with cheese and pickles.  Served with fries.',
                                            style: TextStyle(
                                              fontSize: 12,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const Column(
                                    children: <Widget>[
                                      Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(0, 40, 0, 0),
                                        child: Text(
                                          '\$ 24.00',
                                          style: TextStyle(
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
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
                          controller.sendFoodItems();
                          Get.offAll(() => HomePage());
                        },
                        child: const Text(
                          "Submit",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
            Obx(() {
              return controller.isLoading.isTrue
                  ? Positioned.fill(
                      child: Container(
                        color: Colors.black.withOpacity(0.5),
                        child: const Center(
                          child: SpinKitDualRing(
                            color: Colors.cyan,
                          ),
                        ),
                      ),
                    )
                  : const SizedBox();
            }),
          ],
        ),
      );
    }));
  }
}
