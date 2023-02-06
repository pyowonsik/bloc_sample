import 'package:flutter/material.dart';

// import 'package:blocs/bloc_example/screen/home.dart' as bloc_example;
// import 'package:blocs/flutter_bloc/screen/home.dart' as flutter_bloc;
// import 'package:blocs/formz/screen/home.dart' as formz;
import 'package:blocs/src/pages/bloc_provider_page.dart' as bloc_provider_page;

class Route {
  final String name;
  final Widget page;

  Route({
    required this.name,
    required this.page,
  });
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final routes = [
    // Route(name: 'bloc_example', page: bloc_example.HomeScreen()),
    // Route(name: 'flutter_bloc', page: flutter_bloc.HomeScreen()),
    // Route(name: 'formz', page: formz.HomeScreen()),
    // Route(name: 'bloc_provider_page', page:bloc_provider_page.BlocProviderPage),
  ];

  renderRoute({
    required Route route,
  }) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => route.page,
          ),
        );
      },
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          children: [
            Text(
              route.name,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  renderRoutes() {
    return ListView.separated(
      separatorBuilder: (_, index) {
        return Container(
          height: 1.0,
          color: Colors.grey[300],
        );
      },
      itemCount: routes.length,
      itemBuilder: (_, index) {
        return renderRoute(
          route: routes[index],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BLoC Codes'),
      ),
      body: renderRoutes(),
    );
  }
}
