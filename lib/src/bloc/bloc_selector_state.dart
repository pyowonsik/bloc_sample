import 'package:equatable/equatable.dart';
class BlocSelectorState extends Equatable {
  final bool changeState;
  final int value;
  BlocSelectorState({this.changeState = false, this.value = 0});

  BlocSelectorState clone({
    bool? changeState,
    int? value,
  }) {
    return BlocSelectorState(
      changeState: changeState ?? this.changeState,
      value: value ?? this.value,
    );
  }

  @override
  List<Object?> get props => [value, changeState];
}