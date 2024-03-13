import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class BasicFoodItemsController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    getBasicData();
  }

  RxList<RxMap<String, dynamic>> foodItems = <RxMap<String, dynamic>>[].obs;
  RxList<RxMap<String, dynamic>> SelectedItems = <RxMap<String, dynamic>>[].obs;
  RxBool isLoading = false.obs;
  CollectionReference collection =
      FirebaseFirestore.instance.collection('admin');

  Future<void> getBasicData() async {
    isLoading(true);
    SelectedItems.clear(); // when page rebuild then clear selected data
    try {
      QuerySnapshot querySnapshot = await collection.get();
      foodItems.clear(); // Clear the existing data
      querySnapshot.docs.forEach((doc) {
        foodItems.add((doc.data() as Map<String, dynamic>).obs);
      });
      Logger().d(foodItems.value);
      isLoading(false);
    } catch (e) {
      Logger().d(e);
    }
  }

  void getSelectItems(int index) {
    // SelectedItems.clear(); // Clear the existing data
    SelectedItems.add(foodItems[index]);
  }
}
