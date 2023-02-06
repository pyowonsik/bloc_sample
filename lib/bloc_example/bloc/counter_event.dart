import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class CounterEvent extends Equatable {
  List<Object> get props => [];
}

class PageLoded extends CounterEvent{
  @override
  String toString(){
    return 'page loaded';
  }

  
}

class IncreaseBtnPressed extends CounterEvent{
  @override
  String toString(){
    return 'Increasement button pressed';
  }
  
}

class DecreaseBtnPressed extends CounterEvent{
  @override
  String toString(){
    return 'Decreasement button pressed';
  }
}