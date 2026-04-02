class PublicationModel {
  String? title;
  String? url;

  PublicationModel({
    this.title,
    this.url,
  });

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "url": url,
    };
  }
  factory PublicationModel.fromJson(Map<String, dynamic> json) {
  return PublicationModel(
    title: json["title"],
    url: json["url"],
  );
}
}