import 'package:flutter/material.dart';
import 'dart:math';
import 'package:intl/intl.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lottery Number Generator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LotteryNumberGenerator(),
    );
  }
}

class LotteryNumberGenerator extends StatefulWidget {
  @override
  _LotteryNumberGeneratorState createState() => _LotteryNumberGeneratorState();
}

class _LotteryNumberGeneratorState extends State<LotteryNumberGenerator> {
  List<String> history = [];

  List<int> generateNumbers(int count, int max) {
    Random random = Random();
    Set<int> numbers = Set();
    while (numbers.length < count) {
      numbers.add(random.nextInt(max) + 1);
    }
    return numbers.toList()..sort();
  }

  String generateSet(String name, int count, int max) {
    return "$name: ${generateNumbers(count, max).join(', ')}";
  }

  String generateJokerSet() {
    String numbers = generateNumbers(5, 45).join(', ');
    int jokerNumber = Random().nextInt(20) + 1;
    return "Joker - numbers: $numbers + $jokerNumber";
  }

  void generateAll() {
    List<String> newSets = [];
    String dateTime = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

    for (int i = 0; i < 3; i++) {
      newSets.add(generateSet("6 din 49 Set ${i + 1} - numbers", 6, 49));
    }
    newSets.add("----------------------");
    for (int i = 0; i < 4; i++) {
      newSets.add(generateSet("5 din 40 Set ${i + 1} - numbers", 5, 40));
    }
    newSets.add("----------------------");
    for (int i = 0; i < 2; i++) {
      newSets.add(generateJokerSet());
    }

    setState(() {
      history = [dateTime] + newSets + [""] + history;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lottery Number Generator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: generateAll,
              child: Text('Generate'),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: history.length,
                itemBuilder: (context, index) {
                  return index == 0 || history[index] == ""
                      ? Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            history[index],
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        )
                      : history[index] == "----------------------"
                          ? Divider()
                          : ListTile(
                              title: Text(history[index]),
                            );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
