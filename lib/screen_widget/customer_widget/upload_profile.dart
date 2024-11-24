import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import "package:file_picker/file_picker.dart";
import 'package:http/http.dart' as http;


class UploadProfile extends StatefulWidget {
  @override
  _UploadProfileState createState() => _UploadProfileState();
}

class _UploadProfileState extends State<UploadProfile> {
  File? _selectedFile;

  final ImagePicker _imagePicker = ImagePicker();

  // เลือกรูปภาพจากแกลเลอรี
  Future<void> _pickImage() async {

  }

  // เลือกไฟล์ประเภทอื่นๆ
  Future<void> _pickFile() async {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("File Picker Example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // แสดงไฟล์ที่เลือก
            _selectedFile != null
                ? Text(
              'Selected File: ${_selectedFile!.path}',
              textAlign: TextAlign.center,
            )
                : Text('No file selected.'),
            SizedBox(height: 20),

            // ปุ่มเลือกภาพจากแกลเลอรี
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)
                )
              ),
              onPressed: _pickImage,
              child: Text("เลือกไฟล์จากคลังรูปภาพ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color: Colors.black),),
            ),
            SizedBox(height: 10),

          ],
        ),
      ),
    );
  }
}
