// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_detail_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProductDetailController on ProductDetailControllerBase, Store {
  late final _$statusAtom =
      Atom(name: 'ProductDetailControllerBase.status', context: context);

  @override
  ProductDetailsStateStatus get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(ProductDetailsStateStatus value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: 'ProductDetailControllerBase.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$imagePathAtom =
      Atom(name: 'ProductDetailControllerBase.imagePath', context: context);

  @override
  String? get imagePath {
    _$imagePathAtom.reportRead();
    return super.imagePath;
  }

  @override
  set imagePath(String? value) {
    _$imagePathAtom.reportWrite(value, super.imagePath, () {
      super.imagePath = value;
    });
  }

  late final _$uploadImageProductAsyncAction = AsyncAction(
      'ProductDetailControllerBase.uploadImageProduct',
      context: context);

  @override
  Future<void> uploadImageProduct(Uint8List file, String fileName) {
    return _$uploadImageProductAsyncAction
        .run(() => super.uploadImageProduct(file, fileName));
  }

  @override
  String toString() {
    return '''
status: ${status},
errorMessage: ${errorMessage},
imagePath: ${imagePath}
    ''';
  }
}
