import 'package:flutter/material.dart';
import 'package:salarlinktree/src/main_view/main_view_screen.dart';

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainView(),
    );
  }
}
