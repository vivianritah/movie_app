// crew.dart
class Crew {
  final int id;
  final String name;
  final String? job;
  final String? profilePath;

  Crew({
    required this.id,
    required this.name,
    this.job,
    this.profilePath,
  });

  factory Crew.fromJson(Map<String, dynamic> json) {
    return Crew(
      id: json['id'],
      name: json['name'],
      job: json['job'],
      profilePath: json['profile_path'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'job': job,
      'profile_path': profilePath,
    };
  }
}