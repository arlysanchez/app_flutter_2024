import 'package:ecommerce_v2/src/domain/repository/MercadoPagoRepository.dart';

class GetIdentificationTypesUseCase {
  MercadoPagoRepository mercadoPagoRepository;

  GetIdentificationTypesUseCase(this.mercadoPagoRepository);

  run() => mercadoPagoRepository.getIdentificationTypes();
}
