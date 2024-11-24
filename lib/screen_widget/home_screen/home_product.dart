import 'package:flutter/material.dart';

import 'colorful_screen.dart';
import 'darkside_screen.dart';

class HomeProduct extends StatefulWidget {
  const HomeProduct({super.key});

  @override
  State<HomeProduct> createState() => _HomeProductState();
}

class _HomeProductState extends State<HomeProduct> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
          color: Colors.black54,
            child: Column(
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
                    child: Text(
                      'Dark Side Series',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 1, horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "View more",
                          style: TextStyle(color: Colors.black87, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Container(
                    child: DarkSideScreen(),
                    padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: Colors.deepPurpleAccent,
            child: Column(
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 5),
                    child: Text(
                      'Dark Side Series',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 1, horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "View more",
                          style: TextStyle(color: Colors.black87, fontSize: 16),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Container(
                    child: ColorfulScreen(),
                    padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

