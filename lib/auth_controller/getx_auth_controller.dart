// lib/auth_controller/getx_auth_controller.dart
import 'package:get/get.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class GetxAuthController extends GetxController {
  final FlutterSecureStorage _storage = const FlutterSecureStorage();

  var authToken = ''.obs;
  var userId = ''.obs;
  var customerName = ''.obs;
  var customerImg = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadAuthData();
  }

  Future<void> loadAuthData() async {
    authToken.value = await _storage.read(key: 'authToken') ?? '';
    userId.value = await _storage.read(key: 'id') ?? '';
    customerName.value = await _storage.read(key: 'customerName') ?? '...';
    customerImg.value = await _storage.read(key: 'customer_img') ?? '';
  }

  Future<void> saveAuthData(String token, String id, String name, String customerImgPath) async {
    await _storage.write(key: 'authToken', value: token);
    await _storage.write(key: 'id', value: id);
    await _storage.write(key: 'customerName', value: name);
    await _storage.write(key: 'customer_img', value: customerImgPath);
    authToken.value = token;
    userId.value = id;
    customerName.value = name;
    customerImg.value = customerImgPath;
  }

}
