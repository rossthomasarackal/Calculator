import 'package:calculator/buttons.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var userInput = '';
  var answer = '';

  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    'x',
    '7',
    '8',
    '9',
    '/',
    '4',
    '5',
    '6',
    '+',
    '1',
    '2',
    '3',
    '-',
    '0',
    '.',
    '00',
    '='
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          color: const Color.fromARGB(56, 213, 99, 229),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Expanded(
                  child: Container(
                padding: const EdgeInsets.all(8.0),
                color: const Color.fromARGB(40, 213, 99, 229),
                height: MediaQuery.of(context).size.height * .3,
                width: MediaQuery.of(context).size.width * .5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    // const SizedBox(
                    //   height: 5,
                    // ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        userInput,
                        style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      alignment: Alignment.centerRight,
                      child: Text(
                        answer,
                        style: const TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                    ),
                  ],
                ),
              )),
              Expanded(
                flex: 2,
                child: Container(
                    height: MediaQuery.of(context).size.height * 7,
                    width: MediaQuery.of(context).size.width * .5,
                    //color: const Color.fromARGB(119, 187, 97, 201),
                    child: GridView.builder(
                      primary: true,
                      itemCount: buttons.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              childAspectRatio: 3 / 2, crossAxisCount: 4),
                      itemBuilder: (BuildContext context, int index) {
                        if (index == 0) {
                          //clear button
                          return MyButton(
                              buttonTapped: () {
                                setState(() {
                                  userInput = '';
                                  answer = '';
                                });
                              },
                              color: const Color.fromARGB(148, 54, 197, 137),
                              textColor: Colors.white,
                              buttonText: buttons[index]);
                        } else if (index == 1) {
                          return MyButton(
                              buttonTapped: () {
                                setState(() {
                                  userInput = userInput.substring(
                                      0, userInput.length - 1);
                                });
                              },
                              color: const Color.fromARGB(148, 225, 48, 73),
                              textColor: Colors.white,
                              buttonText: buttons[index]);
                        } else if (index == buttons.length - 1) {
                          return MyButton(
                              buttonTapped: () {
                                setState(() {
                                  equalPressed();
                                });
                              },
                              color: const Color.fromARGB(119, 187, 97, 201),
                              textColor: const Color.fromARGB(255, 0, 0, 0),
                              buttonText: buttons[index]);
                        } else {
                          return Center(
                            child: MyButton(
                                buttonTapped: () {
                                  setState(() {
                                    userInput += buttons[index];
                                  });
                                },
                                color: isOperator(buttons[index])
                                    ? const Color.fromARGB(119, 187, 97, 201)
                                    : const Color.fromARGB(119, 100, 150, 201),
                                textColor: isOperator(buttons[index])
                                    ? const Color.fromARGB(255, 0, 0, 0)
                                    : const Color.fromARGB(255, 255, 255, 255),
                                buttonText: buttons[index]),
                          );
                        }
                      },
                    )

                    //const MyButton(color: Colors.white, textColor: Colors.black, buttonText:'0'),
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool isOperator(String x) {
    if (x == '%' || x == '/' || x == 'x' || x == '+' || x == '-' || x == '=') {
      return true;
    } else {
      return false;
    }
  }

  void equalPressed() {
    String finalQuestion = userInput;
    finalQuestion = finalQuestion.replaceAll('x', '*');
    Parser p = Parser();
    Expression exp = p.parse(finalQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    answer = eval.toString();
  }
}
