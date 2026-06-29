import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:provider/provider.dart';
import 'package:rawrecruit/src/config/index.dart'
    show getApiConfig, FlavorConfig, initializeFirebaseApp;
import 'package:rawrecruit/src/core/index.dart'
    show
        initDependencyLocator,
        getIt,
        NotificationService,
        AppStateProvider,
        NotificationProvider,
        ChatProvider;
import 'package:rawrecruit/src/core/provider/interview_provider.dart';
import 'package:rawrecruit/src/core/services/shared_pref_helper.dart';

import 'app.dart';

enum Flavor { debug, stage, prod }

Future<void> bootstrap(Flavor flavor) async {
  WidgetsFlutterBinding.ensureInitialized();
  await _preInit(flavor);
  await _init(flavor);

  await FlutterDownloader.initialize(debug: kDebugMode, ignoreSsl: true);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AppStateProvider>(create: (_) => getIt()),
        ChangeNotifierProvider<NotificationProvider>(create: (_) => getIt()),
        ChangeNotifierProvider<InterviewProvider>(create: (_) => getIt()),
        ChangeNotifierProvider<ChatProvider>(create: (_) => getIt()),
      ],
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

  await initDependencyLocator();
  await getIt.allReady();
}
