import 'package:flutter_modular/flutter_modular.dart';

import '../../core/services/auth/login_service.dart';
import '../../core/services/auth/login_service_impl.dart';
import '../../repositories/auth/auth_repository.dart';
import '../../repositories/auth/auth_repository_impl.dart';
import 'login_controller.dart';
import 'login_page.dart';

class LoginModule extends Module {

  @override
  void binds(i){
    i.addLazySingleton<AuthRepository>((i) => AuthRepositoryImpl(i()));
    i.addLazySingleton<LoginService>((i) => LoginServiceImpl(i(), i()));
    i.addLazySingleton<LoginService>((i) => LoginController(i()));

  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const LoginPage());
  }
}