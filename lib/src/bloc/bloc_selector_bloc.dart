import 'package:blocs/src/bloc/bloc_selector_event.dart';
import 'package:blocs/src/bloc/bloc_selector_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocSelectorBloc extends Bloc<BlocSelectorEvent, BlocSelectorState> {
  
  // 초기화 생성자 
  BlocSelectorBloc() : super(BlocSelectorState()) {
    on<ChangeStateEvent>((event, emit) {
      emit(state.clone(changeState: !state.changeState));
    });
    on<ValueEvent>((event, emit) {
      emit(state.clone(value: state.value + 1));
    });
  }
}
