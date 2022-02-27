import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Select the Number',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  List<int> shuffleNumber = [];

  int result = 0;
  String msg = "";

  @override
  Widget build(BuildContext context) {
    numbers.shuffle();
    shuffleNumber = numbers.take(3).toList();
    shuffleNumber.shuffle();

    final _random = new Random();
    var toChoose = shuffleNumber[_random.nextInt(shuffleNumber.length)];

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Select the Number"),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text("Please select ${toChoose}"),
            InkWell(
              highlightColor: Colors.orange.withOpacity(0.5),
              splashColor: Colors.red.withOpacity(0.5),
              onTap: () {
                setState(() {
                  if (toChoose != shuffleNumber[0]) {
                    result = 0;
                    msg = "Incorrect";
                  } else {
                    result += 10;
                    msg = "Correct";
                  }
                });
              },
              child: Ink(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        width: 2, color: Colors.blue.withOpacity(0.5)),
                    image: DecorationImage(
                        image: AssetImage("images/${shuffleNumber[0]}.png"))),
              ),
            ),
            InkWell(
              highlightColor: Colors.orange.withOpacity(0.5),
              splashColor: Colors.red.withOpacity(0.5),
              onTap: () {
                setState(() {
                  if (toChoose != shuffleNumber[1]) {
                    result = 0;
                    msg = "Incorrect";
                  } else {
                    result += 10;
                    msg = "Correct";
                  }
                });
              },
              child: Ink(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        width: 2, color: Colors.blue.withOpacity(0.5)),
                    image: DecorationImage(
                        image: AssetImage("images/${shuffleNumber[1]}.png"))),
              ),
            ),
            InkWell(
              highlightColor: Colors.orange.withOpacity(0.5),
              splashColor: Colors.red.withOpacity(0.5),
              onTap: () {
                setState(() {
                  if (toChoose != shuffleNumber[2]) {
                    result = 0;
                    msg = "Incorrect";
                  } else {
                    result += 10;
                    msg = "Correct";
                  }
                });
              },
              child: Ink(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        width: 2, color: Colors.blue.withOpacity(0.5)),
                    image: DecorationImage(
                        image: AssetImage("images/${shuffleNumber[2]}.png"))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Your answer is : ${msg}"),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {},
                child: const Text('Next'),
                style: TextButton.styleFrom(
                  primary: Colors.black,
                  backgroundColor: Colors.blue,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Score : ${result}"),
            ),
          ],
        ),
      ),
    );
  }
}