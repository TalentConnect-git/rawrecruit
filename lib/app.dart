import 'package:flutter/material.dart';
import 'package:rawrecruit/src/common/theme/theme_controller.dart';
import 'package:rawrecruit/src/core/index.dart';

import 'src/common/index.dart'; // adjust path

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final deeplinkService = getIt<DeepLinkService>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      deeplinkService.init();
    });
  }

  @override
  void dispose() {
    super.dispose();
    deeplinkService.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: ThemeController.instance,
      builder: (context, child) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          routerConfig: appRouter,
          theme: Theme.of(context).copyWith(
            scaffoldBackgroundColor: AppColors.kBg, // now dynamic
          ),
          builder: (context, child) {
            return Overlay(
              key: getIt<NavigationRepository>().overlayKey,
              initialEntries: [OverlayEntry(builder: (context) => child!)],
            );
          },
        );
      },
    );
  }
}
