import 'package:ecommerce_v2/src/domain/models/Product.dart';
import 'package:ecommerce_v2/src/domain/repository/ShoppingBagRepository.dart';

class DeleteItemShoppinBagUseCase {
  ShoppingBagRepository shoppingBagRepository;

  DeleteItemShoppinBagUseCase(this.shoppingBagRepository);

  run(Product product) => shoppingBagRepository.deleteItem(product);
}
