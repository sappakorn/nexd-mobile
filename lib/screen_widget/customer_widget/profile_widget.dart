import 'package:flutter/material.dart';
import 'package:fluttertest/screen_widget/customer_widget/upload_profile.dart';
import 'package:get/get.dart';
import '../../controller/customer/profile_controller.dart';

class ProfileWidget extends StatelessWidget {
  final ProfileController profileController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        centerTitle: true,
        backgroundColor: Colors.black54,
        elevation: 0,
      ),
      body: Obx(() {
        // ถ้ากำหนด LOAD
        if (profileController.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        //ถ้าเกิดข้อผิดพลาด จะแสดง ข้อผิดพลาดทางหน้าจอ
        if (profileController.errorMessage.isNotEmpty) {
          return Center(
            child: Text(profileController.errorMessage.value),
          );
        }

        // ถ้าไม่มีข้อมูล
        if (profileController.customer.value == null) {
          return const Center(
            child: Text("No customer data available."),
          );
        }

        //ดึงข้อมูลจาก profileController ที่ return กลับมา
        // SizedBox(height: 200, child: Image.network(customer.imageProfile)),
        //Text(customer.name, style: const TextStyle(fontSize: 24)),
        //(customer.telephone, style: const TextStyle(fontSize: 16)),

        final customer = profileController.customer.value!;
        return Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Color.fromARGB(255, 128, 0, 128),
                      Color.fromRGBO(255, 255, 255, 255)
                    ],
                    begin: FractionalOffset.bottomCenter,
                    end: FractionalOffset.topCenter),
              ),
            ),
            Scaffold(
              backgroundColor: Colors.transparent,
              body: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                      Text(
                        "Hello ${customer.name}",
                        style: TextStyle(fontSize: 15),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Stack(
                          children: [
                            CircleAvatar(
                              radius: 100,
                              backgroundImage:
                                  NetworkImage(customer.imageProfile),
                            ),
                            Positioned(
                              bottom: 12,
                              right: 0,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              UploadProfile()));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.black,
                                      shape: BoxShape.circle),
                                  padding: EdgeInsets.all(8),
                                  child: Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 30,),
                      Container(
                        child: Text("Name : ${customer.name}"),
                      ),
                      Container(
                        child: Text("Telephone : ${customer.telephone}"),
                      ),
                      Container(
                        child: Text("Id : ${customer.id}"),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        );
      }),
    );
  }
}
