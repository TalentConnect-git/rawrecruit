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

String getClientId(Flavor flavor) {
  switch (flavor) {
    case Flavor.debug:
      return '532797617580-lleoeg9msbvvcrc2r531frjpt4c09m6o.apps.googleusercontent.com';
    case Flavor.stage:
      return '532797617580-i9hgsk8e8enqamor42ej1ilblj9d2cih.apps.googleusercontent.com';
    case Flavor.prod:
      return '532797617580-0f9j069f885m9r3p2i04fg7c7ebp8el5.apps.googleusercontent.com';
  }
}

String getServerClientId(Flavor flavor) {
  switch (flavor) {
    case Flavor.debug:
      return '601694030048-4s6c5pb7lti0gu1g5p8fjanv4mfvd8bi.apps.googleusercontent.com';
    case Flavor.stage:
      return '601694030048-4s6c5pb7lti0gu1g5p8fjanv4mfvd8bi.apps.googleusercontent.com';
    case Flavor.prod:
      return '601694030048-4s6c5pb7lti0gu1g5p8fjanv4mfvd8bi.apps.googleusercontent.com';
  }
}
