import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:website/controllers/navigation_controller.dart';
import 'package:website/routing/route_information_parser.dart';
import 'package:website/routing/router_delegate.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final NavigationController _navigationController;
  late final SimpleRouterDelegate _simpleRouterDelegate;

  @override
  void initState() {
    _navigationController = NavigationController();

    _simpleRouterDelegate = SimpleRouterDelegate(
        navigationController: _navigationController,
        builder: (BuildContext context) => _navigationController.renderApp());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => _navigationController)
        ],
        child: MaterialApp.router(
          routerDelegate: _simpleRouterDelegate,
          routeInformationParser: SimpleRouteInformationParser(),
          theme: ThemeData(
              primarySwatch: Colors.blue,
              scaffoldBackgroundColor: Colors.blue,
              textTheme: const TextTheme(
                headline1: TextStyle(
                    fontSize: 72.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              )),
        ));
  }
}
