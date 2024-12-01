// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Project {
  final String title;
  final String imageUrl;

  Project({
    required this.title,
    required this.imageUrl,
  });

  Project copyWith({
    String? title,
    String? imageUrl,
  }) {
    return Project(
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'imageUrl': imageUrl,
    };
  }

  factory Project.fromMap(Map<String, dynamic> map) {
    return Project(
      title: map['title'] as String,
      imageUrl: map['imageUrl'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Project.fromJson(String source) => Project.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Project(title: $title, imageUrl: $imageUrl)';

  @override
  bool operator ==(covariant Project other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
      other.imageUrl == imageUrl;
  }

  @override
  int get hashCode => title.hashCode ^ imageUrl.hashCode;
}
