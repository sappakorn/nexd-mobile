// lib/screen_widget/home_screen/home.dart
import 'package:flutter/material.dart';
import 'package:fluttertest/auth_controller/getx_auth_controller.dart';
import 'package:fluttertest/config/apiURL.dart';
import 'package:fluttertest/screen_widget/auth/login_widget.dart';
import 'package:fluttertest/screen_widget/child_widget/customer_drawer.dart';
import 'package:fluttertest/screen_widget/product_widget/keycaps_widget.dart';
import 'package:get/get.dart';
import '../../../navigation/navigation_bottom.dart';
import '../../../navigation/navigation_controller.dart';
import '../../../screen_widget/auth/logout.dart';
import '../../../screen_widget/customer_widget/profile_widget.dart';
import '../../../screen_widget/product_widget/keyboard_widget.dart';
import '../product_widget/switch_widget.dart';
import 'home_product.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GetxAuthController _authController = Get.find<GetxAuthController>();
  final NavigationController navigationController = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final String customerName = _authController.customerName.value;
      final String profileImg = _authController.customerImg.value.isNotEmpty
          ? _authController.customerImg.value
          : '${config.apiUrl}static/uploads/default/default_profile.png';

      print(customerName);
      return Scaffold(
        appBar: AppBar(
          title: Text("NexD"),
          backgroundColor: Colors.black87,
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(
                Icons.menu,
                color: Colors.white,
                size: 35,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                // Implement shopping cart action
              },
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
                size: 35,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 5.0, top: 5.0),
              child: InkWell(
                onTap: () {
                  Get.to(() => ProfileWidget());
                },
                child: CircleAvatar(
                  backgroundImage: NetworkImage(profileImg),
                  radius: 30,
                ),
              ),
            )
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(80.0), // กำหนดความสูงของ bottom
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8, 8, 8, 8),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "ค้นหา...",
                  hintStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.black45.withOpacity(0.7),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          elevation: 20,
        ),
        drawer: CustomDrawer(),
        body: Obx(() {
          switch (navigationController.selectIndex.value) {
            case 0:
              return HomeProduct();
            case 1:
              return KeyboardWidget(); // ไม่มีการส่ง token ผ่าน constructor
            case 2:
              return KeycapsWidget(); // ไม่มีการส่ง token ผ่าน constructor
            case 3:
              return SwitchWidget();
            default:
              return Center(child: Text("Homepage"));
          }
        }),
        bottomNavigationBar: NavigationBottom(),
      );
    });
  }
}
