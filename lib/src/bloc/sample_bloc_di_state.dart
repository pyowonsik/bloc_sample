import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class SampleDIState extends Equatable{
  final String? cid;
  final String? title;
  final String? description;
  final bool? isLiked;
  
  const SampleDIState({
    this.cid,
    this.title,
    this.description,
    this.isLiked,
  });
  @override
  List<Object> get props =>[];
}