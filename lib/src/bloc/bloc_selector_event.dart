

import 'package:equatable/equatable.dart';

abstract class BlocSelectorEvent extends Equatable{
  @override
  List<Object> get props => [];
}

class ChangeStateEvent extends BlocSelectorEvent{}
class ValueEvent extends BlocSelectorEvent{}


