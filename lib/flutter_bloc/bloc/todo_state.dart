import 'package:blocs/flutter_bloc/model/todo.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

// 상태 정의

@immutable
abstract class TodoState extends Equatable{} 
// 상태가 여러개 이기 때문에 Eqautable을 상속받는 TodoState 추상 클래스르 생성


class Empty extends TodoState{
  @override
  List<Object?> get props => [];
}


class Loading extends TodoState{
  @override
  List<Object> get props => [];
}

class Error extends TodoState{

  final String message;

  Error({
    required this.message,
  });
  @override
  List<Object> get props => [this.message];
}

class Loaded extends TodoState{
  
  final List<Todo> todos;

  Loaded({
    required this.todos,
  });
  @override
  List<Object> get props => [this.todos];
}
