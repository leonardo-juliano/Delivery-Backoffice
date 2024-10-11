// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProductsController on ProductsControllerBase, Store {
  late final _$statusAtom =
      Atom(name: 'ProductsControllerBase.status', context: context);

  @override
  ProductStateStatus get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(ProductStateStatus value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  late final _$productsAtom =
      Atom(name: 'ProductsControllerBase.products', context: context);

  @override
  List<ProductModel> get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(List<ProductModel> value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  late final _$_filterNameAtom =
      Atom(name: 'ProductsControllerBase._filterName', context: context);

  @override
  String? get _filterName {
    _$_filterNameAtom.reportRead();
    return super._filterName;
  }

  @override
  set _filterName(String? value) {
    _$_filterNameAtom.reportWrite(value, super._filterName, () {
      super._filterName = value;
    });
  }

  late final _$loadProductsAsyncAction =
      AsyncAction('ProductsControllerBase.loadProducts', context: context);

  @override
  Future<void> loadProducts() {
    return _$loadProductsAsyncAction.run(() => super.loadProducts());
  }

  @override
  String toString() {
    return '''
status: ${status},
products: ${products}
    ''';
  }
}
