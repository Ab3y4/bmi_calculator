import 'package:bmi_calculator/components/bottom_card.dart';
import 'package:bmi_calculator/components/gender_card.dart';
import 'package:bmi_calculator/components/weightagecard.dart';
import 'package:bmi_calculator/logic/bmi_brain.dart';
import 'package:bmi_calculator/screens/results_screen.dart';
import 'package:flutter/material.dart';

enum Gender { male, female }

class CalculateScreen extends StatefulWidget {
  const CalculateScreen({Key? key}) : super(key: key);

  @override
  State<CalculateScreen> createState() => _CalculateScreenState();
}

Gender selectedGender = Gender.male;

int height = 172;
int weight = 60;
int age = 18;

CalculatorBrain calBrain = CalculatorBrain(age: age, height: height);

class _CalculateScreenState extends State<CalculateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI Calculator'),
        backgroundColor: const Color(0xFF0C0E20),
      ),
      backgroundColor: const Color(0xFF0C0E20),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GenderCard(
                  icon: Icons.male_rounded,
                  text: 'Male',
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.male;
                    });
                  },
                  color: (selectedGender == Gender.male)
                      ? const Color(0xFF1D1F31)
                      : const Color(0xFF121427),
                ),
                GenderCard(
                  icon: Icons.female_rounded,
                  text: 'female',
                  onTap: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  color: (selectedGender == Gender.female)
                      ? const Color(0xFF1D1F31)
                      : const Color(0xFF121427),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                  color: const Color(0xFF1D1F31),
                  borderRadius: BorderRadius.circular(15)),
              height: 220,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'height'.toUpperCase(),
                    style: TextStyle(color: Colors.grey[400], fontSize: 20),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: const TextStyle(
                            fontSize: 60,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'cm',
                        style: TextStyle(color: Colors.grey[400], fontSize: 20),
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        thumbColor: const Color(0xFFD83557),
                        activeTrackColor: Colors.white,
                        thumbShape: const RoundSliderThumbShape(
                            enabledThumbRadius: 15)),
                    child: Slider(
                      value: height.toDouble(),
                      onChanged: (double val) {
                        setState(() {
                          height = val.toInt();
                        });
                      },
                      min: 120.0,
                      max: 220.0,
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                WeightAgeCard(
                  value: weight,
                  text: 'weight',
                  onTapMinus: () {
                    setState(() {
                      weight--;
                    });
                  },
                  onTapPlus: () {
                    setState(() {
                      weight++;
                    });
                  },
                ),
                WeightAgeCard(
                  value: age,
                  text: 'Age',
                  onTapMinus: () {
                    setState(() {
                      age--;
                    });
                  },
                  onTapPlus: () {
                    setState(() {
                      age++;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 15),
            Expanded(
                child: BottomButton(
              buttonText: 'Calculate',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultsScreen(
                      bmi: calBrain.calculateBmi(),
                      paragraph: calBrain.getParagraph(),
                      result: calBrain.getResult(),
                    ),
                  ),
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
