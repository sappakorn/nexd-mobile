import 'package:flutter/material.dart';
import 'package:fluttertest/icons/icons.dart';
import 'package:fluttertest/navigation/navigation_controller.dart';
import 'package:get/get.dart';

class NavigationBottom extends StatelessWidget {
  final NavigationController navigationController =
      Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white.withOpacity(0.35), // สีขาวโปร่งใส
              Colors.black, // สีดำ
            ],
          ),
        ),
        child: NavigationBar(
          height: 100,
          elevation: 0,
          selectedIndex: navigationController.selectIndex.value,
          onDestinationSelected: (index) {
            navigationController.changeIndex(index);
          },
          destinations: const [
            NavigationDestination(
                icon: Icon(
                  CustomIcon.Home,
                  color: Colors.white,
                ),
                label: "Home"),
            NavigationDestination(
                icon: Icon(
                  CustomIcon.KeyBoard,
                  color: Colors.white,
                ),
                label: "Keyboard"),
            NavigationDestination(
                icon: Icon(CustomIcon.Keycaps, color: Colors.white),
                label: "Keycaps"),
            NavigationDestination(
                icon: Icon(
                  CustomIcon.Switch,
                  color: Colors.white,
                ),
                label: "Switch"),
          ],
        ),
      );
    });
  }
} /**/
