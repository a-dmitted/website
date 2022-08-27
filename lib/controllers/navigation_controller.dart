import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:website/models/welcome_page_model.dart';
import 'package:website/views/welcome_page.dart';

class NavigationController extends RouteState {
  Widget renderApp() {
    Widget toBeRendered;

    if (_route.location == '/') {
      toBeRendered = ChangeNotifierProvider(
        create: (context) => WelcomePageModel(go),
        child: const WelcomePage(title: 'Alexander Dmitriev Home Page'),
      );
    } else if (_route.location == '/main') {
      toBeRendered = Container(
        color: Colors.green,
      );
    } else {
      toBeRendered = Container();
    }

    return Navigator(
        onPopPage: (route, dynamic result) => route.didPop(result),
        pages: [MaterialPage(child: toBeRendered)]);
  }
}

class RouteState with ChangeNotifier {
  RouteState() : _route = const RouteInformation(location: '/');
  RouteInformation _route;
  RouteInformation get route => _route;

  set route(RouteInformation route) {
    // Don't notify listeners if the path hasn't changed.
    if (_route.location == route.location) return;
    _route = route;
    notifyListeners();
  }

  void go(RouteInformation routeInformation) =>  route = routeInformation;
  
}
