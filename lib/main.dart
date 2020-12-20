import 'package:flutter/material.dart';
import 'widgets/uni_navbar.dart';
import 'pages/landing.dart';

void main() => runApp(MyApp());

final GlobalKey<UniNavbarState> navbarKey = GlobalKey<UniNavbarState>();
final GlobalKey<NavigatorState> mainKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> mapKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> statisticKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> accountKey = GlobalKey<NavigatorState>();

GlobalKey<NavigatorState> currentNavigatorKey(index) {
  switch (index) {
    case 0:
      return mainKey;
      break;
    case 1:
      return mapKey;
      break;
    case 2:
      return statisticKey;
      break;
    case 3:
      return accountKey;
      break;
  }
  return null;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
    home: Landing()
  );
}