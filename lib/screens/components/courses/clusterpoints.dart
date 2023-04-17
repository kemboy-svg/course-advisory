// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:dashboard/screens/components/courses/course_recommendation.dart';
import 'package:dashboard/screens/onboard.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Replace the following line with the actual interest value
  String interest = "your interest";

  runApp(MyApp(interest: interest));
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

    double average = totalPoints / count * 4;
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
  final String interest;

  MyApp({required this.interest});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isLoading = false;

  void _navigateToCourseRecommendation(BuildContext context) async {
  setState(() {
    isLoading = true;
  });

  await Future.delayed(Duration(seconds: 2));

  setState(() {
    isLoading = false;
  });

  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => CourseRecommendation(
        interest: widget.interest, // Pass the user's selected interest
        points: _clusterPoints,
        isLoading: ValueNotifier<bool>(false), // Pass the ValueNotifier to the next screen
      ),
    ),
  );
}


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

  String _getClusterPointsMessage() {
    if (_clusterPoints == null) {
      return 'Enter your grades to calculate your cluster points.';
    } else {
      return 'Your cluster points are $_clusterPoints.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Enter your grades',
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('Enter your grades'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: _grade1Controller,
                decoration: const InputDecoration(labelText: 'English Grade'),
              ),
              TextField(
                controller: _grade2Controller,
                decoration:
                    const InputDecoration(labelText: 'Mathematics Grade'),
              ),
              TextField(
                controller: _grade3Controller,
                decoration: const InputDecoration(labelText: 'Kiswahili Grade'),
              ),
              TextField(
                controller: _grade4Controller,
                decoration: const InputDecoration(labelText: 'Biology Grade'),
              ),
              TextField(
                controller: _grade5Controller,
                decoration: const InputDecoration(labelText: 'Chemistry Grade'),
              ),
              TextField(
                controller: _grade6Controller,
                decoration: const InputDecoration(labelText: 'Physics Grade'),
              ),
              TextField(
                controller: _grade7Controller,
                decoration: const InputDecoration(labelText: 'History Grade'),
              ),
              TextField(
                controller: _grade8Controller,
                decoration:
                    const InputDecoration(labelText: 'Agriculture Grade'),
              ),
              const SizedBox(height: 16.0),
              Row(
                children: <Widget>[
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        _calculateClusterPoints();
                      },
                      child: const Text(
                        'Check your cluster',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        _navigateToCourseRecommendation(context);
                      },
                      child: Text(
                        'Checkout your courses',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.secondary),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16.0),
              Text(
                _getClusterPointsMessage(),
                style: const TextStyle(fontSize: 20.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
