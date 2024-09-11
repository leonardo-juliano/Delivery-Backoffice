import 'package:flutter_modular/flutter_modular.dart';

import '../../core/services/auth/login_service.dart';
import '../../core/services/auth/login_service_impl.dart';
import '../../repositories/auth/auth_repository.dart';
import '../../repositories/auth/auth_repository_impl.dart';

import 'login_controller.dart';
import 'login_page.dart';

class LoginModule extends Module {
  // @override
  // void binds(i) {
  //   i.addLazySingleton<AuthRepository>((i) => AuthRepositoryImpl(i()));
  //   i.addLazySingleton<LoginService>((i) => LoginServiceImpl(i(), i()));
  //   i.addLazySingleton((i) => LoginController(i()));
  // }

  // @override
  // void routes(r) {
  //   r.child('/login/', child: (context) => const LoginPage());
  // }

  @override
  List<Bind> get binds => [
        Bind.lazySingleton<AuthRepository>((i) => AuthRepositoryImpl(i())),
        Bind.lazySingleton<LoginService>((i) => LoginServiceImpl(i(), i())),
        Bind.lazySingleton((i) => LoginController(i())),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute('/', child: (context, args) => const LoginPage()),
      ];
}
