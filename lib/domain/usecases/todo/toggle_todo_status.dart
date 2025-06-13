import '../../entities/todo_entity.dart';
import '../../repositories/todo_repository.dart';

class ToggleTodoStatus {
  final TodoRepository repository;

  ToggleTodoStatus(this.repository);

  Future<TodoEntity> call(String todoId) {
    return repository.toggleTodoStatus(todoId);
  }
} 