import 'dart:developer';

import 'package:dio/dio.dart';

import '../../core/exceptions/repository_exception.dart';
import '../../core/rest_client/custom_dio.dart';
import '../../models/payment_type_model.dart';
import './payment_type_repository.dart';

class PaymentTypeRepositoryImpl extends PaymentTypeRepository {
  final CustomDio _dio;

  PaymentTypeRepositoryImpl(this._dio);

  @override
  Future<List<PaymentTypeModel>> findAll(bool? enabled) async {
    try {
      final paymentResult = await _dio.auth().get(
        '/payment-types',
        queryParameters: {
          if (enabled != null) 'enable': enabled,
        },
      );
      return paymentResult.data
          .map<PaymentTypeModel>((p) => PaymentTypeModel.fromMap(p))
          .toList();
    } on DioException catch (e, s) {
      log('Erro ao buscar os tipos de pagamento', error: e, stackTrace: s);
      throw RepositoryException(
        message: 'Erro ao buscar os tipos de pagamento',
      );
    }
  }

  @override
  Future<PaymentTypeModel> getById(int id) async {
    try {
      final paymentResult = await _dio.auth().get('/payment-types/$id');
      return PaymentTypeModel.fromMap(paymentResult.data);
    } on DioException catch (e, s) {
      log('Erro ao buscar os tipos de pagamento $id', error: e, stackTrace: s);
      throw RepositoryException(
        message: 'Erro ao buscar os tipos de pagamento',
      );
    }
  }

  @override
  Future<void> save(PaymentTypeModel model) async {
    try {
      final client = _dio.auth();

      if (model.id != null) {
        await client
            .auth()
            .post('/payment-types/${model.id}', data: model.toMap());
      } else {
        await client.auth().post('/payment-types/', data: model.toMap());
      }
    } on DioException catch (e, s) {
      log('Erro ao salvar os tipos de pagamento ', error: e, stackTrace: s);
      throw RepositoryException(
        message: 'Erro ao salvar os tipos de pagamento',
      );
    }
  }
}
