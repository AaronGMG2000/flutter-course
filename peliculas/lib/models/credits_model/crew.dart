class Crew {
  bool? adult;
  int? gender;
  int? id;
  String? knownForDepartment;
  String? name;
  String? originalName;
  double? popularity;
  String? profilePath;
  String? creditId;
  String? department;
  String? job;

  Crew({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.creditId,
    this.department,
    this.job,
  });

  get fullProfilePath {
    if (profilePath == null) {
      return 'https://via.placeholder.com/300x400';
    } else {
      return 'https://image.tmdb.org/t/p/w500/$profilePath';
    }
  }

  factory Crew.fromJson(Map<String, dynamic> json) => Crew(
        adult: json['adult'] as bool?,
        gender: json['gender'] as int?,
        id: json['id'] as int?,
        knownForDepartment: json['known_for_department'] as String?,
        name: json['name'] as String?,
        originalName: json['original_name'] as String?,
        popularity: (json['popularity'] as num?)?.toDouble(),
        profilePath: json['profile_path'] as String?,
        creditId: json['credit_id'] as String?,
        department: json['department'] as String?,
        job: json['job'] as String?,
      );
}
