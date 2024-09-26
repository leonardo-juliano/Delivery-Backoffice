// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_type_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PaymentTypeController on PaymentTypeControllerBase, Store {
  late final _$_statusAtom =
      Atom(name: 'PaymentTypeControllerBase._status', context: context);

  @override
  PaymentTypeStateStatus get _status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  set _status(PaymentTypeStateStatus value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$_paymentTypesAtom =
      Atom(name: 'PaymentTypeControllerBase._paymentTypes', context: context);

  @override
  ObservableList<PaymentTypeModel> get _paymentTypes {
    _$_paymentTypesAtom.reportRead();
    return super._paymentTypes;
  }

  @override
  set _paymentTypes(ObservableList<PaymentTypeModel> value) {
    _$_paymentTypesAtom.reportWrite(value, super._paymentTypes, () {
      super._paymentTypes = value;
    });
  }

  late final _$_errorMessageAtom =
      Atom(name: 'PaymentTypeControllerBase._errorMessage', context: context);

  @override
  String? get _errorMessage {
    _$_errorMessageAtom.reportRead();
    return super._errorMessage;
  }

  @override
  set _errorMessage(String? value) {
    _$_errorMessageAtom.reportWrite(value, super._errorMessage, () {
      super._errorMessage = value;
    });
  }

  late final _$paymentTypeSelectedAtom = Atom(
      name: 'PaymentTypeControllerBase.paymentTypeSelected', context: context);

  @override
  PaymentTypeModel? get paymentTypeSelected {
    _$paymentTypeSelectedAtom.reportRead();
    return super.paymentTypeSelected;
  }

  @override
  set paymentTypeSelected(PaymentTypeModel? value) {
    _$paymentTypeSelectedAtom.reportWrite(value, super.paymentTypeSelected, () {
      super.paymentTypeSelected = value;
    });
  }

  late final _$filterEnabledAtom =
      Atom(name: 'PaymentTypeControllerBase.filterEnabled', context: context);

  @override
  bool? get filterEnabled {
    _$filterEnabledAtom.reportRead();
    return super.filterEnabled;
  }

  @override
  set filterEnabled(bool? value) {
    _$filterEnabledAtom.reportWrite(value, super.filterEnabled, () {
      super.filterEnabled = value;
    });
  }

  late final _$loadPaymentsAsyncAction =
      AsyncAction('PaymentTypeControllerBase.loadPayments', context: context);

  @override
  Future<void> loadPayments() {
    return _$loadPaymentsAsyncAction.run(() => super.loadPayments());
  }

  late final _$savePaymentAsyncAction =
      AsyncAction('PaymentTypeControllerBase.savePayment', context: context);

  @override
  Future<void> savePayment(
      {int? id,
      required String name,
      required String acronym,
      required bool enabled}) {
    return _$savePaymentAsyncAction.run(() => super
        .savePayment(id: id, name: name, acronym: acronym, enabled: enabled));
  }

  @override
  String toString() {
    return '''
paymentTypeSelected: ${paymentTypeSelected},
filterEnabled: ${filterEnabled}
    ''';
  }
}
