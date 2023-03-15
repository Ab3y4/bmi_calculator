import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class WeightAgeCard extends StatelessWidget {
  WeightAgeCard(
      {required this.text,
      this.onTapMinus,
      this.onTapPlus,
      required this.value});

  final String text;
  final int value;
  final VoidCallback? onTapMinus;
  final VoidCallback? onTapPlus;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF1D1F31),
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      width: 190,
      // height: 220,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text.toUpperCase(),
                style: TextStyle(color: Colors.grey[400], fontSize: 20),
              ),
              Text(
                value.toString(),
                style: const TextStyle(
                    fontSize: 60,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  InkWell(
                    onTap: onTapMinus,
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Color(0xFF4C4F5D), shape: BoxShape.circle),
                      child: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Icon(
                          FontAwesomeIcons.minus,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: onTapPlus,
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Color(0xFF4C4F5D), shape: BoxShape.circle),
                      child: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Icon(
                          FontAwesomeIcons.plus,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
