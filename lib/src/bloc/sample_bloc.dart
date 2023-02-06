import 'package:blocs/src/bloc/sample_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Event 구현
class SampleBloc extends Bloc<SampleEvent,int>{
  
  SampleBloc():super(0){
    print('init Samplebloc');

    on<SampleEvent>((event,emit){
      print('Sample Event Called');
    });

    on<AddSampleEvent>((event,emit){
      emit(state + 1);
    });

    on<RemoveSampleEvent>((event,emit){
      emit(state - 1);
    });
    
  }
}