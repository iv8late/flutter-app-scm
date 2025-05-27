
import 'config_base.dart';

class QaEnv extends BaseConfig {
  @override
  String get appName => 'Promarisco App';

//url del backedn si es localhost, la ip de la pc
  @override
   String get serviceUrl => 'http://172.16.10.198:3005';
}  


