import 'package:SidebarScrolling/common/Collapsing_ListTitle.dart';
import 'package:SidebarScrolling/model/navigator_model.dart';
import 'package:flutter/material.dart';

class CollapsingNavigatorSidebar extends StatefulWidget {
  const CollapsingNavigatorSidebar({super.key});

  @override
  State<CollapsingNavigatorSidebar> createState() =>
      _CollapsingNavigatorSidebarState();
}

class _CollapsingNavigatorSidebarState
    extends State<CollapsingNavigatorSidebar> {
  @override
  Widget build(BuildContext context) {
    double maxWidth = 250.0;
    double minWidth = 70.0;
    return Container(
      width: 250.0,
      color: Colors.black,
      child: Column(
        children: [
          ListView.builder(
            itemBuilder: (BuildContext context, counter) {
              return CollapsingListTitle(
                title: navigationItems[counter].title,
                icon: navigationItems[counter].icon,
              );
            },
          ),
        ],
      ),
    );
  }
}
