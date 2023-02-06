import 'package:blocs/flutter_bloc/bloc/todo_event.dart';
import 'package:blocs/flutter_bloc/bloc/todo_state.dart';
import 'package:blocs/flutter_bloc/model/todo.dart';

import 'package:blocs/flutter_bloc/repository/todo_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Stream을 사용해 Event를 State로 변경하는 곳
// 구현
class TodoBloc extends Bloc<TodoEvent, TodoState> {
  // 의존성 주입
  final TodoRepository repository;

  // 기본 State (초기화)
  TodoBloc({
    required this.repository,
  }) : super(Empty());

  // stream -> async* , yield -> stream 의 반환값
  @override
  Stream<TodoState> mapEventToState(TodoEvent event) async* {
    if (event is ListTodosEvent) {
      yield* _mapListToEvent(event);
    } else if (event is CreateTodoEvent) {
      yield* _mapCreateToEvent(event);
    } else if (event is DeleteTodoEvent) {
      yield* _mapDeleteToEvent(event);
    }
  }

  Stream<TodoState> _mapListToEvent(ListTodosEvent event) async* {
    try {
      yield Loading();
      final resp = await this.repository.listTodo();
      final todos = resp
          .map<Todo>(
            (e) => Todo.fromJson(e),
          )
          .toList();
      yield Loaded(todos: todos);
    } catch (e) {
      yield Error(message: e.toString());
    }
  }

  Stream<TodoState> _mapCreateToEvent(CreateTodoEvent event) async* {
    try {
      if (state is Loaded) {
        final parsedState = (state as Loaded);
        final newTodo = Todo(
          id: parsedState.todos[parsedState.todos.length - 1].id + 1,
          title: event.title,
          createdAt: DateTime.now().toString(),
        );

        final prevTodos = [
          ...parsedState.todos,
        ];
        final newTodos = [
          newTodo,
          ...prevTodos,
        ];

        yield Loaded(todos: newTodos);
        final resp = await this.repository.createTodo(newTodo);
        yield Loaded(todos: [Todo.fromJson(resp), ...prevTodos]);
      }
    } catch (e) {
      yield Error(message: e.toString());
    }
  }

  Stream<TodoState> _mapDeleteToEvent(DeleteTodoEvent event) async* {
    try {
      if (state is Loaded) {
        final newTodos = (state as Loaded)
            .todos
            .where((todo) => todo.id != event.todo.id)
            .toList();

        yield Loaded(todos: newTodos);
        await repository.deleteTodo(event.todo);
      }
    } catch (e) {
      yield Error(message: e.toString());
    }
  }
}
