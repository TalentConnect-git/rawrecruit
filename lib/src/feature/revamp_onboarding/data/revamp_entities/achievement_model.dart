class AchievementModel {
  String? title;
  String? event;
  String? date;

  AchievementModel({
    this.title,
    this.event,
    this.date,
  });

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "event": event,
      "date": date,
    };
  }
  factory AchievementModel.fromJson(Map<String, dynamic> json) {
  return AchievementModel(
    title: json["title"],
    event: json["event"],
    date: json["date"],
  );
}
}