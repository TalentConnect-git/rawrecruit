import 'package:flutter/material.dart';

enum ApplicationStatus {
  pending('Pending', 'Pending', Icons.question_mark, Colors.black, Colors.grey),
  accepted('Accept', 'Accepted', Icons.check, Colors.white, Colors.green),
  rejected('Reject', 'Rejected', Icons.close, Colors.white, Colors.red),
  referred(
    'Refer To Company',
    'Referred To Company',
    Icons.link,
    Colors.white,
    Colors.deepOrange,
  );

  const ApplicationStatus(
    this.label,
    this.apiLabel,
    this.icon,
    this.labelColor,
    this.labelBGColor,
  );

  final String label;
  final String apiLabel;
  final IconData icon;
  final Color labelColor;
  final Color labelBGColor;

  static ApplicationStatus fromValue(String value) {
    switch (value) {
      case 'Accepted':
        return accepted;
      case 'Rejected':
        return rejected;
      case 'Referred To Company':
        return rejected;
      default:
        return pending;
    }
  }
}
