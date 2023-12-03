import 'package:interview_test/data/models/user_mode.dart';

class User {
  final Profile profile;
  final String token;

  User({
    required this.profile,
    required this.token,
  });
}

class Profile {
  final String id;
  final String email;
  final String fullname;
  final String shortname;
  final String usercode;

  Profile({
    required this.id,
    required this.email,
    required this.fullname,
    required this.shortname,
    required this.usercode,
  });

  factory Profile.fromModel(ProfileModel model) {
    return Profile(
      id: model.id,
      email: model.email,
      fullname: model.fullname,
      shortname: model.shortname,
      usercode: model.usercode,
    );
  }
}
