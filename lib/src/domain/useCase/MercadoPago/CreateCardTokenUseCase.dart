import 'package:ecommerce_v2/src/domain/models/MercadoPagoCardTokenBody.dart';
import 'package:ecommerce_v2/src/domain/repository/MercadoPagoRepository.dart';

class CreateCardTokenUseCase {
  MercadoPagoRepository mercadoPagoRepository;

  CreateCardTokenUseCase(this.mercadoPagoRepository);

  run(MercadoPagoCardTokenBody mercadoPagoCardTokenBody) =>
      mercadoPagoRepository.createCardToken(mercadoPagoCardTokenBody);
}
