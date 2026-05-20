import 'package:flutter/material.dart';

class EducationController {

  final college =
      TextEditingController();

  final degree =
      TextEditingController();

  final specialization =
      TextEditingController();

  final semester =
      TextEditingController();

  final cgpa =
      TextEditingController();

  final yearOfGraduation =
      TextEditingController();

  final startDate =
      TextEditingController();

  final endDate =
      TextEditingController();

  bool isCurrent = false;

  String educationType =
      "bachelors";

  /// 🔥 Needed for stream fetch
  String? selectedDegreeId;

  /// 🔥 Streams based on degree
  List<Map<String, dynamic>>
      streams = [];
}