import 'package:blocs/flutter_bloc/model/todo.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

// 함수 정의
@immutable
abstract class TodoEvent extends Equatable{}


class ListTodosEvent extends TodoEvent{

  @override
  List<Object> get props => [];
}

class CreateTodoEvent extends TodoEvent{
  
  final String title;

  CreateTodoEvent({
    required this.title,
  });

  @override
  List<Object> get props => [this.title];
}



class DeleteTodoEvent extends TodoEvent{

  final Todo todo;

  DeleteTodoEvent({
    required this.todo,
  });

  @override
  List<Object> get props => [this.todo];
}