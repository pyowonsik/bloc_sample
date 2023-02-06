import 'package:blocs/src/bloc/sample_second_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SampleSecondsBloc extends Bloc<SampleSecondEvent, int> {
  SampleSecondsBloc() : super(0) {
    on<SampleSecondEvent>(((event, emit) {
      print('Sample Seconds Event Called');
    }));
  }
}
