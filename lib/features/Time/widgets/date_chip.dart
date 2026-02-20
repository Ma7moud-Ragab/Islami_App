import 'package:flutter/material.dart';

Widget dateChip(String text) {
  return Container(
    width: 88,
    height: 46,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Colors.black, Color(0xFFE2BE7F)],
      ),
      borderRadius: BorderRadius.circular(24),
    ),
    child: Text(
      text,
      textAlign: TextAlign.center,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
