import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../domain/entities/user_profile.dart';
import '../../domain/usecases/save_user_profile.dart';
import 'profile_event.dart';
import 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final SaveUserProfile saveUserProfile;

  ProfileBloc({required this.saveUserProfile}) : super(ProfileInitial()) {
    on<SaveProfileRequested>(_onSaveProfileRequested);
  }

  Future<void> _onSaveProfileRequested(
    SaveProfileRequested event,
    Emitter<ProfileState> emit,
  ) async {
    emit(ProfileLoading());

    try {
      final user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        emit(const ProfileError("User not logged in"));
        return;
      }

      final heightMeter = event.height / 100;
      final bmi = event.weight / (heightMeter * heightMeter);
      final category = _getBmiCategory(bmi);

      final profile = UserProfile(
        uid: user.uid,
        email: user.email ?? "",
        weight: event.weight,
        height: event.height,
        bmi: bmi,
        bmiCategory: category,
      );

      await saveUserProfile(profile);

      emit(ProfileSaved(bmi: bmi, bmiCategory: category));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  String _getBmiCategory(double bmi) {
    if (bmi < 18.5) {
      return "Underweight";
    } else if (bmi < 25) {
      return "Normal";
    } else if (bmi < 30) {
      return "Overweight";
    } else {
      return "Obese";
    }
  }
}