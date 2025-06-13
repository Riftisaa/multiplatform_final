import '../entities/todo_entity.dart';

abstract class TodoRepository {
  Future<List<TodoEntity>> getTodos(String userId);
  Future<TodoEntity> addTodo(TodoEntity todo);
  Future<TodoEntity> updateTodo(TodoEntity todo);
  Future<void> deleteTodo(String todoId);
  Future<TodoEntity> toggleTodoStatus(String todoId);
} 