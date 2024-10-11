import 'dart:developer';
import 'dart:typed_data';

import 'package:mobx/mobx.dart';

import '../../../models/product_model.dart';
import '../../../repositories/products/product_repository.dart';
part 'product_detail_controller.g.dart';

enum ProductDetailsStateStatus {
  initial,
  loading,
  loaded,
  error,
  errorLoadProduct,
  deleted,
  uploaded,
  saved
}

class ProductDetailController = ProductDetailControllerBase
    with _$ProductDetailController;

abstract class ProductDetailControllerBase with Store {
  final ProductRepository _productRepository;

  @observable
  var status = ProductDetailsStateStatus.initial;

  @observable
  String? errorMessage;

  @observable
  String? imagePath;

  ProductDetailControllerBase(this._productRepository);

  @action
  Future<void> uploadImageProduct(Uint8List file, String fileName) async {
    status = ProductDetailsStateStatus.loading;
    imagePath = await _productRepository.uploadImageProduct(file, fileName);
    status = ProductDetailsStateStatus.uploaded;
  }

  Future<void> save(String name, double price, String description) async {
    try {
      status = ProductDetailsStateStatus.loading;
      final productModel = ProductModel(
          name: name,
          price: price,
          description: description,
          image: imagePath!,
          enabled: true);

      await _productRepository.save(productModel);
      status = ProductDetailsStateStatus.saved;
    } on Exception catch (e, s) {
      log('Erro ao salvar produto', error: e, stackTrace: s);
      status = ProductDetailsStateStatus.error;
      errorMessage = e.toString();
    }
  }
}
