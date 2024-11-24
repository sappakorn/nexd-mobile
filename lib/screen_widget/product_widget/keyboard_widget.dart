import 'package:flutter/material.dart';
import 'package:fluttertest/controller/product/keyboard_controller.dart';
import 'package:get/get.dart';
import '../../models/Product_List/keyboard_list.dart';

class KeyboardWidget extends StatelessWidget {
  const KeyboardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final KeyboardController keyboardController = Get.put(KeyboardController());

    return Obx(() {
      if (keyboardController.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      }

      if (keyboardController.errorMessage.value.isNotEmpty) {
        return Center(child: Text(keyboardController.errorMessage.value));
      }

      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          controller: keyboardController.scrollController,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.75,
            crossAxisSpacing: 10.0,
            mainAxisSpacing: 10.0,
          ),
          itemCount: keyboardController.keyboards.length,
          itemBuilder: (context, index) {
            final KeyboardList keyboard = keyboardController.keyboards[index];
            return Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          keyboard.image,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Icon(Icons.broken_image),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      keyboard.name,
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
                        child: const Text(
                          "Buy Now",
                          style: TextStyle(color: Colors.black, fontSize: 14),
                        ))
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