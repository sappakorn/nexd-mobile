import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertest/auth_controller/getx_auth_controller.dart';
import 'package:fluttertest/config/apiURL.dart';
import 'package:fluttertest/models/Product_List/switch_list.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SwitchController extends GetxController {
  final GetxAuthController authController = Get.find<GetxAuthController>();
  var switchs = <SwitchList>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    fetchSwitch();
    super.onInit();
  }

  Future<void> fetchSwitch() async {
    isLoading.value = true;
    try {
      final String token = authController.authToken.value;
      final res = await http.get(
        Uri.parse('${config.apiUrl}/product/switch'),
        headers: {"X-Access-Token": token},
      );
      if (res.statusCode == 200) {
        final data = jsonDecode(res.body);
        switchs.value = (data['result'] as List)
            .map((json) => SwitchList.fromJson(json))
            .toList();
      }else{
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
