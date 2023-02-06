import 'package:blocs/src/pages/bloc_builder_page.dart';
import 'package:blocs/src/pages/bloc_provider_page.dart';
import 'package:blocs/src/pages/bloc_selector_page.dart';
import 'package:blocs/src/pages/multi_bloc_provider_page.dart';
import 'package:blocs/src/pages/repository_provider_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => BlocProviderPage()),
              );
            },
            child: const Text('Bloc Provider Page'),
          ),
          Container(
            margin: EdgeInsets.all(10),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => MultiBlocProvierPage()),
              );
            },
            child: const Text('Multi Bloc Provider Page'),
          ),
          Container(
            margin: EdgeInsets.all(10),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => BlocBuilderPage()),
              );
            },
            child: const Text('Bloc Builder Page'),
          ),
          Container(
            margin: EdgeInsets.all(10),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => RepositoryProviderPage()),
              );
            },
            child: const Text('Repository Provider Page'),
          ),
           Container(
            margin: EdgeInsets.all(10),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => BlocSelectorPage()),
              );
            },
            child: const Text('Bloc Selector Bloc Page'),
          ),
        ]),
      ),
    );
  }
}
