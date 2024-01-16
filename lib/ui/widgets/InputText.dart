
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


Widget InputText(String label, TextInputType type,
    TextEditingController controller, bool enable) {
  return Container(
      child: Theme(
        data: ThemeData(
          primaryColor: Colors.redAccent,
          primaryColorDark: Colors.red,
        ),
        child: TextField(
          enabled: enable ,
          controller: controller,
          keyboardType: type,
          decoration: InputDecoration(
            counterText: controller.text,
              border: const OutlineInputBorder(
              borderSide: BorderSide(color: Color(0xFF8E8E93))),
              labelText: label,
              focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFEB5757)))
        ),
      )));
}


Widget InputText2(String label, TextInputType type,
    TextEditingController controller, bool enable, String text) {
  return Container(
      child: Theme(
          data: ThemeData(
            primaryColor: Colors.redAccent,
            primaryColorDark: Colors.red,
          ),
          child: TextField(
            controller: controller,
            enabled: enable ,
            keyboardType: type,
            decoration: InputDecoration(
                counterText: controller.text,
                border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF8E8E93))),
                labelText: label,
                hintText: text,

                focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFEB5757)))
            ),
          )));
}
