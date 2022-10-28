import 'package:flutter/material.dart';

class NavigationModel {
  String title;
  IconData icon;

  NavigationModel({required this.title, required this.icon});
}

List<NavigationModel> navigationItems = [
  NavigationModel(title: 'Dashboard', icon: Icons.insert_chart),
  NavigationModel(title: 'Errors', icon: Icons.error),
  NavigationModel(title: 'Search', icon: Icons.search),
  NavigationModel(title: 'Notification', icon: Icons.notification_important),
  NavigationModel(title: 'Settings', icon: Icons.settings),
];
