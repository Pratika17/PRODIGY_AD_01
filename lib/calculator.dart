import 'package:flutter/material.dart';
import 'calc_button.dart';

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  dynamic text = '0';
  double numOne = 0;
  double numTwo = 0;

  dynamic result = '';
  dynamic finalResult = '0';
  dynamic opr = '';
  dynamic preOpr = '';

  void calculation(String btnText) {
    if (btnText == 'AC') {
      text = '0';
      numOne = 0;
      numTwo = 0;
      result = '';
      finalResult = '0';
      opr = '';
      preOpr = '';
    } else if (opr == '=' && btnText == '=') {
      if (preOpr == '+') {
        finalResult = add();
      } else if (preOpr == '-') {
        finalResult = sub();
      } else if (preOpr == 'x') {
        finalResult = mul();
      } else if (preOpr == '/') {
        finalResult = div();
      }
    } else if (btnText == '+' || btnText == '-' || btnText == 'x' || btnText == '/' || btnText == '=') {
      if (numOne == 0) {
        numOne = double.parse(result);
      } else {
        numTwo = double.parse(result);
      }

      if (opr == '+') {
        finalResult = add();
      } else if (opr == '-') {
        finalResult = sub();
      } else if (opr == 'x') {
        finalResult = mul();
      } else if (opr == '/') {
        finalResult = div();
      }
      preOpr = opr;
      opr = btnText;
      result = '';
    } else if (btnText == '%') {
      if(result != '') {
        result = (double.parse(result) * 0.01).toString();
        finalResult = doesContainDecimal(result);
      }
    } else if (btnText == '.') {
      if (!result.toString().contains('.')) {
        result = result.toString() + '.';
      }
      finalResult = result;
    } else if (btnText == '+/-') {
      result.toString().startsWith('-')
          ? result = result.toString().substring(1)
          : result = '-' + result.toString();
      finalResult = result;
    } else {
      result = result + btnText;
      finalResult = result;
    }

    setState(() {
      text = finalResult;
    });
  }

  String add() {
    result = (numOne + numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String sub() {
    result = (numOne - numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String mul() {
    result = (numOne * numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String div() {
    result = (numOne / numTwo).toString();
    numOne = double.parse(result);
    return doesContainDecimal(result);
  }

  String doesContainDecimal(dynamic result) {
    if (result.toString().contains('.')) {
      List<String> splitDecimal = result.toString().split('.');
      if (!(int.parse(splitDecimal[1]) > 0))
        return result = splitDecimal[0].toString();
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Calculator'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    text,
                    textAlign: TextAlign.left,
                    style: const TextStyle(color: Colors.white, fontSize: 100),
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalcButton('AC', Colors.grey, Colors.black, calculation),
                CalcButton('+/-', Colors.grey, Colors.black, calculation),
                CalcButton('%', Colors.grey, Colors.black, calculation),
                CalcButton('/', const Color.fromARGB(255, 236, 165, 41), Colors.black, calculation),
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalcButton('7', const Color.fromARGB(255, 54, 54, 54), Colors.white, calculation),
                CalcButton('8', const Color.fromARGB(255, 54, 54, 54), Colors.white, calculation),
                CalcButton('9', const Color.fromARGB(255, 54, 54, 54), Colors.white, calculation),
                CalcButton('x', const Color.fromARGB(255, 236, 165, 41), Colors.black, calculation),
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalcButton('4', const Color.fromARGB(255, 54, 54, 54), Colors.white, calculation),
                CalcButton('5', const Color.fromARGB(255, 54, 54, 54), Colors.white, calculation),
                CalcButton('6', const Color.fromARGB(255, 54, 54, 54), Colors.white, calculation),
                CalcButton('-', const Color.fromARGB(255, 236, 165, 41), Colors.black, calculation),
              ],
            ),
            const SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CalcButton('1', const Color.fromARGB(255, 54, 54, 54), Colors.white, calculation),
                CalcButton('2', const Color.fromARGB(255, 54, 54, 54), Colors.white, calculation),
                CalcButton('3', const Color.fromARGB(255, 54, 54, 54), Colors.white, calculation),
                CalcButton('+', const Color.fromARGB(255, 236, 165, 41), Colors.black, calculation),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.fromLTRB(34, 20, 128, 20),
                    shape: const StadiumBorder(),
                    backgroundColor: const Color.fromARGB(255, 54, 54, 54),
                  ),
                  onPressed: () {
                    calculation('0');
                  },
                  child: const Text(
                    "0",
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                    ),
                  ),
                ),
                CalcButton('.', const Color.fromARGB(255, 101, 101, 101), Colors.white, calculation),
                CalcButton('=', const Color.fromARGB(255, 101, 101, 101), Colors.white, calculation),
              ],
            )
          ],
        ),
      ),
    );
  }
}