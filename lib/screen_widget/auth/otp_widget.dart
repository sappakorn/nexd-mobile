import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertest/config/apiURL.dart';
import 'package:fluttertest/screen_widget/auth/login_widget.dart';
import 'package:fluttertest/snackbar/snackbar_custom.dart';
import 'package:http/http.dart' as http;
import 'package:pinput/pinput.dart';

class OtpWidget extends StatelessWidget {
  late final String telephone;
  late final String reference;
  late final String id;
  late final String name;
  late final String password;

  //constructor จะต้องมีอะไรเข้ามาบ้าง สำหรับ OTPwidget
  OtpWidget({
    required this.telephone,
    required this.reference,
    required this.id,
    required this.name,
    required this.password,
  });

  @override
  Widget build(BuildContext context) {
    final SnackBarCustom snackBarCustom = new SnackBarCustom();

    // ตัวแปรสำหรับเก็บ OTP ที่กรอก
    final TextEditingController OTPcontroller = TextEditingController();
    Future<void> checkOtp() async {
      final res = await http.patch(
          Uri.parse('${config.apiUrl}/auth/register/verify/${id}'),
          headers: {'contentType': 'application/json'},
          body: {"code": OTPcontroller.text, "reference": reference});

      //ยิงverify สำเร็จ
      if (res.statusCode == 200) {
        final resJson = jsonDecode(res.body);
        print(resJson['message']);
        //ยิงเส้นcustomer_submit
        final resOnSubmit = await http.post(
            Uri.parse("${config.apiUrl}/auth/register/submit"),
            headers: {"contentType": "applicattion/json"},
            body: {"name": name, "telephone": telephone, "password": password});

        final utf8Response = utf8.decode(resOnSubmit
            .bodyBytes); //ใช้แปลง เมื่อ json ส่งกลับมาไม่เป็น ภาษาไทย
        final result = jsonDecode(utf8Response);

        if (resOnSubmit.statusCode == 200) {
          final msg = "สมัครสมาชิกสำเร็จ";
          snackBarCustom.successMessage(context,msg);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoginWidget(),
            ),
          );
        }
        //RegisterSuccessWidget
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("รหัสOTPไม่ถูกต้อง!"),
            duration: Duration(seconds: 2), // ระยะเวลาที่ Snackbar จะแสดง
          ),
        );
        final resJson = jsonDecode(res.body);
        print(resJson['message']);
      }
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  "Verification code",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              SizedBox(height: 20),
              Text("Enter the code sent to your number"),
              SizedBox(height: 20),
              Text(telephone,style: TextStyle(color: Colors.deepPurpleAccent),),
              SizedBox(height: 40),
              Pinput(
                keyboardType: TextInputType.number,
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
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(20),
                child:ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(280, 60),
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.white,
                    side: BorderSide(width: 2,color: Colors.deepPurpleAccent),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10), // ทำให้เป็นสี่เหลี่ยม
                    ),
                  ),
                  onPressed: checkOtp ,
                  child: Text('verify',style: TextStyle(fontSize: 25)),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
