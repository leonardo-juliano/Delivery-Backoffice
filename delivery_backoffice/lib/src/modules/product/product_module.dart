import 'package:flutter_modular/flutter_modular.dart';

import '../../repositories/products/product_repository_impl.dart';
import 'home/product_page.dart';

class ProductModule extends Module {

   @override
   List<Bind> get binds => [
    Bind.lazySingleton((i) => ProductRepositoryImpl(i()))
   ];

   @override
   List<ModularRoute> get routes => [
      ChildRoute('/', child: (context, args) => ProductPage())
   ];

}