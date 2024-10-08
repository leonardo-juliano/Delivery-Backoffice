import 'package:flutter_modular/flutter_modular.dart';
import 'modules/core/core_module.dart';
import 'modules/login/login_module.dart';
import 'modules/payment_type/payment_type_module.dart';
import 'modules/product/product_module.dart';
import 'modules/template/base_layout.dart';

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

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/login', module: LoginModule()),
        ChildRoute('/',
            child: (context, args) => const BaseLayout(body: RouterOutlet()),
            transition: TransitionType.noTransition,
            children: [
              ModuleRoute('/payment-type', module: PaymentTypeModule()),
              ModuleRoute('/products', module: ProductModule()),
            ],),
      ];
}
