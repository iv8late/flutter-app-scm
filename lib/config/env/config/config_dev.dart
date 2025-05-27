
import 'config_base.dart';

class DevEnv extends BaseConfig {
  @override
  String get appName => 'Promarisco App';

  @override
   String get serviceUrl => 'http://172.16.10.198:3005';
  // String get serviceUrl => 'http://10.10.80.35:3000';
}  


