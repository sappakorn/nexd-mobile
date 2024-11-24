// lib/screen_widget/auth/login_widget.dart
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fluttertest/auth_controller/getx_auth_controller.dart';
import 'package:fluttertest/config/apiURL.dart';
import 'package:fluttertest/screen_widget/auth/register_widget.dart';
import 'package:fluttertest/snackbar/snackbar_custom.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../home_screen/home.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final _formKey = GlobalKey<FormState>();

  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  // ใช้ AuthController จาก GetX
  final GetxAuthController _authController = Get.put(GetxAuthController());

  final SnackBarCustom snackBarCustom = new SnackBarCustom();


  Future<void> onLogin() async {
    if (_formKey.currentState!.validate()) {
      try {
        final response = await http.post(
          Uri.parse("${config.apiUrl}/auth/login"),
          headers: {'Content-Type': 'application/json'},
          body: jsonEncode({
            "telephone": _phoneController.text,
            "password": _passwordController.text,
          }),
        );

        final utf8Response = utf8.decode(response.bodyBytes);
        final resJson = jsonDecode(utf8Response);
        print("resJson: $resJson");

        final message = resJson['message'];

        if (response.statusCode == 200) {
          final customer = resJson['result']['customer'];
          final token = resJson['result']['token'];
          final id = customer['id'];
          final customerImg = customer['image_profile'];
          final name = customer['name'];

          // เก็บ Token และข้อมูลผู้ใช้ผ่าน AuthController
          await _authController.saveAuthData(token, id, name, customerImg);

          snackBarCustom.successMessage(context, message);
          // นำทางไปยัง HomePage โดยไม่ต้องส่งข้อมูลผ่าน constructor
          Get.offNamed('/home');
        } else {
          snackBarCustom.errorMessage(context,message);
        }
      } catch (error) {
        snackBarCustom.errorMessage(context,"เกิดข้อผิดพลาดกรุณาลองใหม่ภายหลัง");
        return null;
      }
    }
  }

  @override
  void dispose() {
    // ทำการลบ Controller เมื่อ Widget ถูกลบ
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Center(
        child: SingleChildScrollView( // ป้องกันการล้นเมื่อคีย์บอร์ดปรากฏ
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.network(
                  'http://goapibyspk.th1.proen.cloud:8001/my-api/static/uploads/keyboards/NEXDLOGO.png',
                  width: 300,
                  height: 300,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _phoneController,
                  decoration: const InputDecoration(labelText: "Phone Number"),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Phone number';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(labelText: "Password"),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Password';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 50),
                ElevatedButton(
                  onPressed: onLogin,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 5,
                  ),
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Get.to(()=> RegisterWidget(), transition: Transition.leftToRight);
                  },
                  child: const Text(
                    "Click Here! Register",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white54,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
