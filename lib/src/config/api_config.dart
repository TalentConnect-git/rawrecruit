import 'package:rawrecruit/bootstrap.dart';

class ApiConfig {
  ApiConfig(this.baseUrl);

  final String baseUrl;
}

ApiConfig getApiConfig(Flavor flavor) {
  final String baseUrl;
  switch (flavor) {
    case Flavor.stage:
      baseUrl = '';
    case Flavor.prod:
      baseUrl = '';
    case Flavor.debug:
      baseUrl = '';
  }
  return ApiConfig(baseUrl);
}
