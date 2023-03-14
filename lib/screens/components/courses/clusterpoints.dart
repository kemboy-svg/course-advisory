import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  //Initializing Database when starting the application.
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class Cluster {
  final List<String> _grades;

  Cluster(this._grades);

  int calculate() {
    int totalPoints = 0;
    int count = 0;

    for (String grade in _grades) {
      if (grade.isNotEmpty) {
        totalPoints += _getPointsFromGrade(grade);
        count++;
      }
    }

    double average = totalPoints / count;
    return average.round();
  }

  int _getPointsFromGrade(String grade) {
    int points = 0;

    switch (grade) {
      case "A":
        points = 12;
        break;
      case "A-":
        points = 11;
        break;
      case "B+":
        points = 10;
        break;
      case "B":
        points = 9;
        break;
      case "B-":
        points = 8;
        break;
      case "C+":
        points = 7;
        break;
      case "C":
        points = 6;
        break;
      case "C-":
        points = 5;
        break;
      case "D+":
        points = 4;
        break;
      case "D":
        points = 3;
        break;
      case "E":
        points = 2;
        break;
      case "F":
        points = 1;
        break;
    }

    return points;
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final TextEditingController _grade1Controller = TextEditingController();
  final TextEditingController _grade2Controller = TextEditingController();
  final TextEditingController _grade3Controller = TextEditingController();
  final TextEditingController _grade4Controller = TextEditingController();
  final TextEditingController _grade5Controller = TextEditingController();
  final TextEditingController _grade6Controller = TextEditingController();
  final TextEditingController _grade7Controller = TextEditingController();
  final TextEditingController _grade8Controller = TextEditingController();

  int _clusterPoints = 0;

  void _calculateClusterPoints() {
    List<String> grades = [
      _grade1Controller.text,
      _grade2Controller.text,
      _grade3Controller.text,
      _grade4Controller.text,
      _grade5Controller.text,
      _grade6Controller.text,
      _grade7Controller.text,
      _grade8Controller.text,
    ];

    Cluster cluster = Cluster(grades);
    _clusterPoints = cluster.calculate();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cluster Points Calculator',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cluster Points Calculator'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
            TextField(
              controller: _grade1Controller,
              decoration: InputDecoration(labelText: 'Subject 1 Grade'),
            ),
            TextField(
              controller: _grade2Controller,
              decoration: InputDecoration(labelText: 'Subject 2 Grade'),
            ),
            TextField(
              controller: _grade3Controller,
              decoration: InputDecoration(labelText: 'Subject 3 Grade'),
            ),
            TextField(
              controller: _grade4Controller,
              decoration: InputDecoration(labelText: 'Subject 4 Grade'),
            ),
            TextField(
              controller: _grade5Controller,
              decoration: InputDecoration(labelText: 'Subject 5 Grade'),
            ),
            TextField(
              controller: _grade6Controller,
              decoration: InputDecoration(labelText: 'Subject 6 Grade'),
            ),
            TextField(
              controller: _grade6Controller,
              decoration: InputDecoration(labelText: 'Subject 7 Grade'),
            ),
            TextField(
              controller: _grade6Controller,
              decoration: InputDecoration(labelText: 'Subject 8 Grade'),
            ),
          ]
          ),
        ),
      ),
    );
  }
}
