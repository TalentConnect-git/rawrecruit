import 'package:rawrecruit/bootstrap.dart' show Flavor;

class FlavorConfig {
  factory FlavorConfig({
    required Flavor flavor,
    required String baseMobileUrl,
  }) {
    _instance ??= FlavorConfig._internal(
      flavor: flavor,
      baseMobileUrl: baseMobileUrl,
    );
    return _instance!;
  }

  FlavorConfig._internal({required this.flavor, required this.baseMobileUrl});

  final Flavor flavor;
  final String baseMobileUrl;

  static FlavorConfig? _instance;

  static FlavorConfig get instance {
    if (_instance == null) {
      throw Exception(
        'FlavorConfig should be initialized in main before instance is retrieved',
      );
    }
    return _instance!;
  }

  static bool isStaging() => instance.flavor == Flavor.stage;

  static bool isProduction() => instance.flavor == Flavor.prod;
}
