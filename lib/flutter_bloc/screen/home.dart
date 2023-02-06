import 'package:blocs/flutter_bloc/bloc/todo_bloc.dart';
import 'package:blocs/flutter_bloc/bloc/todo_event.dart';
import 'package:blocs/flutter_bloc/bloc/todo_state.dart';
import 'package:blocs/flutter_bloc/model/todo.dart';

import 'package:blocs/flutter_bloc/repository/todo_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
   const HomeScreen({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoBloc(repository: TodoRepository()),
      child: HomeWidget(),
    );
  }
}

class HomeWidget extends StatefulWidget {
  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  String title = '';

  @override
  void initState() {
    super.initState();
    BlocProvider.of<TodoBloc>(context).add(ListTodosEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Bloc')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // context.read<TodoBloc>().add(
          //       CreateTodoEvent(title: this.title),
          //     );
        },
        child: Icon(Icons.edit),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              onChanged: (val) {
                this.title = val;
              },
            ),
            SizedBox(
              height: 16.0,
            ),
            Expanded(
              child: BlocBuilder<TodoBloc, TodoState>(
                builder: (context, state) {
                  if (state is Empty) {
                    return Container();
                  } else if (state is Error) {
                    return Container(
                      child: Text(state.message),
                    );
                  } else if (state is Loading) {
                    Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (state is Loaded) {
                    final items = state.todos;
                    return ListView.separated(
                        itemBuilder: (_, index) {
                          final item = items[index];
                          return Row(
                            children: [
                              Expanded(
                                child: Text(item.title),
                              ),
                              GestureDetector(
                                onTap: () {
                                  // BlocProvider.of<TodoBloc>(context).add(DeleteTodoEvent(todo: item));
                                },
                                child: Icon(Icons.delete),
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (_, index) => Divider(),
                        itemCount: items.length);
                  }

                  return Container();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
