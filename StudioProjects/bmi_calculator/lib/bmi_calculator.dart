import 'package:bmi_calculator/class.dart';
import 'package:flutter/material.dart';

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({Key? key}) : super(key: key);

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Color(0xFF0A0E21),
            title: Center(
              child: Text(
                'BMI CALCULATOR',
                style: TextStyle(
                    fontSize: 20,
                    color: Color(
                      0xFFFFFFFF,
                    ),
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          body: Column(
            children: [
              Expanded(
                  child: Row(children: [
                ContainerS(),
                Expanded(
                  child: ContainerS(),
                )
              ]))
            ],
          )),
    );
  }
}
