import 'package:ecommerce_v2/src/data/dataSource/local/SharedPref.dart';
import 'package:ecommerce_v2/src/data/dataSource/remote/service/AddressService.dart';
import 'package:ecommerce_v2/src/data/dataSource/remote/service/CategoriesService.dart';
import 'package:ecommerce_v2/src/data/dataSource/remote/service/MercadoPagoService.dart';
import 'package:ecommerce_v2/src/data/dataSource/remote/service/ProductsService.dart';
import 'package:ecommerce_v2/src/data/dataSource/remote/service/UsersService.dart';
import 'package:ecommerce_v2/src/data/repository/AddressRepositoryImpl.dart';
import 'package:ecommerce_v2/src/data/repository/AuthRepositoryImpl.dart';
import 'package:ecommerce_v2/src/data/dataSource/remote/service/AuthService.dart';
import 'package:ecommerce_v2/src/data/repository/CategoriesRepositoryImpl.dart';
import 'package:ecommerce_v2/src/data/repository/MercadoPagoRepositoryImpl.dart';
import 'package:ecommerce_v2/src/data/repository/ProductsRepositoryImpl.dart';
import 'package:ecommerce_v2/src/data/repository/ShoppingBagRepositoryImpl.dart';
import 'package:ecommerce_v2/src/data/repository/UsersRepositoryImpl.dart';
import 'package:ecommerce_v2/src/domain/models/AuthResponse.dart';
import 'package:ecommerce_v2/src/domain/repository/AddressRepository.dart';
import 'package:ecommerce_v2/src/domain/repository/AuthRepository.dart';
import 'package:ecommerce_v2/src/domain/repository/CategoriesRepository.dart';
import 'package:ecommerce_v2/src/domain/repository/MercadoPagoRepository.dart';
import 'package:ecommerce_v2/src/domain/repository/ProductsRepository.dart';
import 'package:ecommerce_v2/src/domain/repository/ShoppingBagRepository.dart';
import 'package:ecommerce_v2/src/domain/repository/UsersRepository.dart';
import 'package:ecommerce_v2/src/domain/useCase/Auth/AuthUseCases.dart';
import 'package:ecommerce_v2/src/domain/useCase/Auth/GetUserSessionUseCase.dart';
import 'package:ecommerce_v2/src/domain/useCase/Auth/LoginUseCase.dart';
import 'package:ecommerce_v2/src/domain/useCase/Auth/LogoutUseCase.dart';
import 'package:ecommerce_v2/src/domain/useCase/Auth/RegisterUseCase.dart';
import 'package:ecommerce_v2/src/domain/useCase/Auth/SaveUserSessionUseCase.dart';
import 'package:ecommerce_v2/src/domain/useCase/MercadoPago/CreateCardTokenUseCase.dart';
import 'package:ecommerce_v2/src/domain/useCase/MercadoPago/CreatePaymentUseCase.dart';
import 'package:ecommerce_v2/src/domain/useCase/MercadoPago/GetIdentificationTypesUseCase.dart';
import 'package:ecommerce_v2/src/domain/useCase/MercadoPago/GetInstallmentsUseCase.dart';
import 'package:ecommerce_v2/src/domain/useCase/MercadoPago/MercadoPagoUseCases.dart';
import 'package:ecommerce_v2/src/domain/useCase/ShoppingBag/AddShoppingBagUseCase.dart';
import 'package:ecommerce_v2/src/domain/useCase/ShoppingBag/DeleteItemShoppingBagUseCase.dart';
import 'package:ecommerce_v2/src/domain/useCase/ShoppingBag/DeleteShoppingBagUseCase.dart';
import 'package:ecommerce_v2/src/domain/useCase/ShoppingBag/GetProductsShoppingBagUseCase.dart';
import 'package:ecommerce_v2/src/domain/useCase/ShoppingBag/GetTotalShoppingBagUseCase.dart';
import 'package:ecommerce_v2/src/domain/useCase/ShoppingBag/ShoppingBagUseCases.dart';
import 'package:ecommerce_v2/src/domain/useCase/address/AddressUseCases.dart';
import 'package:ecommerce_v2/src/domain/useCase/address/CreateAddressUseCase.dart';
import 'package:ecommerce_v2/src/domain/useCase/address/DeleteAddressFromSessionUseCase.dart';
import 'package:ecommerce_v2/src/domain/useCase/address/DeleteAddressUseCase.dart';
import 'package:ecommerce_v2/src/domain/useCase/address/GetAddressSessionUseCase.dart';
import 'package:ecommerce_v2/src/domain/useCase/address/GetUserAddressUseCase.dart';
import 'package:ecommerce_v2/src/domain/useCase/address/SaveAddressInSessionUseCase.dart';
import 'package:ecommerce_v2/src/domain/useCase/categories/CategoriesUseCases.dart';
import 'package:ecommerce_v2/src/domain/useCase/categories/CreateCategoryUseCase.dart';
import 'package:ecommerce_v2/src/domain/useCase/categories/DeleteCategoryUseCase.dart';
import 'package:ecommerce_v2/src/domain/useCase/categories/GetCategoriesUseCase.dart';
import 'package:ecommerce_v2/src/domain/useCase/categories/UpdateCategoryUseCase.dart';
import 'package:ecommerce_v2/src/domain/useCase/products/CreateProductUseCase.dart';
import 'package:ecommerce_v2/src/domain/useCase/products/DeleteProductUseCase.dart';
import 'package:ecommerce_v2/src/domain/useCase/products/GetProductsByCategoryUseCase.dart';
import 'package:ecommerce_v2/src/domain/useCase/products/ProductsUseCases.dart';
import 'package:ecommerce_v2/src/domain/useCase/products/UpdateProductUseCase.dart';
import 'package:ecommerce_v2/src/domain/useCase/users/UpdateUserUseCase.dart';
import 'package:ecommerce_v2/src/domain/useCase/users/UsersUseCases.dart';
import 'package:injectable/injectable.dart';

