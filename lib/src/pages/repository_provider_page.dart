
import 'package:blocs/src/bloc/sample_bloc_di.dart';
import 'package:blocs/src/bloc/sample_bloc_di_event.dart';
import 'package:blocs/src/pages/bloc_builder_page.dart';
import 'package:blocs/src/repository/repository_sample.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RepositoryProviderPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => RepositorySample(),
      child: BlocProvider(
        create: (context) => SampleBlocDI(context.read<RepositorySample>()),
        child: SamplePage(),
      ),
    );
  }
}


class SamplePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: BlocBuilder<SampleBlocDI, int>(
          builder: (context, state) => Text(
            state.toString(),
            style: TextStyle(fontSize: 70),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<SampleBlocDI>().add(ChangeNumber());
        },
      ),
    );
  }
}
