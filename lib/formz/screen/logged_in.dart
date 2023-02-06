import 'package:blocs/layouts/default_layout.dart';
import 'package:flutter/material.dart';

class LoggedInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      body: Center(
        child: Text('로그인 완료'),
      ),
    );
  }
}
