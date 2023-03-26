import 'package:flutter/material.dart';
import 'package:dashboard/screens/components/courses/clusterpoints.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:dashboard/screens/onboard.dart';

void main() async {
  //Initializing Database when starting the application.
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}


class RecommendedPage extends StatelessWidget {

  final String selectedInterest;

  RecommendedPage({required this.selectedInterest});

  @override
  Widget build(BuildContext context) {
    String courseTitle;
    String courseDescription;

    switch (selectedInterest) {
      case "Medicine":
        courseTitle = "Bachelors in Medicine";
        courseDescription = "Learn the science of healing and medicine.";
        break;
      case "Engineering":
        courseTitle = "Electrical Engineering";
        courseDescription = "Learn to design and develop electrical systems and equipment.";
        break;
      case "Teaching":
        courseTitle = "Education Technology";
        courseDescription = "Explore the use of technology in education.";
        break;
      case "Nursing":
        courseTitle = "Community Health";
        courseDescription = "Study community health and its impact on society.";
        break;
      default:
        courseTitle = "No course found for selected option";
        courseDescription = "";
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Recommended Course'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Course Title:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              courseTitle,
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
            const SizedBox(height: 20.0),
            const Text(
              'Course Description:',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              courseDescription,
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}