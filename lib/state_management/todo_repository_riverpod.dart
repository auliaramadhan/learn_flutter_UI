import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'todo/todo_model.dart';

final _sampleTodos = [
  Todo('Buy cat food'),
  Todo('Learn Riverpod'),
];

class TodoException implements Exception {
  const TodoException(this.error);

  final String error;

  @override
  String toString() {
    return '''
Todo Error: $error
    ''';
  }
}

const double errorLikelihood = 0.1;

class FakeTodoRepository {
  FakeTodoRepository() : random = Random() {
    mockTodoStorage = [..._sampleTodos];
  }

  late List<Todo> mockTodoStorage;
  final Random random;

  @override
  Future<List<Todo>> retrieveTodos() async {
    await _waitRandomTime();
    // retrieving mock storage
    if (random.nextDouble() < 0.3) {
      throw const TodoException('Todos could not be retrieved');
    } else {
      return mockTodoStorage;
    }
  }

  @override
  Future<void> addTodo(String description) async {
    await _waitRandomTime();
    // updating mock storage
    if (random.nextDouble() < errorLikelihood) {
      throw const TodoException('Todo could not be added');
    } else {
      mockTodoStorage = [...mockTodoStorage, Todo(description)];
    }
  }

  @override
  Future<void> remove(String id) async {
    await _waitRandomTime();
    // updating mock storage
    if (random.nextDouble() < errorLikelihood) {
      throw const TodoException('Todo could not be removed');
    } else {
      mockTodoStorage = mockTodoStorage.where((element) => element.id != id).toList();
    }
  }

  @override
  Future<void> edit({required String id, required String description}) async {
    await _waitRandomTime();
    // updating mock storage
    if (random.nextDouble() < errorLikelihood) {
      throw const TodoException('Could not update todo');
    } else {
      mockTodoStorage = [
        for (final todo in mockTodoStorage)
          if (todo.id == id)
            Todo(
              description,
              id: todo.id,
              complete: todo.complete,
            )
          else
            todo,
      ];
    }
  }

  @override
  Future<void> toggle(String id) async {
    await _waitRandomTime();
    // updating mock storage
    if (random.nextDouble() < errorLikelihood) {
      throw const TodoException('Todo could not be toggled');
    } else {
      mockTodoStorage = mockTodoStorage.map((todo) {
        if (todo.id == id) {
          return Todo(
            todo.description,
            id: todo.id,
            complete: !todo.complete,
          );
        }
        return todo;
      }).toList();
    }
  }

  Future<void> _waitRandomTime() async {
    await Future.delayed(
      Duration(seconds: random.nextInt(3)),
      () {},
    ); // simulate loading
  }
}

// import 'package:riverpod_003_async_value/repositories/fake_todo_repository.dart';
// import 'package:riverpod_003_async_value/repositories/todo_repository.dart';

final todoRepositoryProvider = Provider<FakeTodoRepository>((ref) {
  throw UnimplementedError();
});

final todosNotifierProvider = StateNotifierProvider<TodosNotifier, AsyncValue<List<Todo>>>((ref) {
  return TodosNotifier(ref.read);
});

final completeTodosProvider = Provider<AsyncValue<List<Todo>>>((ref) {
  final todosState = ref.watch(todosNotifierProvider);
  return todosState.whenData(
    (todos) => todos.where((todo) => todo.complete).toList(),
  );
});

final todoExceptionProvider = StateProvider<TodoException?>((ref) {
  return null;
});

class TodosNotifier extends StateNotifier<AsyncValue<List<Todo>>> {
  TodosNotifier(
    this.read, [
    AsyncValue<List<Todo>>? todos,
  ]) : super(todos ?? const AsyncValue.loading()) {
    _retrieveTodos();
  }

  final Reader read;
  AsyncValue<List<Todo>>? previousState;

  Future<void> _retrieveTodos() async {
    try {
      final todos = await read(todoRepositoryProvider).retrieveTodos();
      state = AsyncValue.data(todos);
    } on TodoException catch (e, st) {
      state = AsyncValue.error(e, stackTrace: st);
    }
  }

  Future<void> retryLoadingTodo() async {
    state = const AsyncValue.loading();
    try {
      final todos = await read(todoRepositoryProvider).retrieveTodos();
      state = AsyncValue.data(todos);
    } on TodoException catch (e, st) {
      state = AsyncValue.error(e, stackTrace: st);
    }
  }

  Future<void> refresh() async {
    try {
      final todos = await read(todoRepositoryProvider).retrieveTodos();
      state = AsyncValue.data(todos);
    } catch (e, st) {
      state = AsyncValue.error(e, stackTrace: st);
    }
  }

  Future<void> add(String description) async {
    _cacheState();
    state = state.whenData((todos) => [...todos, Todo(description)]);

    try {
      await read(todoRepositoryProvider).addTodo(description);
    } on TodoException catch (e) {
      _handleException(e);
    }
  }

  Future<void> toggle(String id) async {
    _cacheState();

    state = state.whenData(
      (value) => value.map((todo) {
        if (todo.id == id) {
          return Todo(todo.description, id: todo.id, complete: !todo.complete);
        }
        return todo;
      }).toList(),
    );
    try {
      await read(todoRepositoryProvider).toggle(id);
    } on TodoException catch (e) {
      _handleException(e);
    }
  }

  Future<void> edit({required String id, required String description}) async {
    _cacheState();
    state = state.whenData((todos) {
      return [
        for (final todo in todos)
          if (todo.id == id)
            Todo(
              description,
              id: todo.id,
              complete: todo.complete,
            )
          else
            todo
      ];
    });

    try {
      await read(todoRepositoryProvider).edit(id: id, description: description);
    } on TodoException catch (e) {
      _handleException(e);
    }
  }

  Future<void> remove(String id) async {
    _cacheState();
    state = state.whenData(
      (value) => value.where((element) => element.id != id).toList(),
    );
    try {
      await read(todoRepositoryProvider).remove(id);
    } on TodoException catch (e) {
      _handleException(e);
    }
  }

  void _cacheState() {
    previousState = state;
  }

  void _resetState() {
    if (previousState != null) {
      state = previousState!;
      previousState = null;
    }
  }

  void _handleException(TodoException e) {
    _resetState();
    read(todoExceptionProvider.notifier).state = e;
  }
}
