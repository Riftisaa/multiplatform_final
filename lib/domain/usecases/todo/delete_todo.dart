import '../../repositories/todo_repository.dart';

class DeleteTodo {
  final TodoRepository repository;

  DeleteTodo(this.repository);

  Future<void> call(String todoId) {
    return repository.deleteTodo(todoId);
  }
} 