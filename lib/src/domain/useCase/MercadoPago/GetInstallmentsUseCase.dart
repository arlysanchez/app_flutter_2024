import 'package:ecommerce_v2/src/domain/repository/MercadoPagoRepository.dart';

class GetInstallmentsUseCase {
  MercadoPagoRepository mercadoPagoRepository;

  GetInstallmentsUseCase(this.mercadoPagoRepository);

  run(String firstSixDigits, String amount) =>
      mercadoPagoRepository.getInstallments(firstSixDigits, amount);
}
