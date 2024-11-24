import 'dart:convert';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:fluttertest/screen_widget/auth/login_widget.dart';
import 'package:fluttertest/screen_widget/auth/otp_widget.dart'; // นำเข้า OtpVerificationWidget
import 'package:http/http.dart' as http;

import '../../config/apiURL.dart';

class RegisterWidget extends StatefulWidget {
  const RegisterWidget({super.key});

  @override
  State<RegisterWidget> createState() => _RegisterWidgetState();
}

class _RegisterWidgetState extends State<RegisterWidget> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _phone = TextEditingController();
  final _password = TextEditingController();

  Future<void> onRegister() async {
    final Map<String, dynamic> payload = {
      'telephone': _phone.text,
      'type_verify': 'REGISTER'
    };
    final res = await http.post(
      Uri.parse('${config.apiUrl}/auth/register'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(payload),
    );

    if (res.statusCode == 200) {
      final jsonRes = jsonDecode(res.body);
      final result = jsonRes['result'];
      print(result);
      String telephone =
          result['telephone'] ?? 'Unknown'; // ใช้ค่าเริ่มต้นถ้าเป็น null
      String reference =
          result['reference'] ?? 'Unknown'; // ใช้ค่าเริ่มต้นถ้าเป็น null
      String id = result['id'] ?? 'Unknown'; // ใช้ค่าเริ่มต้นถ้าเป็น null
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => OtpWidget(
            telephone: telephone,
            reference: reference,
            id: id,
            name: _name.text,
            password: _password.text,
          ),
        ),
      );
    } else if (res.statusCode == 400) {
      final jsonRes = jsonDecode(res.body);
      final message = jsonRes['message'];
      if (message == "TELEPHONE_ALREADY_EXISTS") {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("หมายเลขโทรศัพท์นี้มีการลงทะเบียนแล้ว"),
            duration: Duration(seconds: 2), // ระยะเวลาที่ Snackbar จะแสดง
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
            body: Container(
              margin: EdgeInsets.fromLTRB(0, 130, 0, 0),
              child: SingleChildScrollView(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.network(
                            'http://goapibyspk.th1.proen.cloud:8001/my-api/static/uploads/keyboards/NEXDLOGO.png',
                            width: 300,
                            height: 300,
                          ),
                          TextFormField(
                            controller: _name,
                            decoration: const InputDecoration(labelText: "Name"),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your Name';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            keyboardType: TextInputType.phone,
                            controller: _phone,
                            decoration:
                                const InputDecoration(labelText: "Phone Number"),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your Phone number';
                              }
                              return null;
                            },
                          ),
                          TextFormField(
                            controller: _password,
                            obscureText: true,
                            decoration:
                                const InputDecoration(labelText: "Password"),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please enter your Password';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ElevatedButton(
                            onPressed: onRegister,
                           style: ElevatedButton.styleFrom(
                             backgroundColor: Colors.white,
                             padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                             shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(30),
                             ),
                             elevation:5
                           ),
                            child: Text(
                              "Register",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.black
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextButton(
                            onPressed: () {
                              Get.to(()=> LoginWidget(), transition: Transition.rightToLeft );
                            },
                            child: Text(
                              "Click Here! Login",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white54
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
    );
  }
}
