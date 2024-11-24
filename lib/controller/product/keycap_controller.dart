import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertest/auth_controller/getx_auth_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../config/apiURL.dart';
import '../../models/Product_List/keycaps_list.dart';

class KeycapController extends GetxController {
  final GetxAuthController getxAuthController = Get.find<GetxAuthController>();

  var keycaps = <KeycapsList>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    fetchKeycaps();
  }

  Future<void> fetchKeycaps() async {
    isLoading.value = true;

    try {
      final String token = getxAuthController.authToken.value;
      final res = await http
          .get(Uri.parse('${config.apiUrl}/product/keycaps'),
          headers: {"X-Access-Token": token}
      );
      if (res.statusCode == 200) {
        final data = jsonDecode(res.body);
        keycaps.value = (data['result'] as List)
            .map((json) => KeycapsList.fromJson(json))
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
