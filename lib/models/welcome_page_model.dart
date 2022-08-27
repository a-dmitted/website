import 'package:flutter/widgets.dart';

class WelcomePageModel with ChangeNotifier {
  String newRoute = '/main';

  WelcomePageModel(this._go);
  final void Function(RouteInformation routeInformation) _go;

  void go() =>  _go(RouteInformation(location: newRoute));  
}
