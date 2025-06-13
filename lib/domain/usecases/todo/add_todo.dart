import '../../entities/todo_entity.dart';
import '../../repositories/todo_repository.dart';

class AddTodo {
  final TodoRepository repository;

  AddTodo(this.repository);

  Future<TodoEntity> call(TodoEntity todo) {
    return repository.addTodo(todo);
  }
} 