
// review.dart
class Review {
  final String author;
  final String content;
  final String? url;

  Review({
    required this.author,
    required this.content,
    this.url,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      author: json['author'],
      content: json['content'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'author': author,
      'content': content,
      'url': url,
    };
  }
}
