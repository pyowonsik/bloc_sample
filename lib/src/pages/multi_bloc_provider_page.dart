
import 'package:blocs/src/bloc/sample_bloc.dart';
import 'package:blocs/src/bloc/sample_event.dart';
import 'package:blocs/src/bloc/sample_second_bloc.dart';
import 'package:blocs/src/bloc/sample_second_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MultiBlocProvierPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: ((context) => SampleBloc())),
      BlocProvider(create: ((context) => SampleSecondsBloc())),
    ],
    child: SamplePage(),);
  }
}




class SamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Center(
              child: Text('Bloc Provider Sample'),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      context.read<SampleBloc>().add(SampleEvent());
                    },
                    child: Text('+')),
                const SizedBox(width: 15),
                ElevatedButton(
                    onPressed: () {
                      context
                          .read<SampleSecondsBloc>()
                          .add(SampleSecondEvent());
                    },
                    child: Text('-')),
              ],
            )
          ],
        ),
      ),
    );
  }
}


