import 'package:flutter/material.dart';

class CalcView extends StatefulWidget {
  const CalcView({super.key});

  @override
  State<CalcView> createState() => _CalcViewState();
}

class _CalcViewState extends State<CalcView> {
  List<String> str = [
    "c",
    "*",
    "/",
    "<",
    "1",
    "2",
    "3",
    "+",
    "4",
    "5",
    "6",
    "-",
    "7",
    "8",
    "9",
    "*",
    "%",
    "0",
    '.',
    "="
  ];

  final firstNumController = TextEditingController();
  final secondNumController = TextEditingController();
  final operationController = TextEditingController();

  int firstnum = 0;
  int secondnum = 0;
  int result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GridView"),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextFormField(
                controller: firstNumController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: GridView.count(
                padding: const EdgeInsets.all(8),
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                crossAxisCount: 4,
                children: [
                  for (int i = 0; i < str.length; i++) ...{
                    SizedBox(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            handleButtonPress(str[i]);
                          });
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                            foregroundColor: Colors.black),
                        child: Text(
                          str[i],
                          style: const TextStyle(fontSize: 50),
                        ),
                      ),
                    )
                  }
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

// function to handle calculator functionality
  void handleButtonPress(String buttonText) {
      if (buttonText == '<') {
      // If "<" button is pressed, remove the last character from the text field
      String currentText = firstNumController.text;
      if (currentText.isNotEmpty) {
        setState(() {
          firstNumController.text =
              currentText.substring(0, currentText.length - 1);
        });
      }
      return;
    }
    firstNumController.text += buttonText;
    switch (buttonText) {
      case '+':
        operationController.text = '+';
        firstNumController.text = '';
        break;
      case '-':
        operationController.text = '-';
        firstNumController.text = '';
        break;
      case '*':
        operationController.text = '*';
        firstNumController.text = '';
        break;
      case '/':
        operationController.text = '/';
        firstNumController.text = '';
        break;
      case '%':
        operationController.text = '/';
        firstNumController.text = '';
        break;
      case '<':
      

      case 'c':
        operationController.text = '';
        firstNumController.clear();
        secondNumController.clear();
        firstnum = 0;
        secondnum = 0;
        result = 0;
        break;
      case '=':
        if (operationController.text == "+") {
          result = firstnum + secondnum;
          firstNumController.text = result.toString();
        } else if (operationController.text == '-') {
          result = secondnum - firstnum;
          firstNumController.text = result.toString();
        } else if (operationController.text == '*') {
          result = firstnum * secondnum;
          firstNumController.text = result.toString();
        } else if (operationController.text == '/') {
          double result = secondnum / firstnum;
          firstNumController.text = result.toString();
        }
        secondNumController.text = '';

        break;
      default:
        if (operationController.text.isNotEmpty) {
          firstnum = int.tryParse(firstNumController.text) ?? 0;
        } else {
          secondNumController.text += buttonText;
        }
        secondnum = int.tryParse(secondNumController.text) ?? 0;
    }
  }
}
