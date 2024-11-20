import 'package:ecommerce_v2/src/domain/models/MercadoPagoPaymentBody.dart';
import 'package:ecommerce_v2/src/domain/repository/MercadoPagoRepository.dart';

class CreatePaymentUseCase {
  MercadoPagoRepository mercadoPagoRepository;

  CreatePaymentUseCase(this.mercadoPagoRepository);

  run(MercadoPagoPaymentBody mercadoPagoPaymentBody) =>
      mercadoPagoRepository.createPayment(mercadoPagoPaymentBody);
}
