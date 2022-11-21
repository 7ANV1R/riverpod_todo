import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:river_todo/model/todo_model.dart';

final todoListProvider = StateProvider<TodoList>(
  (ref) {
    return TodoList([
      TodoModel(
        id: 'todo-0',
        desc: 'Do this',
      ),
      TodoModel(
        id: 'todo-0',
        desc: 'Do that',
      ),
    ]);
  },
);

final todoListFilterProvider = StateProvider(
  (ref) => TodoListFilter.all,
);
