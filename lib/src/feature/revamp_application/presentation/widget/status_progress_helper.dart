class ApplicationProgressHelper {
  static int getStep(String status) {
    switch (status.toLowerCase()) {
      case "referred to company":
        return 1;

      case "accepted":
      case "rejected":
        return 2;

      case "pending":
      default:
        return 0;
    }
  }

  static double getProgress(String status) {
    final step = getStep(status);
    return (step + 1) / 3;
  }

  static int getPercentage(String status) {
    return (getProgress(status) * 100).toInt();
  }
}