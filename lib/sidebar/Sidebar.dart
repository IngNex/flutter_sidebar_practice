import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_sidebar_practice/navigator/navigator.dart';
import 'package:flutter_sidebar_practice/sidebar/menu_item.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SideBar extends StatefulWidget {
  const SideBar({super.key});

  @override
  State<SideBar> createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late StreamController<bool> isSidebarOpenedStreamController;
  late Stream<bool> isSidebarOpenedStream;
  late StreamSink<bool> isSidebarOpenedSink;
  /*final bool isSidebarOpened = false;*/
  final _animationDuration = const Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: _animationDuration);
    isSidebarOpenedStreamController = PublishSubject<bool>();
    isSidebarOpenedStream = isSidebarOpenedStreamController.stream;
    isSidebarOpenedSink = isSidebarOpenedStreamController.sink;
  }

  @override
  void dispose() {
    _animationController.dispose();
    isSidebarOpenedStreamController.close();
    isSidebarOpenedSink.close();
    super.dispose();
  }

  void onIconPressed() {
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;

    if (isAnimationCompleted) {
      isSidebarOpenedSink.add(false);
      _animationController.reverse();
    } else {
      isSidebarOpenedSink.add(true);
      _animationController.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return StreamBuilder<bool>(
      initialData: false,
      stream: isSidebarOpenedStream,
      builder: (context, isSideBarOpenedAsync) {
        return AnimatedPositioned(
          duration: _animationDuration,
          top: 0,
          bottom: 0,
          left: isSideBarOpenedAsync.requireData ? 0 : -screenWidth,
          right: isSideBarOpenedAsync.requireData ? 0 : screenWidth - 45,
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  color: Colors.blue,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      ListTile(
                        title: Text(
                          "Michael",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          "ingnex@gmail.com",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        leading: CircleAvatar(
                          child: Icon(
                            Icons.perm_identity,
                            color: Colors.white,
                          ),
                          radius: 40,
                        ),
                      ),
                      Divider(
                        height: 64,
                        thickness: 0.5,
                        color: Colors.white.withOpacity(0.5),
                        indent: 32,
                        endIndent: 32,
                      ),
                      MenuItems(
                        icon: Icons.home,
                        title: "Home",
                        onTap: () {
                          BlocProvider.of<NavigationBloc>(context)
                              .add(NavigationEvent.HomePageClickedEvent);
                        },
                      ),
                      MenuItems(
                        icon: Icons.person,
                        title: "My Account",
                        onTap: () {
                          BlocProvider.of<NavigationBloc>(context)
                              .add(NavigationEvent.MyAcountClickedEvent);
                        },
                      ),
                      MenuItems(
                        icon: Icons.shopping_basket,
                        title: "My Orders",
                        onTap: () {
                          BlocProvider.of<NavigationBloc>(context)
                              .add(NavigationEvent.MyOrdersClockedEvent);
                        },
                      ),
                      MenuItems(
                        icon: Icons.card_giftcard,
                        title: "Wishlist",
                        onTap: () {
                          BlocProvider.of<NavigationBloc>(context)
                              .add(NavigationEvent.HomePageClickedEvent);
                        },
                      ),
                      Divider(
                        height: 64,
                        thickness: 0.5,
                        color: Colors.white.withOpacity(0.5),
                        indent: 32,
                        endIndent: 32,
                      ),
                      MenuItems(
                        icon: Icons.settings,
                        title: "Settings",
                        onTap: () {
                          BlocProvider.of<NavigationBloc>(context)
                              .add(NavigationEvent.HomePageClickedEvent);
                        },
                      ),
                      MenuItems(
                        icon: Icons.exit_to_app,
                        title: "Logout",
                        onTap: () {
                          BlocProvider.of<NavigationBloc>(context)
                              .add(NavigationEvent.HomePageClickedEvent);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment(0, -0.9),
                child: GestureDetector(
                  onTap: () {
                    onIconPressed();
                  },
                  child: ClipPath(
                    clipper: CustomMenuClipper(),
                    child: Container(
                      width: 35,
                      height: 110,
                      color: Colors.blue,
                      alignment: Alignment.centerLeft,
                      child: AnimatedIcon(
                        progress: _animationController.view,
                        icon: AnimatedIcons.menu_close,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class CustomMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Paint paint = Paint();
    paint.color = Colors.white;

    final width = size.width;
    final height = size.height;

    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width - 1, height / 2 - 20, width, height / 2);

    path.quadraticBezierTo(width + 1, height / 2 + 20, 10, height - 16);
    path.quadraticBezierTo(0, height - 8, 0, height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
