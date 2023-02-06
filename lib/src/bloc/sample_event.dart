import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
class SampleEvent extends Equatable{
  List<Object> get props =>[];
}
class AddSampleEvent extends SampleEvent{}
class RemoveSampleEvent extends SampleEvent{}