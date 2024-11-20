import 'package:ecommerce_v2/src/domain/repository/ShoppingBagRepository.dart';

class GetTotalShoppingBagUseCase {
  ShoppingBagRepository shoppingBagRepository;

  GetTotalShoppingBagUseCase(this.shoppingBagRepository);

  run() => shoppingBagRepository.getTotal();
}
