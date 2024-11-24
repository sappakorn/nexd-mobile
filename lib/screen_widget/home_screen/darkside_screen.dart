import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:shimmer/shimmer.dart';
import '../../controller/darkside_controller.dart';

class DarkSideScreen extends StatelessWidget {
  final DarksideController controller = Get.put(DarksideController());

  @override
  Widget build(BuildContext context) {
    return  Obx(() {
        if (controller.keyboards.isEmpty) {
          return Center(child: Text('No keyboards available', style: TextStyle(color: Colors.white)));
        }
        return CarouselSlider(
          options: CarouselOptions(
            autoPlay: true, //เล่นอัตโนมัติ
            autoPlayInterval: const Duration(seconds: 2), //delay
            initialPage: 0, // index,
            enlargeCenterPage: true,
            enlargeFactor: 0.7,
            height: 290
          ),
          items: controller.keyboards.map((keyboard) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 2, horizontal: 5),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Stack(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        child: Image.network(
                          keyboard.image, // ใส่ URL ของรูปภาพจากข้อมูลใน KeyboardList
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => Container(
                            color: Colors.white,
                            child: Center(child: Icon(Icons.broken_image)),
                          ),
                        ),
                      ),
                      Positioned(
                        top: 10,
                        right: 10,
                        child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.deepPurpleAccent,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            'ส่วนลด 20%',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],

                  ),

                );
              },
            );
          }).toList(),
        );
      });
  }
}
