import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/config/index.dart'
    show getApiConfig, FlavorConfig, initializeFirebaseApp;
import 'package:rawrecruit/src/core/index.dart'
    show initDependencyLocator, getIt, NotificationService, AppStateProvider;
import 'package:rawrecruit/src/core/services/shared_pref_helper.dart';

import 'app.dart';

enum Flavor { debug, stage, prod }

Future<void> bootstrap(Flavor flavor) async {
  WidgetsFlutterBinding.ensureInitialized();
  await _preInit(flavor);
  await _init(flavor);

  runApp(
    MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AppStateProvider())],
      child: const App(),
    ),
  );
}

Future<void> _init(Flavor flavor) async {
  final apiConfig = getApiConfig(flavor);

  FlavorConfig(flavor: flavor, baseMobileUrl: apiConfig.baseUrl);
}

Future<void> _preInit(Flavor flavor) async {
  await initializeFirebaseApp(flavor);
  await SharedPrefHelper.init();
  await NotificationService().init();

  try {
    await GoogleSignIn.instance.initialize(
      serverClientId:
          '766071065020-de5f0sr7tvfb11lnv3psqbgg1o8es2i0.apps.googleusercontent.com',
    );
  } catch (_) {
    // Already initialized or unsupported platform — safe to ignore
  }

  await initDependencyLocator();
  await getIt.allReady();
}
