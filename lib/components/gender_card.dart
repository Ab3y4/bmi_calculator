import 'package:bmi_calculator/screens/calculate_screen.dart';
import 'package:flutter/material.dart';

class GenderCard extends StatelessWidget {
  GenderCard(
      {required this.icon,
      required this.text,
      required this.onTap,
      required this.color});

  final IconData icon;
  final String text;
  final VoidCallback onTap;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: color,
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        width: 190,
        // height: 220,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 115,
              color: Colors.white,
            ),
            const SizedBox(height: 15),
            Text(
              text.toUpperCase(),
              style: TextStyle(color: Colors.grey[400], fontSize: 20),
            )
          ],
        ),
      ),
    );
  }
}
