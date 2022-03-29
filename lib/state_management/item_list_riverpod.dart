import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_ui/state_management/todo/todo_model.dart';
import 'package:flutter_ui/state_management/todo/todo_state.dart';

class TodoList extends StateNotifier<List<Todo>> {
  final StateNotifierProviderRef ref;
  TodoList(List<Todo>? initialTodos, {required this.ref}) : super(initialTodos ?? []);

  void add(String description) {
    state = [
      ...state,
      Todo(
        description,
      ),
    ];
  }

  void toggle(String id) {
    state = [
      for (final todo in state)
        if (todo.id == id)
          Todo(
            todo.description,
            complete: !todo.complete,
          )
        else
          todo,
    ];
  }

  void edit({required String id, required String description}) {
    state = [
      for (final todo in state)
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

  void remove(Todo target) {
    state = state.where((todo) => todo.id != target.id).toList();
  }
}

final todoListProvider = StateNotifierProvider<TodoList, List<Todo>>((ref) {
  return TodoList([
    Todo('hi'),
    Todo('hello'),
    Todo('bonjour'),
  ], ref: ref);
});

/// The different ways to filter the list of todos
enum TodoListFilter {
  all,
  active,
  complete,
}

/// The currently active filter.
///
/// We use [StateProvider] here as there is no fancy logic behind manipulating
/// the value since it's just enum.
final todoListFilter = StateProvider((_) => TodoListFilter.all);

final todoListPersist = StateProvider<List<Todo>>((_) => []);

/// The number of uncomplete todos
///
/// By using [Provider], this value is cached, making it performant.\
/// Even multiple widgets try to read the number of uncomplete todos,
/// the value will be computed only once (until the todo-list changes).
///
/// This will also optimise unneeded rebuilds if the todo-list changes, but the
/// number of uncomplete todos doesn't (such as when editing a todo).
final uncompleteTodosCount = Provider<int>((ref) {
  return ref.watch(todoListProvider).where((todo) => !todo.complete).length;
});

/// The list of todos after applying of [todoListFilter].
///
/// This too uses [Provider], to avoid recomputing the filtered list unless either
/// the filter of or the todo-list updates.
final filteredTodos = Provider<List<Todo>>((ref) {
  final filter = ref.watch(todoListFilter);
  final todos = ref.watch(todoListProvider);
  // ref.read(todoListProvider.notifier).state = [] ;


  switch (filter) {
    case TodoListFilter.complete:
      return todos.where((todo) => todo.complete).toList();
    case TodoListFilter.active:
      return todos.where((todo) => !todo.complete).toList();
    case TodoListFilter.all:
      return todos;
  }
});

//  hampir sama dengan bloc

final todoProviderState = StateNotifierProvider<TodoProviderState, TodoListState>(
  (ref) {
    return TodoProviderState();
  },
);

class TodoProviderState extends StateNotifier<TodoListState> {
  List<Todo> items = [];
  final todoRepository = FakeTodoRepository();

  TodoProviderState() : super(const TodoListState.loaded([]));

  void getTodo() async {
    state = const TodoListState.loading();
    try {
      await todoRepository.getTodo();
      state = TodoListState.loaded(items);
    } catch (e) {
      state = const TodoListState.error('no description');
    }
  }

  void editTask(Todo item, String description) async {
    state = const TodoListState.loading();
    try {
      if (description != null && description != '') {
        await todoRepository.editTodo(item, description);
        state = TodoListState.loaded(items);
      } else {
        state = const TodoListState.error('no description');
      }
    } catch (e) {
      state = const TodoListState.error('no description');
    }
  }

  void removeItem(Todo item) async {
    state = const TodoListState.loading();
    try {
      await todoRepository.removeTodo(item);
      items.remove(item);
      state = TodoListState.loaded(items);
    } catch (e) {
      state = const TodoListState.error('no description');
    }
  }

  void addNewTask(String description) async {
    state = const TodoListState.loading();
    try {
      final todo = Todo(description);
      if (description != null && description != '') {
        await todoRepository.submitTodo(todo);
        items.add(todo);
        state = TodoListState.loaded(items);
      } else {
        state = const TodoListState.error('no description');
      }
    } catch (e) {
      state = const TodoListState.error('no description');
    }
  }

  void chanceCompleteness(Todo item) async {
    state = const TodoListState.loading();
    try {
      await todoRepository.toggleTodo(item);
      item.complete = !item.complete;
      state = TodoListState.loaded(items);
    } catch (e) {
      state = const TodoListState.error('no description');
    }
  }
}

// other way

final entriesProvider = FutureProvider((ref) {
  final entryRepository = ref.watch(entryRepositoryProvider);
  return entryRepository.getTodo();
});

final entryRepositoryProvider = Provider((_) => FakeTodoRepository());

final todoPageControllerProvider = Provider((ref) {
  final entryRepository = ref.watch(entryRepositoryProvider);
  return TodoPageController(ref: ref, todoRepository: entryRepository);
});

class TodoPageController {
  final ProviderRef ref;
  final FakeTodoRepository todoRepository;

  TodoPageController({required this.ref, required this.todoRepository});

  void editTask(Todo item, String description) async {
    await todoRepository.editTodo(item, description);
    ref.refresh(entriesProvider);
  }

  void removeItem(Todo item) async {
    await todoRepository.removeTodo(item);
    ref.refresh(entriesProvider);
  }

  void addNewTask(String description) async {
    final todo = Todo(description);
    if (description != null && description != '') {
      await todoRepository.submitTodo(todo);
      ref.refresh(entriesProvider);
    }
  }

  void chanceCompleteness(Todo item) async {
    await todoRepository.toggleTodo(item);
    ref.refresh(entriesProvider);
  }

  // addEntry(Todo entry) {
  //   entryRepository.submitTodo(entry);
  //   ref.refresh(entriesProvider);
  // }

  // removeEntry(Todo entry) {
  //   entryRepository.removeTodo(entry);
  //   ref.refresh(entriesProvider);
  // }
}

// Logger

class LoggerRiverpod extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    print(' provider : $provider,  previousValue : $previousValue,  newValue : $newValue,  container : $container');
  }
}
