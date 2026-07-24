import 'package:rawrecruit/bootstrap.dart';

class ApiConfig {
  ApiConfig(this.baseUrl);

  final String baseUrl;
}

ApiConfig getApiConfig(Flavor flavor) {
  final String baseUrl;
  switch (flavor) {
    case Flavor.stage:
      baseUrl = 'https://api.rawrecruit.in/';
    case Flavor.prod:
      baseUrl = 'https://api.rawrecruit.in/';
    case Flavor.debug:
      baseUrl = 'http://localhost:5173/';
  }
  return ApiConfig(baseUrl);
}
