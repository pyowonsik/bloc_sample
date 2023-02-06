import 'package:blocs/src/bloc/bloc_selector_bloc.dart';
import 'package:blocs/src/bloc/bloc_selector_event.dart';
import 'package:blocs/src/bloc/bloc_selector_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocSelectorPage extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return BlocProvider(
      create: (context) => BlocSelectorBloc(),
      child: SamplePage(),
    );
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
            BlocSelector<BlocSelectorBloc, BlocSelectorState, bool>(
              selector: (state) => state.changeState,
              builder: (context, state) {
                print('selector builder');
                return Icon(
                  Icons.favorite,
                  color: state ? Colors.red : Colors.grey,
                  size: 50,
                );
              },
            ),
            BlocBuilder<BlocSelectorBloc, BlocSelectorState>(
              buildWhen: (previous, current) => current.changeState,
              builder: (context, state) {
                print('bloc builder');
                return Text(
                  state.value.toString(),
                  style: const TextStyle(fontSize: 70),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () {
                      context.read<BlocSelectorBloc>().add(ChangeStateEvent());
                    },
                    child: Text('상태변경')),
                const SizedBox(width: 15),
                ElevatedButton(
                    onPressed: () {
                      context.read<BlocSelectorBloc>().add(ValueEvent());
                    },
                    child: Text('더하기')),
              ],
            )
          ],
        ),
      ),
    );
  }
}

