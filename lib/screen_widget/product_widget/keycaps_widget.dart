import 'package:flutter/material.dart';
import 'package:fluttertest/models/Product_List/keycaps_list.dart';
import 'package:get/get.dart';

import '../../controller/product/keycap_controller.dart';

class KeycapsWidget extends StatelessWidget {
  const KeycapsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final KeycapController keycapController = Get.put(KeycapController());
    return Obx(() {
      if (keycapController.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      }
      if (keycapController.errorMessage.value.isNotEmpty) {
        return Center(
          child: Text(keycapController.errorMessage.value),
        );
      }
      return Padding(
        padding: EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemCount: keycapController.keycaps.length,
          itemBuilder: (context, index) {
            final KeycapsList keycap = keycapController.keycaps[index];
            return Card(
              color: Colors.white,
              elevation: 4,
              child: Padding(
                padding: EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  //ขยายเต็มพื้นที่
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          keycap.image,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Icon(Icons.broken_image),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      keycap.name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Colors.black),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 5),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {},
                      child: Text(
                        "Buy Now",
                        style: TextStyle(color: Colors.black, fontSize: 14),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      );
    });
  }
}
