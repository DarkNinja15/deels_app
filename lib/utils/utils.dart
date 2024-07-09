import 'package:get/get.dart';

class Utils{
  static void snackBar(String title,String message,){
    Get.snackbar(title, message,snackPosition: SnackPosition.BOTTOM,animationDuration: const Duration(seconds: 2),);
  }
  
}