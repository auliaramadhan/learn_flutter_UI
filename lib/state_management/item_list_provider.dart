import 'package:flutter/material.dart';
import 'package:flutter_ui/state_management/item_list_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

import 'package:flutter_ui/state_management/todo/todo_state.dart';

import './todo/todo_model.dart';

class TodoProvider extends ChangeNotifier {
  List<Todo> items = [];

  void editTask(Todo item, String description) {
    if (description != null && description != '') {
      item.description = description;
      notifyListeners();
    }
  }

  void removeItem(Todo item) {
    items.remove(item);
    notifyListeners();
  }

  void addNewTask(String description) {
    if (description != null && description != '') {
      items.add(Todo(description));
      notifyListeners();
    }
  }

  void chanceCompleteness(Todo item) {
    item.complete = !item.complete;
    notifyListeners();
  }
}

class TodoProviderValue extends ValueNotifier<TodoListState> {
  List<Todo> items = [];
  final todoRepository = FakeTodoRepository();

  TodoProviderValue() : super(const TodoListState.loaded([]));


  void getTodo() async {
    value = const TodoListState.loading();
    try {
      await todoRepository.getTodo();
      value = TodoListState.loaded(items);
    } catch (e) {
      value = const TodoListState.error('no description');
    }
  }

  void editTask(Todo item, String description) async {
    value = const TodoListState.loading();
    try {
      if (description != null && description != '') {
        await todoRepository.editTodo(item, description);
        value = TodoListState.loaded(items);
      } else {
        value = const TodoListState.error('no description');
      }
    } catch (e) {
      value = const TodoListState.error('no description');
    }
  }

  void removeItem(Todo item) async {
    value = const TodoListState.loading();
    try {
      await todoRepository.removeTodo(item);
      items.remove(item);
      value = TodoListState.loaded(items);
    } catch (e) {
      value = const TodoListState.error('no description');
    }
  }

  void addNewTask(String description) async {
    value = const TodoListState.loading();
    try {
      final todo = Todo(description);
      if (description != null && description != '') {
        await todoRepository.submitTodo(todo);
        items.add(todo);
        value = TodoListState.loaded(items);
      } else {
        value = const TodoListState.error('no description');
      }
    } catch (e) {
      value = const TodoListState.error('no description');
    }
  }

  void chanceCompleteness(Todo item) async {
    value = const TodoListState.loading();
    try {
      await todoRepository.submitTodo(item);
      item.complete = !item.complete;
      value = TodoListState.loaded(items);
    } catch (e) {
      value = const TodoListState.error('no description');
    }
  }
}

// haruis pakai flutter_state_notifier
class TodoProviderStateNoti extends TodoProviderState {
}
