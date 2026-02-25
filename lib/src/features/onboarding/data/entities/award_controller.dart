import 'package:flutter/material.dart';

class AwardController {
  AwardController()
    : id = TextEditingController(),
      title = TextEditingController(),
      organization = TextEditingController(),
      startDate = TextEditingController(),
      endDate = TextEditingController(),
      description = TextEditingController();

  TextEditingController id;
  TextEditingController title;
  TextEditingController organization;
  TextEditingController startDate;
  TextEditingController endDate;
  TextEditingController description;

  void dispose() {
    id.dispose();
    title.dispose();
    organization.dispose();
    startDate.dispose();
    endDate.dispose();
    description.dispose();
  }
}
