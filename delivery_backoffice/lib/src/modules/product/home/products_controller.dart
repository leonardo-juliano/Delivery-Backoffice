import 'dart:developer';

import 'package:mobx/mobx.dart';

import '../../../models/product_model.dart';
import '../../../repositories/products/product_repository.dart';
part 'products_controller.g.dart';

enum ProductStateStatus { initial, loading, loaded, error }

class ProductsController = ProductsControllerBase with _$ProductsController;

abstract class ProductsControllerBase with Store {
  final ProductRepository _productRepository;

  ProductsControllerBase(this._productRepository);

  @observable
  var status = ProductStateStatus.initial;

  @observable
  var products = <ProductModel>[];

  @observable
  String? _filterName;

  Future<void> filterByName(String name) async {
    _filterName = name;
    await loadProducts();
  }

  @action
  Future<void> loadProducts() async {
    try {
      status = ProductStateStatus.loading;
      products = await _productRepository.findAll(_filterName);
      status = ProductStateStatus.loaded;
    } on Exception catch (e, s) {
      log('Erro ao buscar produtos', error: e, stackTrace: s);
      status = ProductStateStatus.error;
    }
  }

}
