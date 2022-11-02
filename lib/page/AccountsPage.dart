import 'package:flutter/material.dart';
import 'package:flutter_sidebar_practice/navigator/navigator.dart';

class AccountsPage extends StatelessWidget with NavigationState {
  const AccountsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("AccountsPage"),
    );
  }
}
