// cast.dart
class Cast {
  final int id;
  final String name;
  final String? character;
  final String? profilePath;
  final double? popularity;

  Cast({
    required this.id,
    required this.name,
    this.character,
    this.profilePath,
    this.popularity,
  });

  factory Cast.fromJson(Map<String, dynamic> json) {
    return Cast(
      id: json['id'],
      name: json['name'],
      character: json['character'],
      profilePath: json['profile_path'],
      popularity: (json['popularity'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'character': character,
      'profile_path': profilePath,
      'popularity': popularity,
    };
  }
}
