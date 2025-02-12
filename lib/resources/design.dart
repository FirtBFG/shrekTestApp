import 'package:flutter/material.dart';

/*
  0xFFf0ead2
  0xFFdde5b6
  0xFFadc178
  0xFFa98467
  0xFF6c584c
*/

class Design {
  final ButtonStyle buttonStyle = ButtonStyle(
    backgroundColor: const WidgetStatePropertyAll(Color(0xFFa98467)),
    foregroundColor: const WidgetStatePropertyAll(Colors.black),
    overlayColor: const WidgetStatePropertyAll(Color(0xFF8A6C54)),
    shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
  );

  final movieButtonStyle = ButtonStyle(
    padding: const WidgetStatePropertyAll(EdgeInsets.only(right: 10)),
    backgroundColor: const WidgetStatePropertyAll(Color(0xFFdde5b6)),
    foregroundColor: const WidgetStatePropertyAll(Color(0xFF6c584c)),
    overlayColor: const WidgetStatePropertyAll(Color(0xFFBFC69D)),
    shape: WidgetStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(0))),
  );

  final InputDecoration inputDecoration = const InputDecoration(
    border: OutlineInputBorder(),
    enabledBorder:
        OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
    focusedBorder:
        OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFa98467))),
    errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
  );

  final InputDecoration findInputDecoration = const InputDecoration(
    border: OutlineInputBorder(),
    filled: true,
    enabledBorder:
        OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
    focusedBorder:
        OutlineInputBorder(borderSide: BorderSide(color: Color(0xFFa98467))),
    errorBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
    fillColor: Color.fromARGB(179, 213, 207, 187),
  );
}