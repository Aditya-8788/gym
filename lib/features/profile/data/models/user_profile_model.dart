import '../../domain/entities/user_profile.dart';

class UserProfileModel extends UserProfile {
  UserProfileModel({
    required super.uid,
    required super.email,
    required super.weight,
    required super.height,
    required super.bmi,
    required super.bmiCategory,
  });

  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "email": email,
      "weight": weight,
      "height": height,
      "bmi": bmi.toStringAsFixed(2),
      "bmiCategory": bmiCategory,
      "updatedAt": DateTime.now(),
    };
  }
}