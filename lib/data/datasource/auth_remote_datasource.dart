import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:interview_test/data/models/user_mode.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRemoteDatasource {
  final Dio _dio = Dio();
  late SharedPreferences _preferences;

  AuthRemoteDatasource(SharedPreferences preferences) {
    _preferences = preferences;
  }

  Future<String?> getToken() async {
    return await _preferences.getString('token');
  }

  Future<void> saveToken(String token) async {
    await _preferences.setString('token', token);
  }

  Future<UserModel> login(String email, String password) async {
    try {
      final response = await _dio.post(
        "https://fg-api.lumoshive.net/pub/api/v1/login",
        data: {
          'email': email,
          'password': password,
        },
        options: Options(
          contentType: Headers.jsonContentType,
        ),
      );

      print("response user => $response");

      if (response.statusCode == 200) {
        final responseData = response.data["data"];
        final getToken = responseData["token"];
        final getDataUser = responseData["profile"];

        // final secureStorage = FlutterSecureStorage();
        // await secureStorage.write(key: 'token', value: getToken);
        // await secureStorage.write(key: 'profile', value: getDataUser);

        final user = UserModel.fromJson({
          'token': getToken,
          'profile': getDataUser,
        });

        await saveToken(getToken);

        return user;
      } else {
        throw Exception('Failed Login');
      }
    } catch (error) {
      throw Exception("error remote api: $error");
    }
  }

  Future<Map<String, dynamic>?> getDatasProfile() async {
    try {
      final secureStorage = FlutterSecureStorage();
      final storedProfile = await secureStorage.read(key: 'profile');

      if (storedProfile != null) {
        final profileData = jsonDecode(storedProfile);
        return profileData;
      } else {
        return null;
      }
    } catch (error) {
      throw Exception("error get datas profile: $error");
    }
  }

  Future<void> logout() async {
    try {
      await _preferences.remove('token');
      await _preferences.remove('email');

      final secureStorage = FlutterSecureStorage();
      await secureStorage.delete(key: 'profile');
    } catch (error) {
      throw Exception("error during logout: $error");
    }
  }
}
