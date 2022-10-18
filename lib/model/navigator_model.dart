import 'package:flutter/material.dart';

class NavigationModel {
  String title;
  IconData icon;

  NavigationModel({required this.title, required this.icon});
}

List<NavigationModel> navigators = [
  NavigationModel(title: 'Dashboard', icon: Icons.insert_chart),
];
