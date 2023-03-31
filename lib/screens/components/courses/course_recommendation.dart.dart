import 'package:dashboard/screens/components/courses/clusterpoints.dart';
import 'package:flutter/material.dart';
import 'package:dashboard/screens/onboard.dart';


class CourseRecommendation extends StatefulWidget {
  final String interest;
  final int points;
  final ValueNotifier<bool> isLoading;

  CourseRecommendation({required this.interest, required this.points ,required this.isLoading,});

  @override
  _CourseRecommendationState createState() =>
      _CourseRecommendationState(interest: interest, points: points);
}

class _CourseRecommendationState extends State<CourseRecommendation> {
  final String interest;
  final int points;

  _CourseRecommendationState({required this.interest, required this.points});

  List<String> getRecommendedCourses(String interest, int points) {
    // Dummy data for demonstration purposes
    Map<String, List<String>> coursesByInterest = {
      'Medicine': ['Course 1', 'Course 2', 'Course 3'],

      
      'Engineering': ['Course 4', 'Course 5', 'Course 6'],
      'Teaching': ['Course 7', 'Course 8', 'Course 9'],
      'Nursing': ['Course 10', 'Course 11', 'Course 12'],
    };
    Map<String, String> courseDescriptions = {
  'Course 1': 'Course 1 is focused on ...',
  'Course 2': 'Course 2 is designed to teach ...',
  'Course 3': 'Course 3 offers an in-depth understanding of ...',
};


    // Logic to filter courses based on the user's interest and points
    List<String> recommendedCourses = [];

    if (coursesByInterest.containsKey(interest)) {
      recommendedCourses = coursesByInterest[interest]!;
    }

    // Additional filtering based on points can be added here

    return recommendedCourses;
  }

   @override
  Widget build(BuildContext context) {
    List<String> recommendedCourses = getRecommendedCourses(interest, points);
    return Scaffold(
      appBar: AppBar(title: const Text('Recommended Courses')),
      body: Stack(
        children: [
          ListView.builder(
        itemCount: recommendedCourses.length,
        
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(recommendedCourses[index]),
          );
        },
      ),
          // ... Your existing widgets ...
          ValueListenableBuilder<bool>(
            valueListenable: widget.isLoading,
            builder: (BuildContext context, bool isLoading, Widget? child) {
              if (isLoading) {
                return Container(
                  width: double.infinity,
                  height: double.infinity,
                  color: Colors.black.withOpacity(0.5),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              } else {
                return SizedBox.shrink();
              }
            },
          ),
        ],
      ),
    );
  }
}


