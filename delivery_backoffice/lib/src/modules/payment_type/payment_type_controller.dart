import 'dart:developer';

import 'package:mobx/mobx.dart';

import '../../models/payment_type_model.dart';
import '../../repositories/payment_type/payment_type_repository.dart';
part 'payment_type_controller.g.dart';

enum PaymentTypeStateStatus {
  initial,
  loading,
  loaded,
  error,
  addOrUpdatePayment,
  saved
}

class PaymentTypeController = PaymentTypeControllerBase
    with _$PaymentTypeController;

abstract class PaymentTypeControllerBase with Store {
  final PaymentTypeRepository _paymentTypeRepository;

  @observable
  PaymentTypeStateStatus _status = PaymentTypeStateStatus.initial;

  @observable
  ObservableList<PaymentTypeModel> _paymentTypes =
      ObservableList<PaymentTypeModel>();

  @observable
  String? _errorMessage;

  @observable
  PaymentTypeModel? paymentTypeSelected;

  @observable
  bool? filterEnabled;

  PaymentTypeControllerBase(this._paymentTypeRepository);

  void changedFilter(bool? enabled) => filterEnabled = enabled;

  @action
  Future<void> loadPayments() async {
    try {
      _status = PaymentTypeStateStatus.loading;
      _paymentTypes = ObservableList.of(
        await _paymentTypeRepository.findAll(filterEnabled),
      );
      _status = PaymentTypeStateStatus.loaded;
    } catch (e, s) {
      log('Erro ao carregar as formas de pagamento', error: e, stackTrace: s);
      _status = PaymentTypeStateStatus.error;
      _errorMessage = 'Erro ao carregar as formas de pagamento';
    }
  }

  Future<void> addPayment() async {
    _status = PaymentTypeStateStatus.loading;
    await Future.delayed(Duration.zero);
    paymentTypeSelected = null;
    _status = PaymentTypeStateStatus.addOrUpdatePayment;
  }

  Future<void> editPayment(PaymentTypeModel payment) async {
    _status = PaymentTypeStateStatus.loading;
    await Future.delayed(Duration.zero);
    paymentTypeSelected = payment;
    _status = PaymentTypeStateStatus.addOrUpdatePayment;
  }

  @action
  Future<void> savePayment(
      {int? id,
      required String name,
      required String acronym,
      required bool enabled}) async {
    _status = PaymentTypeStateStatus.loading;
    final paymentTypeModel = PaymentTypeModel(
        id: id, name: name, acronym: acronym, enabled: enabled);
    await _paymentTypeRepository.save(paymentTypeModel);
    _status = PaymentTypeStateStatus.saved;
  }

  // Getters for the observables to expose the state safely
  PaymentTypeStateStatus get status => _status;
  List<PaymentTypeModel> get paymentTypes => _paymentTypes;
  String? get errorMessage => _errorMessage;
}
