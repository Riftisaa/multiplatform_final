import 'package:firebase_auth/firebase_auth.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  @override
  Future<UserEntity?> login(String email, String password) async {
    final result = await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
    final user = result.user;
    return user != null ? UserEntity(uid: user.uid, email: user.email!) : null;
  }

  @override
  Future<UserEntity?> register(String email, String password) async {
    final result = await _firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
    final user = result.user;
    return user != null ? UserEntity(uid: user.uid, email: user.email!) : null;
  }

  @override
  Future<void> logout() async {
    await _firebaseAuth.signOut();
  }
}
