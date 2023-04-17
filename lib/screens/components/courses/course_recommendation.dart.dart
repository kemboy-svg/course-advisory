import 'package:flutter/material.dart';
import 'package:dashboard/screens/onboard.dart';

class CourseRecommendation extends StatelessWidget {
  

   final String interest;
  final int points;
  final ValueNotifier<bool> isLoading;
  

  const CourseRecommendation({super.key, 
    required this.interest,
    required this.points,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Welcome to your dashboard')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Based on your interest in $interest, here are some recommendations for you:',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            _getRecommendations(interest),
          ],
        ),
      ),
    );
  }

  Widget _getRecommendations(String interest) {
    switch (interest) {
      case 'Medicine':
        return Column(
          children: <Widget>[
            Text(
              '1. Consider taking courses in anatomy, physiology, and pharmacology.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              '2. Participate in volunteer work at a hospital or clinic to gain hands-on experience.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              '3. Read medical journals and stay updated with the latest medical advancements.',
              textAlign: TextAlign.center,
            ),
          ],
        );
        break;
      case 'Engineering':
        return Column(
          children: <Widget>[
            Text(
              '1. Consider taking courses in computer science, mathematics, and physics.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              '2. Participate in internships or projects to gain practical experience in your field of interest.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              '3. Read technical journals and attend conferences to stay updated with the latest technological advancements.',
              textAlign: TextAlign.center,
            ),
          ],
        );
        break;
      case 'Teaching':
        return Column(
          children: <Widget>[
            Text(
              '1. Consider taking courses in education, child development, and classroom management.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              '2. Participate in volunteer work at a school or tutoring center to gain hands-on experience.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Text(
              '3. Read education journals and attend workshops to stay updated with the latest teaching methods.',
              textAlign: TextAlign.center,
            ),
          ],
        );
        break;
      case 'Nursing':
        return Column(
          children

: <Widget>[
const Text(
'1. Consider taking courses in anatomy, physiology, and pharmacology.',
textAlign: TextAlign.center,
),
const SizedBox(height: 10),
Text(
'2. Participate in volunteer work at a hospital or clinic to gain hands-on experience.',
textAlign: TextAlign.center,
),
const SizedBox(height: 10),
Text(
'3. Read nursing journals and attend workshops to stay updated with the latest nursing practices.',
textAlign: TextAlign.center,
),
],
);
break;
default:
return Column(
children: <Widget>[
Text(
'Sorry, we do not have any recommendations for this interest at the moment.',
textAlign: TextAlign.center,
),
],
);
break;
}
}
}