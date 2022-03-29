import 'package:bloc/bloc.dart';
import 'package:flutter_ui/state_management/todo/todo_model.dart';
import 'package:flutter_ui/state_management/todo/todo_state.dart';

class ItemListCubit extends Cubit<TodoListState> {
  final List<Todo> items = [];
  final todoRepository = FakeTodoRepository();

  ItemListCubit() : super(TodoListState.loaded([]));

  void getTodo() async {
    // state.maybeWhen(
    //   loaded: (todo) {},
    //   error: (errorText) {},
    //   orElse: () {},
    // );
    emit(const TodoListState.loading());
    try {
      await todoRepository.getTodo();
      emit(TodoListState.loaded(items));
    } catch (e) {
      emit(const TodoListState.error('no description'));
    }
  }

  void editTask(Todo item, String description) async {
    emit(const TodoListState.loading());
    try {
      if (description != null && description != '') {
        await todoRepository.editTodo(item, description);
        emit(TodoListState.loaded(items));
      } else {
        emit(const TodoListState.error('no description'));
      }
    } catch (e) {
      emit(const TodoListState.error('no description'));
    }
  }

  void removeItem(Todo item) async {
    emit(const TodoListState.loading());
    try {
      await todoRepository.removeTodo(item);
      items.remove(item);
      emit(TodoListState.loaded(items));
    } catch (e) {
      emit(const TodoListState.error('no description'));
    }
  }

  void addNewTask(String description) async {
    emit(const TodoListState.loading());
    try {
      final todo = Todo(description);
      if (description != null && description != '') {
        await todoRepository.submitTodo(todo);
        items.add(todo);
        emit(TodoListState.loaded(items));
      } else {
        emit(const TodoListState.error('no description'));
      }
    } catch (e) {
      emit(const TodoListState.error('no description'));
    }
  }

  void chanceCompleteness(Todo item) async {
    emit(const TodoListState.loading());
    try {
      await todoRepository.submitTodo(item);
      item.complete = !item.complete;
      emit(TodoListState.loaded(items));
    } catch (e) {
      emit(const TodoListState.error('no description'));
    }
  }
}
