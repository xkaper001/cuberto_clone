// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Social {
  final String title;
  final String url;
  const Social({
    required this.title,
    required this.url,
  });

  Social copyWith({
    String? title,
    String? url,
  }) {
    return Social(
      title: title ?? this.title,
      url: url ?? this.url,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'url': url,
    };
  }

  factory Social.fromMap(Map<String, dynamic> map) {
    return Social(
      title: map['title'] as String,
      url: map['url'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Social.fromJson(String source) => Social.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Social(title: $title, url: $url)';

  @override
  bool operator ==(covariant Social other) {
    if (identical(this, other)) return true;
  
    return 
      other.title == title &&
      other.url == url;
  }

  @override
  int get hashCode => title.hashCode ^ url.hashCode;
}
