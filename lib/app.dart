import 'package:flutter/material.dart';
import 'package:rawrecruit/src/core/index.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: Theme.of(
        context,
      ).copyWith(scaffoldBackgroundColor: Color(0xfffafafa)),
    );
  }
}
