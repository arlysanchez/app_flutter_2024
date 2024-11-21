import 'package:ecommerce_v2/src/data/dataSource/remote/service/MercadoPagoService.dart';
import 'package:ecommerce_v2/src/domain/models/MercadoPagoCardTokenBody.dart';
import 'package:ecommerce_v2/src/domain/models/MercadoPagoCardTokenResponse.dart';
import 'package:ecommerce_v2/src/domain/models/MercadoPagoIdentificationType.dart';
import 'package:ecommerce_v2/src/domain/models/MercadoPagoInstallments.dart';
import 'package:ecommerce_v2/src/domain/models/MercadoPagoPaymentBody.dart';
import 'package:ecommerce_v2/src/domain/models/MercadoPagoPaymentResponse2.dart';
import 'package:ecommerce_v2/src/domain/repository/MercadoPagoRepository.dart';
import 'package:ecommerce_v2/src/domain/utils/Resource.dart';

class MercadoPagoRepositoryImpl implements MercadoPagoRepository {
  MercadoPagoService mercadoPagoService;

  MercadoPagoRepositoryImpl(this.mercadoPagoService);

  @override
  Future<Resource<List<MercadoPagoIdentificationType>>>
      getIdentificationTypes() {
    return mercadoPagoService.getIdentificationTypes();
  }

  @override
  Future<Resource<MercadoPagoCardTokenResponse>> createCardToken(
      MercadoPagoCardTokenBody mercadoPagoCardTokenBody) {
    return mercadoPagoService.createCardToken(mercadoPagoCardTokenBody);
  }

  @override
  Future<Resource<MercadoPagoInstallments>> getInstallments(
      String firstSixDigits, String amount) {
    return mercadoPagoService.getInstallments(firstSixDigits, amount);
  }

  @override
  Future<Resource<MercadoPagoPaymentResponse2>> createPayment(
      MercadoPagoPaymentBody mercadoPagoPaymentBody) {
    return mercadoPagoService.createPayment(mercadoPagoPaymentBody);
  }
}
