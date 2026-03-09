import 'package:intl/intl.dart';

extension DateTimeExt on DateTime {
  String toRelativeTime() {
    final now = DateTime.now();
    final difference = now.difference(this);

    if (difference.inSeconds < 5) {
      return 'just now';
    }

    if (difference.inSeconds < 60) {
      return '${difference.inSeconds} secs ago';
    }

    if (difference.inMinutes < 60) {
      final m = difference.inMinutes;
      return m == 1 ? '1 min ago' : '$m mins ago';
    }

    if (difference.inHours < 24) {
      final h = difference.inHours;
      return h == 1 ? '1 hr ago' : '$h hrs ago';
    }

    if (difference.inDays == 1) {
      return 'yesterday';
    }

    return DateFormat('MMM d, yyyy').format(this);
  }
}
