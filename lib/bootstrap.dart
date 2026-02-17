import 'package:flutter/material.dart';
import 'package:rawrecruit/src/config/index.dart'
    show getApiConfig, FlavorConfig, initializeFirebaseApp;
import 'package:rawrecruit/src/core/index.dart'
    show initDependencyLocator, getIt;

import 'app.dart';

enum Flavor { debug, stage, prod }

Future<void> bootstrap(Flavor flavor) async {
  WidgetsFlutterBinding.ensureInitialized();
  await _preInit(flavor);
  await _init(flavor);

  runApp(const App());
}

Future<void> _init(Flavor flavor) async {
  final apiConfig = getApiConfig(flavor);

  FlavorConfig(flavor: flavor, baseMobileUrl: apiConfig.baseUrl);
}

Future<void> _preInit(Flavor flavor) async {
  try {
    await initializeFirebaseApp(flavor);
  } finally {
    await initDependencyLocator();
    await getIt.allReady();
  }
}
