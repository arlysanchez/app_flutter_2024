import 'package:ecommerce_v2/src/domain/models/Product.dart';
import 'package:ecommerce_v2/src/domain/repository/ShoppingBagRepository.dart';

class AddShoppingBagUseCase {
  ShoppingBagRepository shoppingBagRepository;

  AddShoppingBagUseCase(this.shoppingBagRepository);

  run(Product product) => shoppingBagRepository.add(product);
}
