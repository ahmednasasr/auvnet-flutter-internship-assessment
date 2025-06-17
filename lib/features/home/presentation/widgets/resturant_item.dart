import 'package:flutter/material.dart';

Widget buildRestaurantItem(String imagePath, String name, String time, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 100,
      margin: const EdgeInsets.only(right: 12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 24,
            backgroundColor: Colors.red.shade100,
            child: Image.asset(imagePath),
          ),
          const SizedBox(height: 4),
          Text(name,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis),
          Text(time, style: const TextStyle(fontSize: 12, color: Colors.grey)),
        ],
      ),
    ),
  );
}
