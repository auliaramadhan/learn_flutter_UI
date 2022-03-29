import 'package:flutter_ui/state_management/todo/todo_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// 2. Declare this:
part 'todo_state.freezed.dart';

// 3. Annotate the class with @freezed
@freezed
// 4. Declare the class as abstract and add `with _$ClassName`
abstract class TodoListState with _$TodoListState {
  // 5. Create a `const factory` constructor for each valid state
  const factory TodoListState.loaded(List<Todo> todo) = _ListLoaded;
  const factory TodoListState.error(String errorText) = _ListError;
  const factory TodoListState.loading() = _ListLoading;

}

@freezed
abstract class TodoState with _$TodoState {
  const factory TodoState.noError() = _NoError;
  const factory TodoState.error(String errorText) = _Error;
  const factory TodoState.loading() = _Loading;
}
