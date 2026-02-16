import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:rawrecruit/firebase_options_prod.dart' as prod;
import 'package:rawrecruit/firebase_options_stage.dart' as stage;

enum Flavor { stage, prod }

Future<void> bootstrap(Flavor flavor) async {
  WidgetsFlutterBinding.ensureInitialized();
  await _init(flavor);
}

Future<void> _init(Flavor flavor) async {
  try {
    await Firebase.initializeApp(
      options: flavor == Flavor.stage
          ? stage.DefaultFirebaseOptions.currentPlatform
          : prod.DefaultFirebaseOptions.currentPlatform,
    );
  } finally {
    // Initialize other dependencies here if needed
  }
}
