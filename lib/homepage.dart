import 'package:flutter/material.dart';
import 'package:listviewbuilder/Mysquare.dart';

class CalCScreen extends StatefulWidget {
  const CalCScreen({super.key});

  @override
  State<CalCScreen> createState() => _CalCScreenState();
}

class _CalCScreenState extends State<CalCScreen> {
  List screen = [];
  List secondOperations = [];
  List<String> usedOperators = [];

  String expr = '0';
  String expr2 = '0';
  String expr3 = '';
  List l_expr = [];
  List l_expr2 = [];
  List l_expr3 = [];
  double double_expr1 = 0;
  double double_expr2 = 0;
  double result = 0;
  String m_result = '';

  void getOperators(index) {
    setState(() {
      switch (index) {
        case 0:
          getResult();
          usedOperators.isEmpty
              ? {usedOperators.insert(0, '+')}
              : {
                  usedOperators = ['+'],
                  screen = [m_result],
                  secondOperations = [],
                  expr = m_result,
                  expr2 = '',
                };
          break;

        case 1:
          getResult();
          usedOperators.isEmpty
              ? {usedOperators.insert(0, '-')}
              : {
                  usedOperators = ['-'],
                  screen = [m_result],
                  secondOperations = [],
                  expr = m_result,
                  expr2 = '',
                };
          break;
        case 2:
          getResult();
          usedOperators.isEmpty
              ? usedOperators.insert(0, 'x')
              : {
                  usedOperators = ['x'],
                  screen = [m_result],
                  secondOperations = [],
                  expr = m_result,
                  expr2 = '',
                };

          break;
        case 3:
          getResult();
          usedOperators.isEmpty
              ? usedOperators.insert(0, '/')
              : {
                  screen = [m_result],
                  secondOperations = [],
                  expr = m_result,
                  expr2 = '',
                  usedOperators = ['/']
                };
          break;
        case 4:
          secondOperations.isEmpty
              ? {
                  usedOperators.isEmpty
                      ? {screen.isEmpty ? null : screen.removeLast()}
                      : usedOperators.removeLast()
                }
              : secondOperations.removeLast();
          break;
      }
      expr3 = usedOperators.join('');
      expr = screen.join('');
      expr2 = secondOperations.join('');
    });
  }

  void getNumber(int index) {
    setState(() {
      switch (index) {
        case 0:
          usedOperators.isEmpty ? screen.add(1) : secondOperations.add(1);

          break;
        case 1:
          usedOperators.isEmpty ? screen.add(2) : secondOperations.add(2);
          break;
        case 2:
          usedOperators.isEmpty ? screen.add(3) : secondOperations.add(3);
          break;
        case 3:
          usedOperators.isEmpty ? screen.add(4) : secondOperations.add(4);

          break;
        case 4:
          usedOperators.isEmpty ? screen.add(5) : secondOperations.add(5);
          break;
        case 5:
          usedOperators.isEmpty ? screen.add(6) : secondOperations.add(6);
          break;
        case 6:
          usedOperators.isEmpty ? screen.add(7) : secondOperations.add(7);
          break;
        case 7:
          usedOperators.isEmpty ? screen.add(8) : secondOperations.add(8);
          break;
        case 8:
          usedOperators.isEmpty ? screen.add(9) : secondOperations.add(9);
          break;
        case 9:
          usedOperators.isEmpty ? screen.add('.') : secondOperations.add('.');
        case 10:
          usedOperators.isEmpty ? screen.add(0) : secondOperations.add(0);
          break;
        case 11:
          usedOperators.clear();
          screen = [];
          secondOperations = [];
          expr = '0';
          expr2 = '0';
          expr3 = '';
          m_result = '';

          break;
      }
      expr3 = usedOperators.join('');
      expr = screen.join('');
      expr2 = secondOperations.join('');
    });
  }

  void getResult() {
    setState(() {
      if (expr2.isNotEmpty && expr.isNotEmpty) {
        double_expr1 = double.parse(expr);
        double_expr2 = double.parse(expr2);
        switch (usedOperators[0]) {
          case '+':
            result = double_expr1 + double_expr2;
            m_result = result.toStringAsFixed(2);
            break;
          case '-':
            result = double_expr1 - double_expr2;
            m_result = result.toStringAsFixed(2);
            break;
          case 'x':
            result = double_expr1 * double_expr2;
            m_result = result.toStringAsFixed(2);
            break;
          case '/':
            result = double_expr1 / double_expr2;
            m_result = result.toStringAsFixed(2);
            break;
        }
      } else if (expr2.isEmpty && expr.isNotEmpty) {
        double_expr1 = double.parse(expr);
        result = double_expr1;
      } else if (expr2.isNotEmpty && expr.isEmpty) {
        double_expr2 = double.parse(expr2);
        result = double_expr2;
      } else if (expr2.isEmpty && expr.isEmpty) {
        double_expr1 = 0;
        double_expr2 = 0;
        result = 0;
      }
    });
  }

  Map Calc_Buttons = {
    '1': 1,
    '2': 2,
    '3': 3,
    '4': 4,
    '5': 5,
    '6': 6,
    '7': 7,
    '8': 8,
    '9': 9,
    '.': "^",
    '0': 0,
    'CE': 00,
  };
  List Operations = ["+", "-", "x", "/", "CLR"];
  @override
  Widget build(BuildContext context) {
    double mdqh = MediaQuery.of(context).size.height;
    double mdqw = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            /////////////////////////////////////////calculator screen\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
            Container(
              height: mdqh * 0.15,
              width: mdqw * 0.9,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: const Color.fromARGB(255, 9, 7, 45)),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: mdqh * 0.01),
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(126, 93, 159, 225)),
                    height: mdqh * 0.06,
                    child: Center(
                      child: Text(
                        '$expr$expr3$expr2',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                    width: 1,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(0, 255, 255, 255)),
                    height: mdqh * 0.06,
                    child: Center(
                      child: Text(
                        m_result,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Container(
                height: mdqh * 0.7,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 161, 207, 244),
                    borderRadius: BorderRadius.circular(12)),
                child: Row(
                  children: [
                    Column(
                      children: [
                        //////////////////////////////////////normal number buttons\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
                        SizedBox(
                          height: mdqh * 0.46,
                          width: mdqw * 0.7,
                          child: GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: Calc_Buttons.length,
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 3),
                              itemBuilder: (context, index) {
                                final buttonkey =
                                    Calc_Buttons.keys.toList()[index];
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CalcButtons(
                                    buttontext: buttonkey,
                                    getNumber: () {
                                      return getNumber(index);
                                    },
                                  ),
                                );
                              }),
                        ),

                        /////////////////////////////////////Equals-to button\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
                        Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GestureDetector(
                              onTap: getResult,
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color:
                                        const Color.fromARGB(255, 34, 5, 106)),
                                height: mdqh * 0.1,
                                width: mdqw * 0.6,
                                child: const Center(
                                  child: Text(
                                    '=',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 40),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    ////////////////////////////////////////operators\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\
                    SizedBox(
                      height: mdqh * 1,
                      width: mdqw * 0.235,
                      child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: Operations.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1),
                          itemBuilder: (contex, index) {
                            return Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 10, bottom: 10),
                              child: CalcButtons(
                                buttontext: Operations[index],
                                getNumber: () => getOperators(index),
                              ),
                            );
                          }),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
