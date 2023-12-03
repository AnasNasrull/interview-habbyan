class UserModel {
  final ProfileModel profile;
  final String token;

  UserModel({
    required this.profile,
    required this.token,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      profile: ProfileModel.fromJson(json['profile']),
      token: json['token'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'profile': profile.toJson(),
      'token': token,
    };
  }
}

class ProfileModel {
  final String id;
  final String email;
  final String fullname;
  final String shortname;
  final String usercode;

  ProfileModel({
    required this.id,
    required this.email,
    required this.fullname,
    required this.shortname,
    required this.usercode,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) {
    return ProfileModel(
      id: json['id'] ?? '',
      email: json['email'] ?? '',
      fullname: json['fullname'] ?? '',
      shortname: json['shortname'] ?? '',
      usercode: json['usercode'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'fullname': fullname,
      'shortname': shortname,
      'usercode': usercode,
    };
  }
}
