class RecentEventModel {
  String coverImage;

  RecentEventModel({
    required this.coverImage,
  });

  factory RecentEventModel.fromJson(Map<String, dynamic> json) {
    return RecentEventModel(
      coverImage: json["cover_image"] ?? '',
    );
  }
}
