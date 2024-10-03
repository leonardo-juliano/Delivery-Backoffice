import 'package:flutter_modular/flutter_modular.dart';

import 'home/product_page.dart';

class ProductModule extends Module {

   @override
   List<Bind> get binds => [];

   @override
   List<ModularRoute> get routes => [
      ChildRoute('/', child: (context, args) => ProductPage())
   ];

}