import 'dart:math';

import 'package:flutter/material.dart';

class AchievementController {
  AchievementController()
    : id = TextEditingController(),
      title = TextEditingController(),
      event = TextEditingController(),
      date = TextEditingController();

  TextEditingController id;
  TextEditingController title;
  TextEditingController event;
  TextEditingController date;

  void dispose(){
    id.dispose();
    title.dispose();
    event.dispose();
    date.dispose();
  }
}
