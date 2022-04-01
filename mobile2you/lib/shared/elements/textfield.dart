import 'package:flutter/material.dart';

Widget buildTextField({required size, label, controller, width, numberOnly}) {
  return SizedBox(
      width: width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
              keyboardType:
                  numberOnly ? TextInputType.number : TextInputType.text,
              cursorColor: Colors.grey.shade600,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white, fontSize: 18),
              decoration: InputDecoration(
                  label: Text(label),
                  labelStyle: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                  fillColor: Colors.grey.shade900.withOpacity(0.7),
                  filled: true,
                  border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white, width: 0.2),
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: Colors.black.withOpacity(0), width: 0.5),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15))),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.red.withOpacity(0.4)),
                      borderRadius:
                          const BorderRadius.all(Radius.circular(15)))),
              controller: controller),
        ],
      ));
}
