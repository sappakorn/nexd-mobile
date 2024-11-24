import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertest/auth_controller/getx_auth_controller.dart';
import 'package:fluttertest/config/apiURL.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../models/Product_List/keyboard_list.dart';

class DarksideController extends GetxController {
  final GetxAuthController authController = Get.find<GetxAuthController>();

  var keyboards = <KeyboardList>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchKeyboards();
  }

  Future<void> fetchKeyboards() async {
    isLoading.value = true;
    try {
      final String token = authController.authToken.value;
      final res = await http.get(
        Uri.parse('${config.apiUrl}/product/keyboard/theme-color/black'),
        headers: {"X-Access-Token": token},
      );

      if (res.statusCode == 200) {
        final data = jsonDecode(res.body);
        keyboards.value = (data['result'] as List)
            .map((json) => KeyboardList.fromJson(json))
            .toList();
      } else {
        final data = jsonDecode(res.body);
        errorMessage.value = data['message'] ?? 'Failled to lead keyboard';
        Get.snackbar(
          'Error',
          errorMessage.value,
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red.withOpacity(0.5),
          colorText: Colors.white,
        );
      }
    } catch (error) {
      errorMessage.value = 'เกิดข้อผิดพลาดกรุณาลองใหม่';
      Get.snackbar(
        'Error',
        errorMessage.value,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red.withOpacity(0.5),
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
