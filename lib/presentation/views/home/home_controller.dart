import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxInt currentIndex = 0.obs;
  
  void changeTab(int index) {
    currentIndex.value = index;
  }
  
  void showNotifications() {
    Get.snackbar(
      'Notifications',
      'Vous avez de nouvelles notifications',
      snackPosition: SnackPosition.TOP,
    );
  }
}