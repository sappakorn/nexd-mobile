import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
class AuthService {
  final FlutterSecureStorage _storage = FlutterSecureStorage();

  var authToken = ''.obs;
  var userId = ''.obs;
  var customerName = ''.obs;
  var customerImg = ''.obs;

  Future<void> logout() async {
    await clearAuthData(); // เรียกใช้ clearAuthData เพื่อเคลียร์ข้อมูลทั้งหมด
  }

  Future<void> clearAuthData() async {
    await _storage.delete(key: 'authToken');
    await _storage.delete(key: 'id');
    await _storage.delete(key: 'customerName');
    await _storage.delete(key: 'customer_img');

    // ล้างค่าในตัวแปร observable
    authToken.value = '';
    userId.value = '';
    customerName.value = '';
    customerImg.value = '';
  }
}