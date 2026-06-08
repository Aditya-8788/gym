class UserProfile {
  final String uid;
  final String email;
  final double weight;
  final double height;
  final double bmi;
  final String bmiCategory;

  UserProfile({
    required this.uid,
    required this.email,
    required this.weight,
    required this.height,
    required this.bmi,
    required this.bmiCategory,
  });
}