import 'package:flutter/material.dart';
import 'package:dashboard/screens/onboard.dart';
import 'package:dashboard/screens/components/courses/clusterpoints.dart';

class CourseRecommendation extends StatelessWidget {
  final String interest;
  final int points;
  final ValueNotifier<bool> isLoading;

  const CourseRecommendation({
    Key? key,
    required this.interest,
    required this.points,
    required this.isLoading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Welcome to your dashboard')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text(
                'Based on your interest in $interest, here are some recommendations for you:',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              _getRecommendations(interest),
            ],
          ),
        ),
      ),
    );
  }

  Widget _getRecommendations(String interest) {
    Widget recommendationCard(String title, String description) {
      return Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                description,
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      );
    }

    switch (interest) {
      case 'Medicine':
        return recommendationCard(
          'Medical Physiology',
          'These courses provide a detailed understanding of the functions of the human body at the cellular, tissue, and system levels.',
        );
      case 'Engineering':
        return recommendationCard(
          'Electrical Engineering',
          'These courses cover topics such as circuit analysis, digital systems, and power electronics, providing a solid foundation in the principles and applications of electrical engineering.',
        );
      case 'Teaching':
        return recommendationCard(
          'Education Technology',
          'These courses focus on the integration of technology in the classroom, teaching you how to enhance learning experiences and adapt to the evolving educational landscape.',
        );
      case 'Nursing':
        return recommendationCard(
          'Community Nursing',
          'These courses emphasize the role of nurses in promoting health and well-being in diverse communities, focusing on areas such as health promotion, disease prevention, and health education.',
        );
      default:
        return Text(
          'Sorry, we do not have any recommendations for this interest at the moment.',
          textAlign: TextAlign.center,
        );
    }
  }
}
