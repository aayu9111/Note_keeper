import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({Key? key}) : super(key: key);

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  late int firstNum;
  late int secondNum;
  String textToDisplay = '';
  late String res;
  late String operation;
  void btnClick(String btnVal) {
    if (btnVal == 'AC') {
      textToDisplay = "";
      firstNum = 0;
      secondNum = 0;
      res = "";
    } else if (btnVal == "+" || btnVal == "-" || btnVal == "x" || btnVal == "/") {
      firstNum = int.parse(textToDisplay);
      res = "";
      operation = btnVal;
    } else if (btnVal == "=") {
      secondNum = int.parse(textToDisplay);
      if (operation == "+") {
        res = (firstNum + secondNum).toString();
      }
      if (operation == "-") {
        res = (firstNum - secondNum).toString();
      }
      if (operation == "x") {
        res = (firstNum * secondNum).toString();
      }
      if (operation == "/") {
        res = (firstNum / secondNum).toString();
      }
    } else {
      res = int.parse(textToDisplay + btnVal).toString();
    }
    setState(() {
      textToDisplay = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<String> button = ['7', '8', '9', '/', '6', '5', '4', 'x', '3', '2', '1', '+', '0', '-', '=', 'AC'];

    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Column(
        children: [
          const Padding(padding: EdgeInsets.symmetric(vertical: 20, horizontal: 8)),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.bottomRight,
              child: Text(
                textToDisplay,
                style: TextStyle(fontSize: 25),
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: Container(
                  child: GridView.builder(
                      itemCount: button.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                      itemBuilder: (BuildContext context, int index) {
                        return btn(
                          Colors.white,
                          button[index],
                          Colors.deepPurple,
                        );
                      })))
        ],
      ),
    ));
  }

  Widget btn(Color color, String buttonText, Color Textcolor) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: GestureDetector(
        onTap: () => btnClick(buttonText),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Container(
            color: color,
            child: Center(
              child: Text(
                buttonText,
                style: TextStyle(color: Textcolor, fontSize: 25),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
