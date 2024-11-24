import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OtpText extends StatelessWidget {
  const OtpText({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blueGrey,
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            const Text(
              "O T P ",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 26),
            ),
            const Text("Verification",style: TextStyle(fontSize: 18,fontWeight: FontWeight.w100),),
          ],
        ));
  }
}
