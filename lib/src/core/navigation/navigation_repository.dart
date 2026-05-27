import 'package:flutter/cupertino.dart';

class NavigationRepository {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final GlobalKey<OverlayState> overlayKey = GlobalKey<OverlayState>();

  final GlobalKey<NavigatorState> shellNavigatorAKey =
      GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> shellNavigatorBKey =
      GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> shellNavigatorCKey =
      GlobalKey<NavigatorState>();
  final GlobalKey<NavigatorState> shellNavigatorDKey =
      GlobalKey<NavigatorState>();

  BuildContext? get context => navigatorKey.currentContext;
}
