import 'package:flutter_modular/flutter_modular.dart';

import 'login_page.dart';

class LoginModule extends Module {

  @override
  void routes(r) {
    r.child('/', child: (context) => const LoginPage());
  }
}