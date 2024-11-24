import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fluttertest/screen_widget/auth/login_widget.dart';
import 'package:shimmer/shimmer.dart';
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Get.off(() => LoginWidget());
    });

    return Scaffold(
      body: Shimmer.fromColors(
        highlightColor: Colors.white,
        baseColor: Colors.grey.shade800, // เปลี่ยนสีพื้นฐานให้เข้มขึ้น
        child: Container(
          width: double.infinity, // ทำให้เต็มความกว้าง
          height: double.infinity, // ทำให้เต็มความสูง
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.black,
                Colors.black87, // เพิ่มสีเข้มเพื่อความเท่
                Colors.black54,
                Colors.black26,
                Colors.white10,
              ],
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // จัดกลางในแนวตั้ง
            crossAxisAlignment: CrossAxisAlignment.center, // จัดกลางในแนวนอน
            children: [
              Image.network(
                'http://goapibyspk.th1.proen.cloud:8001/my-api/static/uploads/keyboards/NEXDLOGO.png',
                width: 300,
                height: 300,
              ),
              SizedBox(height: 20), // เพิ่มระยะห่างระหว่างโลโก้และข้อความ
            ],
          ),
        ),
      ),
    );
  }
}
