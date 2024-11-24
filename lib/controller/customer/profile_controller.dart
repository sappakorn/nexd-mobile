import 'dart:convert';
import 'package:fluttertest/auth_controller/getx_auth_controller.dart';
import 'package:fluttertest/config/apiURL.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../models/customer/customer_profile.dart';

class ProfileController extends GetxController {
  final GetxAuthController authController = Get.find<GetxAuthController>();

  var isLoading = false.obs; // สำหรับสถานะการโหลด
  var errorMessage = ''.obs; // สำหรับข้อความแสดงข้อผิดพลาด
  var customer = Rx<CustomerList?>(null); // สำหรับเก็บข้อมูลลูกค้า

  @override
  void onInit() {
    super.onInit();
    fetchCustomerProfile();
  }

  Future<void> fetchCustomerProfile() async {
    isLoading.value = true;
    errorMessage.value = ''; // ล้างข้อความข้อผิดพลาดก่อนดึงข้อมูล

    try {
      final String token = authController.authToken.value;
      final String id = authController.userId.value;

      final res = await http.get(
        Uri.parse('${config.apiUrl}/customer/profile/$id'),
        headers: {"X-Access-Token": token},
      );

      if (res.statusCode == 200) {
        final data = jsonDecode(res.body);
        final result = data['result'];
        customer.value = CustomerList.fromJson(result); // เก็บข้อมูลในตัวแปร `customer`
      } else {
        final data = jsonDecode(res.body);
        final result = data['message'];
        errorMessage.value = result; // เก็บข้อความข้อผิดพลาด
        print(result);
      }
    } catch (error) {
      errorMessage.value = 'An error occurred: $error'; // แสดงข้อผิดพลาด
      print(error);
    } finally {
      isLoading.value = false;
    }
  }
}
