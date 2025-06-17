import 'package:flutter/material.dart';

Widget buildServiceItem(String imagepath, String title, String subtitle, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: Colors.grey.shade200,
          child: Image.asset(imagepath),
        ),
        const SizedBox(height: 4),
        Text(title),
        Text(subtitle, style: const TextStyle(fontSize: 12, color: Colors.purple)),
      ],
    ),
  );
}
