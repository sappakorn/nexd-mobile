
import 'package:get/get.dart';
import 'package:fluttertest/auth_controller/getx_auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<GetxAuthController>(GetxAuthController(), permanent: true); // เพิ่ม permanent: true
  }
}
