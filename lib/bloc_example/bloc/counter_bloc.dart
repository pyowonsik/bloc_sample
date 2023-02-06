

// import 'package:blocs/src/bloc/counter_event.dart';
// import 'package:blocs/src/bloc/counter_state.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class CounterBloc extends Bloc<CounterEvent,CounterState> {

//   @override
//   CounterState get initialState => CounterState.empty();

//   @override
//   Stream<CounterState> mapEventToState(CounterEvent event) async*{
//     if(event is PageLoded){
//       yield* _mapPageLoadedToState();
//     }else if(event is IncreaseBtnPressed){
//       yield* _mapIncreaseBtnPressedToState();
//     }else if(event is DecreaseBtnPressed){
//       yield* _mapDecreaseBtnPressedToState();
//     }
//   }

//   Stream<CounterState> _mapPageLoadedToState() async*{
//     yield state.update(count:0);
//   }

//   Stream<CounterState> _mapIncreaseBtnPressedToState() async*{
//     yield state.update(count: state.count+1);
//   }

//   Stream<CounterState> _mapDecreaseBtnPressedToState() async*{
//     yield state.update(count: state.count-1);
//   }




// }