import 'package:get/get.dart';

class NavigationController extends GetxController {
  var selectIndex = 0.obs;

  void changeIndex(int index){
    selectIndex.value = index;
  }
}