import 'package:flutter/material.dart';

class PublicationController {
  PublicationController()
    : id = TextEditingController(),
      title = TextEditingController(),
      url = TextEditingController();

  TextEditingController id;
  TextEditingController title;
  TextEditingController url;

  void dispose() {
    id.dispose();
    title.dispose();
    url.dispose();
  }
}
