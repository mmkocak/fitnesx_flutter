import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fitnesx_flutter/feature/screen/register/profil_completion_page/cubit/date_cubit.dart';
import 'package:fitnesx_flutter/feature/screen/register/profil_completion_page/cubit/gender_cubit.dart';
import 'package:fitnesx_flutter/feature/utils/common/common_imports.dart';

extension ProfileDataExtension on BuildContext{
  Future<void> SaveProfileData({required String weight, required String height}) async {
    final String? gender = this.read<GenderCubit>().state;
    final DateTime? dob = this.read<DateCubit>().state;
    if (weight.isEmpty || height.isEmpty || gender == null || dob == null) {
      ScaffoldMessenger.of(this).showSnackBar(
        SnackBar(content: Text("Please complete all fields")),
      );
      return;
    }
    try {
      await FirebaseFirestore.instance.collection('users').add({
        'weight': weight,
        'height': height,
        'gender': gender,
        'date_of_brith': dob.toIso8601String(),
      });
      ScaffoldMessenger.of(this).showSnackBar(
        SnackBar(content: Text("Profil saved data succesfully!")),
      );
    } catch (e) {
      ScaffoldMessenger.of(this).showSnackBar(
          SnackBar(content: Text("Failed to save profile data ${e} ")));
    }
  }
}