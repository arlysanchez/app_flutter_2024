import 'package:ecommerce_v2/src/domain/repository/ShoppingBagRepository.dart';

class deleteShoppingBagUseCase {
  ShoppingBagRepository shoppingBagRepository;

  deleteShoppingBagUseCase(this.shoppingBagRepository);

  run() => shoppingBagRepository.deleteShoppingBag();
}
