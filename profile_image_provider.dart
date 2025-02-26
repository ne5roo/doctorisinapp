import 'package:flutter/material.dart';

class ProfileImageProvider with ChangeNotifier {
  String _profileImageUrl = 'assets/images/character1.png';

  String get profileImageUrl => _profileImageUrl;

  void setProfileImageUrl(String url) {
    _profileImageUrl = url;
    notifyListeners();
  }
}
