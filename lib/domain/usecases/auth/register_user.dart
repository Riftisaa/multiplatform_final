// register_use_case.dart
import '../../repositories/auth_repository.dart';
import '../../entities/user_entity.dart';

class RegisterUseCase {
  final AuthRepository repository;
  RegisterUseCase(this.repository);

  Future<UserEntity?> call(String email, String password) {
    return repository.register(email, password);
  }
}
