import 'config_base.dart';

class QaEnv extends BaseConfig {
  @override
  String get appName => 'SpaceCode App';

  //url del backedn si es localhost, la ip de la pc
  @override
  String get serviceUrl => 'http://localhost:3005';
}
