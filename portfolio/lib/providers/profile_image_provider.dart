import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProfileImageNotifier extends StateNotifier<ImageProvider<Object>> {
  //Initial value setup using constructor function
  ProfileImageNotifier()
      : super(
          const AssetImage(
            'assets/images/profile_pic.jpg',
          ),
        );

  void changeProfilePicture(FileImage pickedImage) {
    state = pickedImage;
  }
}

final profileImageProvider = StateNotifierProvider<ProfileImageNotifier, ImageProvider<Object>>((ref) {
  return ProfileImageNotifier();
});
