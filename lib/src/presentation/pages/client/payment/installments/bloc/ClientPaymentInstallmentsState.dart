import 'package:ecommerce_v2/src/domain/utils/Resource.dart';
import 'package:equatable/equatable.dart';

class ClientPaymentInstallmentsState extends Equatable {
  final Resource? responseInstallments;
  final Resource? responsePayment;
  final String? installment;

  ClientPaymentInstallmentsState(
      {this.responseInstallments, this.installment, this.responsePayment});

  ClientPaymentInstallmentsState copyWith(
      {Resource? responseInstallments,
      Resource? responsePayment,
      String? installment}) {
    return ClientPaymentInstallmentsState(
        responseInstallments: responseInstallments ?? this.responseInstallments,
        installment: installment ?? this.installment,
        responsePayment: responsePayment);
  }

  @override
  List<Object?> get props =>
      [responseInstallments, installment, responsePayment];
}
