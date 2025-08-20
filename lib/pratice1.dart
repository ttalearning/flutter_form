import 'package:flutter/material.dart';

class Pratice1 extends StatefulWidget {
  const Pratice1({super.key});

  @override
  State<Pratice1> createState() => _Pratice1State();
}

class _Pratice1State extends State<Pratice1> {
  var cnt = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlueAccent,
          title: Text(
            'Flutter Demo Home Page',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Column(
          children: [
            Text('$cnt', style: TextStyle(fontSize: 100)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 150,
                  width: 150,
                  color: Colors.green,
                  child: ListTile(
                    title: Text(
                      '+',
                      style: TextStyle(fontSize: 70, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    onTap: () => {
                      setState(() {
                        cnt++;
                      }),
                    },
                  ),
                ),
                Container(
                  height: 150,
                  width: 150,
                  color: Colors.red,
                  child: ListTile(
                    title: Text(
                      '-',
                      style: TextStyle(fontSize: 70, color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                    onTap: () => {
                      setState(() {
                        if (cnt > 0) cnt--;
                      }),
                    },
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.blue,
                      ),
                      child: IconButton(
                        icon: Icon(Icons.refresh),
                        onPressed: () => setState(() {
                          cnt = 0;
                        }),
                        color: Colors.white,
                        iconSize: 40,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
