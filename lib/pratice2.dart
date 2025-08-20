import 'package:flutter/material.dart';

class Pratice2 extends StatefulWidget {
  const Pratice2({super.key});

  @override
  State<Pratice2> createState() => _Pratice2State();
}

class _Pratice2State extends State<Pratice2> {
  var currentColor = null;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            (currentColor == null)
                ? Text(
                    'Vui lòng chọn màu bên dưới để hiện thị',
                    style: TextStyle(fontSize: 30),
                    textAlign: TextAlign.center,
                  )
                : Container(height: 150, width: 150, color: currentColor),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 100,
                  height: 100,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        currentColor = Colors.green;
                      });
                    },
                    child: Text(''),
                    style: TextButton.styleFrom(backgroundColor: Colors.green),
                  ),
                ),
                SizedBox(
                  width: 100,
                  height: 100,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        currentColor = Colors.red;
                      });
                    },
                    child: Text(''),
                    style: TextButton.styleFrom(backgroundColor: Colors.red),
                  ),
                ),
                SizedBox(
                  width: 100,
                  height: 100,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        currentColor = Colors.yellow;
                      });
                    },
                    child: Text(''),
                    style: TextButton.styleFrom(backgroundColor: Colors.yellow),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
