import 'package:flutter/material.dart';

enum ApplicationStatus {
  pending('Pending', Colors.black, Colors.grey),
  accepted('Accepted', Colors.white, Colors.green),
  rejected('Rejected', Colors.white, Colors.red);

  const ApplicationStatus(this.label, this.labelColor, this.labelBGColor);

  final String label;
  final Color labelColor;
  final Color labelBGColor;

  static ApplicationStatus fromValue(String value) {
    switch (value) {
      case 'Accepted':
        return accepted;
      case 'Rejected':
        return rejected;
      default:
        return pending;
    }
  }
}
