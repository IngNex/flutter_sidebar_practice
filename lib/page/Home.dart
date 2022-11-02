import 'package:flutter/material.dart';
import 'package:flutter_sidebar_practice/navigator/navigator.dart';

class HomePage extends StatelessWidget with NavigationState {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Home Page"),
    );
  }
}
