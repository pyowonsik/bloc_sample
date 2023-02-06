import 'package:blocs/src/bloc/sample_bloc.dart';
import 'package:blocs/src/bloc/sample_event.dart';
import 'package:blocs/src/pages/bloc_provider_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocBuilderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SampleBloc(),
      child: SamplePage(),
    );
  }
}

class SamplePage extends StatelessWidget {
  late SampleBloc sampleBloc;

  void _showMessage(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            title: const Text('Title'),
            content: BlocBuilder<SampleBloc, int>(
              bloc: sampleBloc,
              builder: (context, state) {
                return Text(state.toString());
              },
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('확인')),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    sampleBloc = context.read<SampleBloc>();
    return Scaffold(
        body: Center(
          child: BlocBuilder<SampleBloc, int>(
            buildWhen: (prev, cur) {
              return cur > 10; // cur이 10보다 커지면 적용
            },
            builder: (context, state) {
              return Text(
                'index : $state',
                style: TextStyle(fontSize: 70),
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton(onPressed: () {
          // context.read<SampleBloc>().add(AddSampleEvent());
          _showMessage(context);
        }));
  }
}
