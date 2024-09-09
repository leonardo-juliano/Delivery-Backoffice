import 'package:flutter_modular/flutter_modular.dart';
import './modules/home/home_page.dart';
import 'modules/core/core_module.dart';
import 'modules/login/login_module.dart';

class AppModule extends Module {

  @override
  List<Module> get imports => [
    CoreModule()
  ];

  @override
  void routes(r) {
    r.child('/', child: (context) => const HomePage());
    r.module('/login',  module: LoginModule(),);
  }
}
