import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class BasicFoodItemsController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getBasicData();
  }

  RxList<RxMap<String, dynamic>> foodItems = <RxMap<String, dynamic>>[].obs;
  RxList<RxMap<String, dynamic>> selectedItems = <RxMap<String, dynamic>>[].obs;
  RxBool isLoading = false.obs;
  CollectionReference collection =
      FirebaseFirestore.instance.collection('admin');
  Logger logger = Logger();

  Future<void> getBasicData() async {
    isLoading(true);
    selectedItems.clear(); // when page rebuild then clear selected data
    try {
      QuerySnapshot querySnapshot = await collection.get();
      foodItems.clear(); // Clear the existing data
      querySnapshot.docs.forEach((doc) {
        foodItems.add((doc.data() as Map<String, dynamic>).obs);
      });
      isLoading(false);
    } catch (e) {
      Logger().d(e);
    }
  }

  void getSelectItems(int index) {
    final selectedFoodItem = foodItems[index]["foodName"];

    // Check if selectedFoodItem already exists in selectedItems
    if (!selectedItems.any((item) => item["foodName"] == selectedFoodItem)) {
      // Find the food item map from foodItems using the selectedFoodItem's name
      final foodItemMap =
          foodItems.firstWhere((item) => item["foodName"] == selectedFoodItem);

      // Add the found food item map to selectedItems
      selectedItems.add(foodItemMap);
    } else {
      // Item already exists, you can handle this case if needed
      Fluttertoast.showToast(
          webShowClose: true,
          backgroundColor: Colors.amber,
          msg: "Food item exist already");
    }
  }

  Future<void> sendFoodItems() async {
    final fireStore = FirebaseFirestore.instance;
    try {
      for (final element in selectedItems) {
        await fireStore
            .collection('kitchen')
            .doc(FirebaseAuth.instance.currentUser!.uid)
            .collection('selectedFoods')
            .add(element);
      }
      logger.d("All selected items sent to Firestore");
    } catch (e) {
      logger.d("Error sending selected items to Firestore: $e");
    }
  }
}
