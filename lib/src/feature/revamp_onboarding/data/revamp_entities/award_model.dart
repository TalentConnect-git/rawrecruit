class AwardModel {
  String? title;
  String? organization;
  String? startDate;
  String? endDate;
  String? description;

  AwardModel({
    this.title,
    this.organization,
    this.startDate,
    this.endDate,
    this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "organization": organization,
      "startDate": startDate,
      "endDate": endDate,
      "description": description,
    };
  }
  factory AwardModel.fromJson(Map<String, dynamic> json) {
  return AwardModel(
    title: json["title"],
    organization: json["organization"],
    startDate: json["startDate"],
    endDate: json["endDate"],
    description: json["description"],
  );
}
}