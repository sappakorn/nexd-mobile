import 'package:flutter/cupertino.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertest/config/apiURL.dart';
import 'package:fluttertest/screen_widget/auth/login_widget.dart';
import 'package:http/http.dart' as http;
import 'package:pinput/pinput.dart';

class OtpInput extends StatefulWidget {
  const OtpInput({super.key});

  @override
  State<OtpInput> createState() => _OtpInputState();
}

class _OtpInputState extends State<OtpInput> {
  final TextEditingController OTPcontroller = TextEditingController();
  Future<void> checkOtp () async {

  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            Pinput(
              controller: OTPcontroller,
              length: 6, // จำนวนช่องกรอก OTP
              defaultPinTheme: PinTheme(
                width: 56,
                height: 56,
                textStyle: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: checkOtp,
              child: Text('ยืนยัน OTP'),
            ),
          ],
        ),
      )
    );
  }
}
