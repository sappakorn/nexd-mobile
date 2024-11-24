import 'package:fluttertest/auth_controller/getx_auth_controller.dart';
import 'package:get/get.dart';
import '../models/Product_List/keyboard_list.dart';
import 'package:http/http.dart' as http;
class ColorfulController extends GetxAuthController {
  var keyboards = <KeyboardList>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;
}