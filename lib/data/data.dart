import 'package:dashboard/constant.dart';
import 'package:flutter/material.dart';
import 'package:ternav_icons/ternav_icons.dart';

import '../model/course_model.dart';
import '../model/planing_model.dart';
import '../model/statistics_model.dart';

final List<Course> course = [
  Course(
      text: "Mechanical Engineering",
      lessons: "60 Units",
      imageUrl: "images/pic/engineers.png",
      percent: 75,
      backImage: "images/box/box1.png",
      color: kDarkBlue),
  Course(
      text: "Computer Science",
      lessons: "58 Units",
      imageUrl: "images/pic/data-science.png",
      percent: 50,
      backImage: "images/box/box2.png",
      color: kOrange),
  Course(
      text: "Bachelor of Medicine",
      lessons: "72 Units",
      imageUrl: "images/pic/vaccine.png",
      percent: 25,
      backImage: "images/box/box3.png",
      color: kGreen),
  Course(
      text: "Acturial Science",
      lessons: "54 Units",
      imageUrl: "images/pic/img4.png",
      percent: 75,
      backImage: "images/box/box4.png",
      color: kYellow),
];

final List<Planing> planing = [
  Planing(
    heading: "Engineering",
    subHeading: "5 years",
    color: kLightBlue,
    icon: const Icon(
      Icons.settings_outlined,
      color: kDarkBlue,
    ),
  ),
  Planing(
    heading: "Medicine",
    subHeading: "7 years",
    color: const Color(0xffE2EDD2),
    icon: const Icon(
      Icons.medical_services_outlined,
      color: kGreen,
    ),
  ),
  Planing(
    heading: "Mathematics",
    subHeading: "4 years",
    color: const Color(0xffF9F0D3),
    icon: const Icon(Icons.calculate, color: kYellow),
  ),
  Planing(
    heading: "Business",
    subHeading: "4 years",
    color: const Color(0xffF9E5D2),
    icon: const Icon(
      Icons.business_center_outlined,
      color: kOrange,
    ),
  ),
  Planing(
    heading: "Law",
    subHeading: "7 years",
    color: const Color(0xffE2EDD2),
    icon: const Icon(
      Icons.local_police,
      color: kGreen,
    ),
  ),
  Planing(
    heading: "Agriculture",
    subHeading: "3 years",
    color: const Color(0xffF9E5D2),
    icon: const Icon(
      Icons.agriculture,
      color: kOrange,
    ),
  ),
  Planing(
    heading: "Education",
    subHeading: "3 years",
    color: const Color(0xffF9F0D3),
    icon: const Icon(Icons.cast_for_education, color: kYellow),
  ),
  Planing(
    heading: "Art and Social Sciences",
    subHeading: "3 years",
    color: kLightBlue,
    icon: const Icon(
      Icons.format_paint,
      color: kDarkBlue,
    ),
  ),
];

final List<Statistics> statistics = [
  Statistics(
    title: "Course Completed",
    number: "02",
  ),
  Statistics(
    title: "Total Points Gained",
    number: "250",
  ),
  Statistics(
    title: "Course In Progress ",
    number: "03",
  ),
  Statistics(
    title: "Tasks \nFinished",
    number: "05",
  )
];
