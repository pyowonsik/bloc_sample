import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';


@immutable
abstract class TodoState extends Equatable{}

class Empty extends TodoState{
  @override
  List<Object?> get props => [];
}