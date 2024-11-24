import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertest/auth_controller/getx_auth_controller.dart';
import 'package:fluttertest/config/apiURL.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../models/Product_List/keyboard_list.dart';

class KeyboardController extends GetxController {
  final GetxAuthController authController = Get.find<GetxAuthController>();

  var keyboards = <KeyboardList>[].obs;
  var isLoading = false.obs;
  var errorMessage = ''.obs;
  var page = 1.obs;
  var hasMore = true.obs;
  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    fetchKeyboards();
    scrollController.addListener(_scrollListener);
    super.onInit();
  }

  void _scrollListener() {
    if (scrollController.position.pixels == scrollController.position.maxScrollExtent){
      fetchKeyboards(page:page.value +1);
    }
  }

  Future<void> fetchKeyboards({int page=1}) async {
    if (isLoading.value || !hasMore .value) return;
    isLoading.value = true;
    try {
      final limit = 6;
      final String token = authController.authToken.value;
      final res = await http.get(
        Uri.parse('${config.apiUrl}/product/keyboard?limit=$limit&page=$page'),
        headers: {"X-Access-Token": token},
      );

      if (res.statusCode == 200) {
        final data = jsonDecode(res.body);
        final newKeyboards = (data['result']['data'] as List)
            .map((json) => KeyboardList.fromJson(json))
            .toList();

        if (newKeyboards.isEmpty) {
          hasMore.value = false; // ไม่มีข้อมูลเพิ่มแล้ว
        } else {
          keyboards.addAll(newKeyboards);
          this.page.value = page; // อัปเดตหน้าปัจจุบัน
        }
      } else {
        final data = jsonDecode(res.body);
        errorMessage.value = data['message'] ?? 'Failed to load keyboards';
        Get.snackbar(
          'Error',
          errorMessage.value,
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.red.withOpacity(0.5),
          colorText: Colors.white,
        );
      }
    } catch (error) {
      print(error);
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