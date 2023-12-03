import 'package:interview_test/data/datasource/auth_remote_datasource.dart';
import 'package:interview_test/data/models/user_mode.dart';
import 'package:interview_test/domain/entity/user_entity.dart';
import 'package:interview_test/domain/repository/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDatasource _authRemoteDatasource;

  AuthRepositoryImpl(this._authRemoteDatasource);

  @override
  Future<User> loginUser(String email, String password) async {
    try {
      final UserModel userModel =
          await _authRemoteDatasource.login(email, password);

      return User(
        profile: Profile.fromModel(userModel.profile),
        token: userModel.token,
      );
    } catch (error) {
      throw Exception("Error repo auth: $error");
    }
  }

  @override
  Future<User> autoLogin() async {
    try {
      final token = await _authRemoteDatasource.getToken();

      if (token != null) {
        final profileData = await _authRemoteDatasource.getDatasProfile();

        if (profileData != null) {
          final UserModel userModel = UserModel.fromJson({
            'token': token,
            'profile': profileData,
          });

          return User(
            profile: Profile.fromModel(userModel.profile),
            token: userModel.token,
          );
        }
      }

      throw Exception('Auto login failed');
    } catch (error) {
      throw Exception("Error during auto login: $error");
    }
  }

  @override
  Future<void> logout() async {
    try {
      await _authRemoteDatasource.logout();
    } catch (error) {
      throw Exception("error logout => $error");
    }
  }
}
