import 'package:ecommerce_v2/src/domain/useCase/MercadoPago/CreateCardTokenUseCase.dart';
import 'package:ecommerce_v2/src/domain/useCase/MercadoPago/CreatePaymentUseCase.dart';
import 'package:ecommerce_v2/src/domain/useCase/MercadoPago/GetIdentificationTypesUseCase.dart';
import 'package:ecommerce_v2/src/domain/useCase/MercadoPago/GetInstallmentsUseCase.dart';

class MercadoPagoUseCases {
  GetIdentificationTypesUseCase getIdentificationTypes;
  CreateCardTokenUseCase createCardToken;
  GetInstallmentsUseCase getInstallments;
  CreatePaymentUseCase createPaymentUseCase;

  MercadoPagoUseCases({
    required this.getIdentificationTypes,
    required this.createCardToken,
    required this.getInstallments,
    required this.createPaymentUseCase,
  });
}