@module
abstract class AppModule {
  @injectable
  SharedPref get sharedPref => SharedPref();
  @injectable
  Future<String> get token async {
    String token = "";
    final userSession = await sharedPref.read('user');
    if (userSession != null) {
      AuthResponse authResponse = AuthResponse.fromJson(userSession);
      token = authResponse.token;
    }
    return token;
  }

  //services
  @injectable
  AuthService get authService => AuthService();

  @injectable
  UsersService get usersService => UsersService(token);
  @injectable
  CategoriesService get categoriesService => CategoriesService(token);

  @injectable
  ProductsService get productsService => ProductsService(token);

  @injectable
  AddressService get addressService => AddressService(token);

  @injectable
  MercadoPagoService get mercadoPagoService => MercadoPagoService(token);

//Repository
  @injectable
  AuthRepository get authRepository =>
      AuthRepositoryImpl(authService, sharedPref);
  @injectable
  UsersRepository get usersRepository => UsersRepositoryImpl(usersService);

  @injectable
  CategoriesRepository get categoriesRepository =>
      CategoriesRepositoryImpl(categoriesService);

  @injectable
  ProductsRepository get productsRepository =>
      ProductsRepositoryImpl(productsService);

  @injectable
  ShoppingBagRepository get shoppingBagRepository =>
      ShoppingBagRepositoryImpl(sharedPref);

  @injectable
  AddressRepository get addressRepository =>
      AddressRepositoryImpl(addressService, sharedPref);

  @injectable
  MercadoPagoRepository get mercadoPagoRepository =>
      MercadoPagoRepositoryImpl(mercadoPagoService);

  //UseCases
  @injectable
  AuthUseCases get authUseCases => AuthUseCases(
        login: LoginUseCase(authRepository),
        register: RegisterUseCase(authRepository),
        saveUserSession: SaveUserSessionUseCase(authRepository),
        getUserSession: GetUserSessionUseCase(authRepository),
        logout: LogoutUseCase(authRepository),
      );

  @injectable
  UsersUseCases get usersUseCases =>
      UsersUseCases(updateUser: UpdateUserUseCase(usersRepository));

  @injectable
  CategoriesUseCases get categoriesUseCases => CategoriesUseCases(
      create: CreateCategoryUseCase(categoriesRepository),
      getCategories: GetCategoriesUseCase(categoriesRepository),
      update: UpdateCategoryUseCase(categoriesRepository),
      delete: DeleteCategoryUseCase(categoriesRepository));

  @injectable
  ProductsUseCases get productsUseCases => ProductsUseCases(
      create: CreateProductUseCase(productsRepository),
      getProductsByCategory: GetProductsByCategoryUseCase(productsRepository),
      update: UpdateProductUseCase(productsRepository),
      delete: DeleteProductUseCase(productsRepository));
  @injectable
  ShoppingBagUseCases get shoppingBagUseCases => ShoppingBagUseCases(
      add: AddShoppingBagUseCase(shoppingBagRepository),
      getProducts: GetProductsShoppingBagUseCase(shoppingBagRepository),
      deleteItem: DeleteItemShoppinBagUseCase(shoppingBagRepository),
      deleteShoppingBag: deleteShoppingBagUseCase(shoppingBagRepository),
      getTotal: GetTotalShoppingBagUseCase(shoppingBagRepository));

  @injectable
  AddressUseCases get addressUseCases => AddressUseCases(
      create: CreateAddressUseCase(addressRepository),
      getUserAddress: GetUserAddressUseCase(addressRepository),
      saveAddressInSession: SaveAddressInSessionUseCase(addressRepository),
      getAddressSession: GetAddressSessionUseCase(addressRepository),
      delete: DeleteAddressUseCase(addressRepository),
      deleteFromSession: DeleteAddressFromSessionUseCase(addressRepository));

  @injectable
  MercadoPagoUseCases get mercadoPagoUseCases => MercadoPagoUseCases(
      getIdentificationTypes:
          GetIdentificationTypesUseCase(mercadoPagoRepository),
      createCardToken: CreateCardTokenUseCase(mercadoPagoRepository),
      getInstallments: GetInstallmentsUseCase(mercadoPagoRepository),
      createPaymentUseCase: CreatePaymentUseCase(mercadoPagoRepository));
}
