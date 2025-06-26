import 'config_base.dart';

class DevEnv extends BaseConfig {
  @override
  String get appName => 'SpaceCode App';

  @override
  String get serviceUrl => 'http://localhost';
}
