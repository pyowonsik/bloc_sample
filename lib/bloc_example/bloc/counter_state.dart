import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class CounterState {
  final int count;

  CounterState({required this.count});

  // 초기화
  factory CounterState.empty() {
    return CounterState(count: 0);
  }

  CounterState update({
    int? count,
  }) {
    return copyWith(count: count);
  }

  CounterState copyWith({
    int? count,
  }) {
    return CounterState(count: count ?? this.count);
  }
}
