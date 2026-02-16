import 'package:firebase_core/firebase_core.dart';
import 'package:rawrecruit/bootstrap.dart' show Flavor;
import 'package:rawrecruit/firebase_options_debug.dart' as debug;
import 'package:rawrecruit/firebase_options_prod.dart' as prod;
import 'package:rawrecruit/firebase_options_stage.dart' as stage;

Future<void> initializeFirebaseApp(Flavor flavor) async {
  final firebaseOptions = switch (flavor) {
    Flavor.prod => prod.DefaultFirebaseOptions.currentPlatform,
    Flavor.stage => stage.DefaultFirebaseOptions.currentPlatform,
    Flavor.debug => debug.DefaultFirebaseOptions.currentPlatform,
  };
  await Firebase.initializeApp(options: firebaseOptions);
}
