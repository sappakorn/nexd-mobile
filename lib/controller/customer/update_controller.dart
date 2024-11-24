import 'package:fluttertest/auth_controller/getx_auth_controller.dart';
import 'package:fluttertest/config/apiURL.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class UpdateController extends GetxController {
  final GetxAuthController getxAuthController = Get.find<GetxAuthController>();

  Future<void> updateProfile({required String profileImage}) async {
    try {
      final String token = getxAuthController.authToken.value;
      final String id = getxAuthController.userId.value;

      final res = await http.patch(
        Uri.parse('${config.apiUrl}/customer/profile/image/$id'),
        body: {

        },
        headers: {"X-Access-Token": token},
      );
    } catch (error) {
      print("error");
    }
  }
}
