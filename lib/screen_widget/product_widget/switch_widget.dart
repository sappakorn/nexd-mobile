
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertest/controller/product/switch_controller.dart';
import 'package:fluttertest/models/Product_List/switch_list.dart';
import 'package:get/get.dart';

class SwitchWidget extends StatefulWidget {
  const SwitchWidget({super.key});


  @override
  State<SwitchWidget> createState() => _SwitchWidgetState();
}

class _SwitchWidgetState extends State<SwitchWidget> {

  @override
  Widget build(BuildContext context) {
    final SwitchController switchController = Get.put(SwitchController());
    return Obx(() {
      if (switchController.isLoading.value) {
        return Center(child: CircularProgressIndicator());
      }
      if (switchController.errorMessage.value.isNotEmpty) {
        return Center(child: Text(switchController.errorMessage.value));
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
          itemCount: switchController.switchs.length,
          itemBuilder: (context, index) {
            final SwitchList sw = switchController.switchs[index];
            return Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              color: Colors.white,
              elevation: 4,
              shadowColor: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          sw.image,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => Icon(Icons.broken_image),
                        ),
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      sw.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Price: ${sw.price} Bath',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(height: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () {
                        // Add action here, e.g., add to cart or view details
                      },
                      child: Text(
                        'Buy Now',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 14,
                        ),
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
