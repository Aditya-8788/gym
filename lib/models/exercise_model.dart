class Exercise {
  final String name;
  final String bodyPart;
  final String equipment;
  final String target;
  final String gifUrl;

  Exercise({
    required this.name,
    required this.bodyPart,
    required this.equipment,
    required this.target,
    required this.gifUrl,
  });

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
      name: json['name'] ?? "",
      bodyPart: json['bodyPart'] ?? "",
      equipment: json['equipment'] ?? "",
      target: json['primaryMuscles'][0],
      gifUrl: json['images'][0],
    );
  }
}