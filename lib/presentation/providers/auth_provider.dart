import 'package:flutter/material.dart';
import '../../data/repositories/auth_repository_impl.dart';
import '../../domain/usecases/auth/login_user.dart';
import '../../domain/usecases/auth/register_user.dart';
import '../../domain/entities/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthProvider extends ChangeNotifier {
  final LoginUseCase _loginUseCase = LoginUseCase(AuthRepositoryImpl());
  final RegisterUseCase _registerUseCase = RegisterUseCase(AuthRepositoryImpl());

  UserEntity? _user;
  UserEntity? get user => _user;

  String? _errorMessage;
  String? get errorMessage => _errorMessage;

  Future<bool> login(String email, String password) async {
    try {
      _user = await _loginUseCase(email, password);
      _errorMessage = null;
      notifyListeners();
      return _user != null;
    } on FirebaseAuthException catch (e) {
      _errorMessage = e.message;
      notifyListeners();
      return false;
    } catch (e) {
      _errorMessage = "Terjadi kesalahan. Coba lagi.";
      notifyListeners();
      return false;
    }
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
