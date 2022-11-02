import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sidebar_practice/navigator/navigator.dart';
import 'package:flutter_sidebar_practice/page/Home.dart';
import 'package:flutter_sidebar_practice/sidebar/Sidebar.dart';

class SidebarLayout extends StatelessWidget {
  const SidebarLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<NavigationBloc>(
        create: (BuildContext context) => NavigationBloc(const HomePage()),
        child: Stack(
          children: [
            BlocBuilder<NavigationBloc, NavigationState>(
              builder: (context, navigationState) {
                return navigationState as Widget;
              },
            ),
            const SideBar(),
          ],
        ),
      ),
    );
  }
}
