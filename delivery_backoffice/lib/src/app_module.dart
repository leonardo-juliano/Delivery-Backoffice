import 'package:flutter_modular/flutter_modular.dart';
import './modules/home/home_page.dart';
import 'modules/login/login_module.dart';

class AppModule extends Module {
  @override
  void routes(r) {
    r.child('/', child: (context) => const HomePage());
    r.module('/login',  module: LoginModule(),);
  }
}
