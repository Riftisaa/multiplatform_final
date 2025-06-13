import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/todo_model.dart';

abstract class TodoRemoteDatasource {
  Future<List<TodoModel>> getTodos(String userId);
  Future<TodoModel> addTodo(TodoModel todo);
  Future<TodoModel> updateTodo(TodoModel todo);
  Future<void> deleteTodo(String todoId);
  Future<TodoModel> toggleTodoStatus(String todoId);
}

class TodoRemoteDatasourceImpl implements TodoRemoteDatasource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final String _collection = 'todos';

  @override
  Future<List<TodoModel>> getTodos(String userId) async {
    try {
      final querySnapshot = await _firestore
          .collection(_collection)
          .where('userId', isEqualTo: userId)
          .get();

      final todos = querySnapshot.docs
          .map((doc) => TodoModel.fromMap(doc.data(), doc.id))
          .toList();
      
      // Sort by createdAt in descending order (newest first)
      todos.sort((a, b) => b.createdAt.compareTo(a.createdAt));
      
      return todos;
    } catch (e) {
      throw Exception('Failed to get todos: $e');
    }
  }

  @override
  Future<TodoModel> addTodo(TodoModel todo) async {
    try {
      final docRef = await _firestore.collection(_collection).add(todo.toMap());
      final doc = await docRef.get();
      return TodoModel.fromMap(doc.data()!, doc.id);
    } catch (e) {
      throw Exception('Failed to add todo: $e');
    }
  }

  @override
  Future<TodoModel> updateTodo(TodoModel todo) async {
    try {
      await _firestore.collection(_collection).doc(todo.id).update(todo.toMap());
      return todo;
    } catch (e) {
      throw Exception('Failed to update todo: $e');
    }
  }

  @override
  Future<void> deleteTodo(String todoId) async {
    try {
      await _firestore.collection(_collection).doc(todoId).delete();
    } catch (e) {
      throw Exception('Failed to delete todo: $e');
    }
  }

  @override
  Future<TodoModel> toggleTodoStatus(String todoId) async {
    try {
      final doc = await _firestore.collection(_collection).doc(todoId).get();
      if (!doc.exists) {
        throw Exception('Todo not found');
      }

      final currentTodo = TodoModel.fromMap(doc.data()!, doc.id);
      final updatedTodo = TodoModel.fromEntity(
        currentTodo.copyWith(isCompleted: !currentTodo.isCompleted),
      );

      await _firestore.collection(_collection).doc(todoId).update({
        'isCompleted': updatedTodo.isCompleted,
      });

      return updatedTodo;
    } catch (e) {
      throw Exception('Failed to toggle todo status: $e');
    }
  }
} 