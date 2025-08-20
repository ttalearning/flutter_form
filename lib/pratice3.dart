import 'package:flutter/material.dart';

class Pratice3 extends StatefulWidget {
  const Pratice3({super.key});

  @override
  State<Pratice3> createState() => _Pratice3State();
}

class _Pratice3State extends State<Pratice3> {
  var hienthi = "0";
  var tong = "";
  var soA = "";
  var soB = "";
  var pheptinh = "";

  void lamMoi() {
    setState(() {
      hienthi = "0";
      tong = "";
      soA = "";
      soB = "";
      pheptinh = "";
    });
  }

  void tinhToan() {
    if (soA != "" && soB != "" && pheptinh != "") {
      double a = double.parse(soA);
      double b = double.parse(soB);
      setState(() {
        switch (pheptinh) {
          case '+':
            tong = (a + b).toString();
            hienthi = tong;
            break;
          case '-':
            tong = (a - b).toString();
            hienthi = tong;
            break;
          case '÷':
            if (b == 0) {
              hienthi = "Không thể / 0";
              tong = "tta";
              break;
            }
            tong = (a / b).toString();
            hienthi = tong;
            break;
          case 'X':
            tong = (a * b).toString();
            hienthi = tong;
            break;
          default:
            break;
        }
      });
    }
  }

  Widget buildButton(String text, Color colorbg, Color colortext) {
    return SizedBox(
      height: 75,
      width: 75,
      child: ElevatedButton(
        onPressed: () => setState(() {
          if (text == "AC")
            lamMoi();
          else if (text == "=") {
            soB = hienthi;
            tinhToan();
          } else if (text == "+" || text == "-" || text == "X" || text == "÷") {
            if (hienthi == "Không thể / 0") lamMoi();
            soA = hienthi;
            soB = "";
            tong = "";
            hienthi = "0";
            pheptinh = text;
          } else {
            if (tong != "") lamMoi();
            if (hienthi.length > 10) return;
            if (text == ".") {
              if (!hienthi.contains('.')) {
                hienthi += '.';
              }
            } else {
              hienthi == "0" ? hienthi = text : hienthi += text;
            }
          }
        }),
        child: Text(text, style: TextStyle(fontSize: 18)),
        style: TextButton.styleFrom(
          backgroundColor: colorbg,
          foregroundColor: colortext,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(37),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Row(
                  children: [Icon(Icons.list, color: Colors.orange, size: 30)],
                ),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '${soA} ${pheptinh} ${soB}',
                              style: TextStyle(fontSize: 30),
                            ),
                            Text(
                              hienthi.toString(),
                              style: TextStyle(
                                fontSize: 50,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 9,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildButton("AC", Colors.white, Colors.black),
                        buildButton("÷", Colors.orange, Colors.white),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildButton(
                          "7",
                          const Color.fromARGB(255, 22, 21, 21),
                          Colors.white,
                        ),
                        buildButton(
                          "8",
                          const Color.fromARGB(255, 22, 21, 21),
                          Colors.white,
                        ),
                        buildButton(
                          "9",
                          const Color.fromARGB(255, 22, 21, 21),
                          Colors.white,
                        ),
                        buildButton("X", Colors.orange, Colors.white),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildButton(
                          "4",
                          const Color.fromARGB(255, 22, 21, 21),
                          Colors.white,
                        ),
                        buildButton(
                          "5",
                          const Color.fromARGB(255, 22, 21, 21),
                          Colors.white,
                        ),
                        buildButton(
                          "6",
                          const Color.fromARGB(255, 22, 21, 21),
                          Colors.white,
                        ),
                        buildButton("-", Colors.orange, Colors.white),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildButton(
                          "1",
                          const Color.fromARGB(255, 22, 21, 21),
                          Colors.white,
                        ),
                        buildButton(
                          "2",
                          const Color.fromARGB(255, 22, 21, 21),
                          Colors.white,
                        ),
                        buildButton(
                          "3",
                          const Color.fromARGB(255, 22, 21, 21),
                          Colors.white,
                        ),
                        buildButton("+", Colors.orange, Colors.white),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildButton(
                          "0",
                          const Color.fromARGB(255, 22, 21, 21),
                          Colors.white,
                        ),
                        buildButton(
                          ".",
                          const Color.fromARGB(255, 22, 21, 21),
                          Colors.white,
                        ),
                        buildButton("=", Colors.orange, Colors.white),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
