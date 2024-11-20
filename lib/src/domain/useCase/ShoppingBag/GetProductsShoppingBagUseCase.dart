import 'package:ecommerce_v2/src/domain/repository/ShoppingBagRepository.dart';

class GetProductsShoppingBagUseCase {
  ShoppingBagRepository shoppingBagRepository;

  GetProductsShoppingBagUseCase(this.shoppingBagRepository);

  run() => shoppingBagRepository.getProducts();
}
