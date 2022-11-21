// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

var _uuid = const Uuid();

enum TodoListFilter {
  all,
  active,
  completed,
}

class TodoModel {
  final String id;
  final String desc;
  final bool isCompleted;

  TodoModel({
    String? id,
    required this.desc,
    this.isCompleted = false,
  }) : id = id ?? _uuid.v4();

  @override
  String toString() => 'TodoModel(id: $id, desc: $desc, isCompleted: $isCompleted)';
}

class TodoList extends StateNotifier<List<TodoModel>> {
  TodoList([List<TodoModel>? initialTodos]) : super(initialTodos ?? []);

  void addTodo(String desc) {
    state = [
      ...state,
      TodoModel(desc: desc),
    ];
  }

  void toggleComplete(String id) {
    state = [
      for (final todo in state)
        if (todo.id == id)
          TodoModel(
            id: todo.id,
            desc: todo.desc,
            isCompleted: !todo.isCompleted,
          )
        else
          todo,
    ];
  }

  void editTodo({required String id, required String desc}) {
    state = [
      for (final todo in state)
        if (todo.id == id)
          TodoModel(
            id: todo.id,
            desc: desc,
            isCompleted: todo.isCompleted,
          )
        else
          todo,
    ];
  }

  void remove(TodoModel target) {
    state = state.where((element) => element.id != target.id).toList();
  }
}
