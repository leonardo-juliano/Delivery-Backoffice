import 'package:mobx/mobx.dart';
part 'products_controller.g.dart';

enum ProductState {
  initial,
  loading,
  loaded,
  error
}

class ProductsController = ProductsControllerBase with _$ProductsController;

abstract class ProductsControllerBase with Store {

}