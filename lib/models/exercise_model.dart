class Exercise {
  final String name;
  final String bodyPart;
  final String equipment;
  final String target;
  final String gifUrl;
  final List<String> instructions;

  Exercise({
    required this.name,
    required this.bodyPart,
    required this.equipment,
    required this.target,
    required this.gifUrl,
    required this.instructions,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
      name: json['name'] ?? "",
      bodyPart: json['category'] ?? "",
      equipment: json['equipment'] ?? "",
      target: (json['primaryMuscles'] != null &&
              (json['primaryMuscles'] as List).isNotEmpty)
          ? json['primaryMuscles'][0]
          : "",
      gifUrl: (json['images'] != null &&
              (json['images'] as List).isNotEmpty)
          ? json['images'][0]
          : "",
      instructions: (json['instructions'] != null &&
              json['instructions'] is List)
          ? List<String>.from(json['instructions'])
          : [],   // 🔥 If null → empty list
    );
  }
}