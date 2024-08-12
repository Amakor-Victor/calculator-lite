import 'package:flutter/material.dart';
import 'package:listviewbuilder/homepage.dart';

class CalcButtons extends StatelessWidget {
  String buttontext;
  void Function()? getNumber;
  CalcButtons({super.key, required this.buttontext, required this.getNumber});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: getNumber,
      child: Container(
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 17, 3, 54),
            borderRadius: BorderRadius.circular(10)),
        child: Center(
            child: Text(
          buttontext,
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
        )),
      ),
    );
  }
}
