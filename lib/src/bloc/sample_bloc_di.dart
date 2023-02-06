import 'package:blocs/src/bloc/sample_bloc_di_event.dart';
import 'package:blocs/src/repository/repository_sample.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SampleBlocDI extends Bloc<SampleDIEvent, int> {

  final RepositorySample _repositorySample;

  // 초기화 동시에 이벤트 구현
  SampleBlocDI(this._repositorySample) : super(0) {
    

    // Stream mapEventToState가 바뀜
    on<SampleDIEvent>((event, emit) {
      print('Sample DI Event');
    });
    
    on<ChangeNumber>((event,emit) async{
        var data = await _repositorySample.load();
        emit(data);
        print(_repositorySample.name);
   
    });
  }

}
