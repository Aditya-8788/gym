import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/user_profile_model.dart';

abstract class ProfileRemoteDataSource {
  Future<void> saveUserProfile(UserProfileModel profile);
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final FirebaseFirestore firestore;

  ProfileRemoteDataSourceImpl({FirebaseFirestore? firestore})
      : firestore = firestore ?? FirebaseFirestore.instance;

  @override
  Future<void> saveUserProfile(UserProfileModel profile) async {
    await firestore.collection("users").doc(profile.uid).set(
          profile.toJson(),
          SetOptions(merge: true),
        );
  }
}