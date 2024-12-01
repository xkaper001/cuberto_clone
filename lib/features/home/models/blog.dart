// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Blog {
  final String title;
  final String imageUrl;
  final String? url;

  Blog({
    required this.title,
    required this.imageUrl,
    this.url,
  });

  Blog copyWith({
    String? title,
    String? imageUrl,
    String? url,
  }) {
    return Blog(
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'imageUrl': imageUrl,
      'url': url,
    };
  }

  factory Blog.fromMap(Map<String, dynamic> map) {
    return Blog(
      title: map['title'] as String,
      imageUrl: map['imageUrl'] as String,
      url: map['url'] != null ? map['url'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Blog.fromJson(String source) => Blog.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Blog(title: $title, imageUrl: $imageUrl, url: $url)';

  @override
  bool operator ==(covariant Blog other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
      other.imageUrl == imageUrl &&
      other.url == url;
  }

  @override
  int get hashCode => title.hashCode ^ imageUrl.hashCode ^ url.hashCode;
}
