import 'package:flutter_modular/flutter_modular.dart';
import './modules/home/home_page.dart';
import 'modules/core/core_module.dart';
import 'modules/login/login_module.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [CoreModule()];

  // fluterr modular na ultima versao
  // @override
  // void routes(r) {
  //   r.module(
  //     '/login/',
  //     module: LoginModule(),
  //   );
  //   r.child('/', child: (context) => const HomePage());
  // }

  List<ModularRoute> get routes => [
        ModuleRoute('/login', module: LoginModule()),
        ChildRoute('/home', child: (context, args) => const HomePage()),
      ];
}
