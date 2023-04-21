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
                'Based on your interest in $interest and cluster of:$points here are some recommendations for you:',
                textAlign: TextAlign.center,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Text(
                description,
                textAlign: TextAlign.justify,
                style: const TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      );
    }

    switch (interest) {
      case 'Medicine':
        return Column(
          children: [
            recommendationCard(
              'Medical Physiology',
              'These courses provide a detailed understanding of the functions of the human body at the cellular, tissue, and system levels.',
            ),
            const SizedBox(height: 10),
            recommendationCard(
              'Medical Biochemistry',
              'These courses cover the chemical processes and substances that occur within the human body, exploring the molecular mechanisms underlying health and disease.',
            ),
          ],
        );
      case 'Engineering':
        return Column(
          children: [
            recommendationCard(
              'Electrical Engineering',
              'These courses cover topics such as circuit analysis, digital systems, and power electronics, providing a solid foundation in the principles and applications of electrical engineering.',
            ),
            const SizedBox(height: 10),
            recommendationCard(
              'Computer Engineering',
              'These courses focus on the design, development, and testing of computer hardware and software systems, combining elements of both computer science and electrical engineering.',
            ),
          ],
        );
      case 'Teaching':
        return Column(
          children: [
            recommendationCard(
              'Education Technology',
              'These courses focus on the integration of technology in the classroom, teaching you how to enhance learning experiences and adapt to the evolving educational landscape.',
            ),
            const SizedBox(height: 10),
            recommendationCard(
              'Curriculum Development',
              'These courses teach you how to design, implement, and evaluate educational programs, helping you create effective learning experiences for diverse student populations.',
            ),
          ],
        );
      case 'Nursing':
        return Column(
          children: [
            recommendationCard(
              'Community Nursing',
              'These courses emphasize the role of nurses in promoting health and well-being in diverse communities, focusing on areas such as health promotion, disease prevention, and health education.',
            ),
            const SizedBox(height: 10),
            recommendationCard(
              'Pediatric Nursing',
              'These courses focus on the care of infants, children, and adolescents, addressing the unique health needs and developmental considerations of younger patients.',
            ),
          ],
        );
      default:
        return const Text(
          'Sorry, we do not have any recommendations for this interest at the moment.',
          textAlign: TextAlign.center,
        );
    }
  }
}
