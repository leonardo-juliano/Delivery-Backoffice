import 'package:flutter_modular/flutter_modular.dart';

import '../../core/rest_client/custom_dio.dart';
import '../../core/storage/session_storage.dart';
import '../../core/storage/storage.dart';

class CoreModule extends Module {

    @override
    void binds(i){
      i.addLazySingleton<Storage>((i) => SessionStorage());
      i.addLazySingleton((i) => CustomDio());
    }

}