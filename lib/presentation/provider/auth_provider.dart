import 'package:flutter/cupertino.dart';
import 'package:interview_test/domain/use%20case/auth_use_case.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entity/user_entity.dart';

class AuthProvider extends ChangeNotifier {
  final AuthUseCase _authUseCase;

  AuthProvider(this._authUseCase);

  User? _currentUser;
  User? get currentUser => _currentUser;

  String? _email = '';
  String? get email => _email;

  String? _token = '';
  String? get token => _token;

  Future<void> login(String email, String password) async {
    try {
      final User loginResponse = await _authUseCase.loginUser(email, password);

      _currentUser = loginResponse;
      _email = email;

      SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString('token', loginResponse.token);
      prefs.setString('email', email);

      notifyListeners();
    } catch (error) {
      throw Exception("error provider login: $error");
    }
  }

  Future<void> autoLogin() async {
    try {
      final User? autoLoginResponse = await _authUseCase.autoLogin();

      if (autoLoginResponse != null) {
        _currentUser = autoLoginResponse;
        _token = autoLoginResponse.token;

        // Simpan token pada penyimpanan lokal (SharedPreferences)
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', _token!);

        notifyListeners();
      }
    } catch (error) {
      throw Exception("Error during auto login: $error");
    }
  }

  Future<void> logout() async {
    try {
      await _authUseCase.logout();
      notifyListeners();
    } catch (error) {
      throw Exception("error provider logout $error");
    }
  }
}
