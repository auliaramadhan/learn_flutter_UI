class Todo {
  String description;
  bool complete;

  Todo(this.description, {this.complete = false});
}

const simulateTime = Duration(seconds: 1);

class FakeTodoRepository {
  Future<Todo> submitTodo(Todo data) {
    // Simulate network delay
    return Future.delayed(simulateTime, () {
      return data;
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
