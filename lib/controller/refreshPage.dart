import 'package:get/get.dart';

class RefreshPageController extends GetxController {
 
  Future<void> refreshPage() async {
    await Future.delayed(Duration(seconds: 1));
  }

}
