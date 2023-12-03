import 'package:interview_test/domain/entity/user_entity.dart';

abstract class AuthRepository {
  Future<User> loginUser(String email, String password);
  Future<User> autoLogin();
  Future<void> logout();
}
