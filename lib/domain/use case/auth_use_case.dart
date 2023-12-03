import 'package:interview_test/domain/entity/user_entity.dart';
import 'package:interview_test/domain/repository/auth_repository.dart';

class AuthUseCase {
  final AuthRepository _authRepository;

  AuthUseCase(this._authRepository);

  Future<User> loginUser(String email, String password) async {
    return await _authRepository.loginUser(email, password);
  }

  Future<User> autoLogin() async {
    return await _authRepository.autoLogin();
  }

  Future<void> logout() async {
    return await _authRepository.logout();
  }
}
