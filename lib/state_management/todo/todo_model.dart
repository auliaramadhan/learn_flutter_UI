import 'package:uuid/uuid.dart';

class Todo {
  late final String? id ;
  String description;
  bool complete;

  Todo(this.description, {this.complete = false, this.id }){
    id = id ?? const Uuid().v4();
  }
}

const simulateTime = Duration(seconds: 1);

class FakeTodoRepository {

  var todo = [
        Todo('asddas'),
        Todo('asdas'),
        Todo('asdasdrqweq'),
        Todo('eqw'),
      ];
  Future<List<Todo>> getTodo() {
    
    // Simulate network delay
    return Future.delayed(simulateTime, () {
      return todo;
    });
  }
  Future<Todo> submitTodo(Todo data) {
    // Simulate network delay
    return Future.delayed(simulateTime, () {
      return data;
    });
  }

  Future<void> editTodo(Todo data, String desc) {
    // Simulate network delay
    return Future.delayed(simulateTime, () {
       data.description = desc ;
    });
  }

  Future<void> toggleTodo(Todo data) {
    // Simulate network delay
    return Future.delayed(simulateTime, () {
       data.complete = !data.complete ;
    });
  }

  Future<bool> removeTodo(Todo data) {
    // Simulate network delay
    return Future.delayed(simulateTime, () {
      return true;
    });
  }

  Future<Todo> errorTodo() {
    // Simulate network delay
    return Future.delayed(simulateTime, () {
      // Simulate some network exception
      throw NetworkException();
    });
  }
}

class NetworkException implements Exception {}
