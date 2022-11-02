import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_sidebar_practice/page/AccountsPage.dart';
import 'package:flutter_sidebar_practice/page/Home.dart';
import 'package:flutter_sidebar_practice/page/OrderPage.dart';

enum NavigationEvent {
  HomePageClickedEvent,
  MyAcountClickedEvent,
  MyOrdersClockedEvent,
}

abstract class NavigationState {}

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  @override
  NavigationBloc(super.initialState);

  @override
  Stream<NavigationState> mapEventToState(NavigationEvent event) async* {
    switch (event) {
      case NavigationEvent.HomePageClickedEvent:
        yield HomePage();
        break;
      case NavigationEvent.MyAcountClickedEvent:
        yield AccountsPage();
        break;
      case NavigationEvent.MyOrdersClockedEvent:
        yield OrderPage();
        break;
    }
  }
}
