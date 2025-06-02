import 'package:flutter/material.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/usecases/auth/login_user.dart';
import '../../domain/usecases/auth/register_user.dart';
import '../../domain/entities/user_entity.dart';

class AuthProvider extends ChangeNotifier {
  final LoginUseCase _loginUseCase = LoginUseCase(AuthRepositoryImpl());
  final RegisterUseCase _registerUseCase = RegisterUseCase(AuthRepositoryImpl());

  UserEntity? _user;
  UserEntity? get user => _user;

  Future<bool> login(String email, String password) async {
    _user = await _loginUseCase(email, password);
    notifyListeners();
    return _user != null;
  }

  Future<bool> register(String email, String password) async {
    _user = await _registerUseCase(email, password);
    notifyListeners();
    return _user != null;
  }

  void logout() {
    _user = null;
    notifyListeners();
  }
}
