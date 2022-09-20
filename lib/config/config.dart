import 'package:delivery_app_supplier/config/interface/i_config.dart';

class Config implements IConfig {
  @override
  get basePath {
    return 'http://ec2-35-89-95-21.us-west-2.compute.amazonaws.com';
  }
}
