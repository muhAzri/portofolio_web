class ProjectModel {
  final String? title;
  final String? type;
  final String? projectUrl;
  final String? imageUrl;

  ProjectModel({
    this.type,
    this.projectUrl,
    this.imageUrl,
    this.title,
  });

  factory ProjectModel.fromJson(Map<String, dynamic> json) => ProjectModel(
        title: json['title'],
        type: json['type'],
        projectUrl: json['project_url'],
        imageUrl: json['image_url'],
      );
}

