import '../../entities/todo_entity.dart';
import '../../repositories/todo_repository.dart';

class GetTodos {
  final TodoRepository repository;

  GetTodos(this.repository);

  Future<List<TodoEntity>> call(String userId) {
    return repository.getTodos(userId);
  }
} 