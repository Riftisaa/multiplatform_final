import '../../domain/entities/todo_entity.dart';
import '../../domain/repositories/todo_repository.dart';
import '../datasources/todo_remote_datasource.dart';
import '../models/todo_model.dart';

class TodoRepositoryImpl implements TodoRepository {
  final TodoRemoteDatasource remoteDatasource;

  TodoRepositoryImpl(this.remoteDatasource);

  @override
  Future<List<TodoEntity>> getTodos(String userId) async {
    try {
      final todos = await remoteDatasource.getTodos(userId);
      return todos.cast<TodoEntity>();
    } catch (e) {
      throw Exception('Failed to get todos: $e');
    }
  }

  @override
  Future<TodoEntity> addTodo(TodoEntity todo) async {
    try {
      final todoModel = TodoModel.fromEntity(todo);
      final result = await remoteDatasource.addTodo(todoModel);
      return result;
    } catch (e) {
      throw Exception('Failed to add todo: $e');
    }
  }

  @override
  Future<TodoEntity> updateTodo(TodoEntity todo) async {
    try {
      final todoModel = TodoModel.fromEntity(todo);
      final result = await remoteDatasource.updateTodo(todoModel);
      return result;
    } catch (e) {
      throw Exception('Failed to update todo: $e');
    }
  }

  @override
  Future<void> deleteTodo(String todoId) async {
    try {
      await remoteDatasource.deleteTodo(todoId);
    } catch (e) {
      throw Exception('Failed to delete todo: $e');
    }
  }

  @override
  Future<TodoEntity> toggleTodoStatus(String todoId) async {
    try {
      final result = await remoteDatasource.toggleTodoStatus(todoId);
      return result;
    } catch (e) {
      throw Exception('Failed to toggle todo status: $e');
    }
  }
} 