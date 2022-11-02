import 'package:flutter/material.dart';
import 'package:flutter_sidebar_practice/navigator/navigator.dart';

class OrderPage extends StatelessWidget with NavigationState {
  const OrderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Orders Page"),
    );
  }
}
