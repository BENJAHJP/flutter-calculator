import 'package:flutter/material.dart';

void main() => runApp(const CalculatorApp());

class CalculatorApp extends StatelessWidget {
  const CalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  Widget calculatorButton(String btnText, Color btnColor, Color txtColor) {
    return Container(
        child: MaterialButton(
      onPressed: () {
        calculation(btnText);
      },
      shape: const CircleBorder(),
      color: btnColor,
      padding: const EdgeInsets.all(20),
      child: Text(
        btnText,
        style: TextStyle(fontSize: 35, color: txtColor),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text("Calculator"),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const Padding(padding: EdgeInsets.all(10)),
                Text(
                  text,
                  textAlign: TextAlign.left,
                  style: const TextStyle(color: Colors.white, fontSize: 100),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calculatorButton("AC", Colors.grey, Colors.black),
                calculatorButton("+/-", Colors.grey, Colors.black),
                calculatorButton("%", Colors.grey, Colors.black),
                calculatorButton("/", Colors.amber[700]!, Colors.white)
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calculatorButton("7", Colors.grey[850]!, Colors.white),
                calculatorButton("8", Colors.grey[850]!, Colors.white),
                calculatorButton("9", Colors.grey[850]!, Colors.white),
                calculatorButton("x", Colors.amber[700]!, Colors.white)
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calculatorButton("4", Colors.grey[850]!, Colors.white),
                calculatorButton("5", Colors.grey[850]!, Colors.white),
                calculatorButton("6", Colors.grey[850]!, Colors.white),
                calculatorButton("-", Colors.amber[700]!, Colors.white)
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calculatorButton("1", Colors.grey[850]!, Colors.white),
                calculatorButton("2", Colors.grey[850]!, Colors.white),
                calculatorButton("3", Colors.grey[850]!, Colors.white),
                calculatorButton("+", Colors.amber[700]!, Colors.white)
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MaterialButton(
                  padding: const EdgeInsets.fromLTRB(34, 20, 128, 20),
                  onPressed: () {},
                  shape: const StadiumBorder(),
                  color: Colors.grey[850],
                  child: const Text(
                    "0",
                    style: TextStyle(fontSize: 35, color: Colors.white),
                  ),
                ),
                calculatorButton(".", Colors.grey[850]!, Colors.white),
                calculatorButton("=", Colors.amber[700]!, Colors.white),
              ],
            )
          ],
        ),
      ),
    );
  }

  dynamic text = "0";
  double numOne = 0;
  double numtwo = 0;

  dynamic result = "";
  dynamic finalResult = "";
  dynamic opr = "";
  dynamic preOpr = "";

  void calculation(btnText) {
    if (btnText == "AC") {
      text = "0";
      numOne = 0;
      numtwo = 0;
      result = "";
      finalResult = "0";
      opr = "";
      preOpr = "";
    } else if (opr == "=" && btnText == "=") {
      String doesContainDecimal(dynamic result) {
        if (result.toString().contains(".")) {
          List<String> splitDecimal = result.toString().split(".");
          if (!(int.parse(splitDecimal[1]) > 0)) {
            return result - splitDecimal[0].toString();
          }
        }
        return result;
      }

      String add() {
        result = (numOne + numtwo).toString();
        numOne = double.parse(result);
        return doesContainDecimal(result);
      }

      String sub() {
        result = (numOne - numtwo).toString();
        numOne = double.parse(result);
        return doesContainDecimal(result);
      }

      String mul() {
        result = (numOne * numtwo).toString();
        numOne = double.parse(result);
        return doesContainDecimal(result);
      }

      String div() {
        result = (numOne / numtwo).toString();
        numOne = double.parse(result);
        return doesContainDecimal(result);
      }

      if (preOpr == "+") {
        finalResult = add();
      } else if (preOpr == "-") {
        finalResult = sub();
      } else if (preOpr == "x") {
        finalResult = mul();
      } else if (preOpr == "/") {
        finalResult = div();
      } else {
        result = result + btnText;
        finalResult = result;
      }

      setState(() {
        text = finalResult;
      });
    }
  }
}
