import 'dart:convert';

import 'package:ecommerce_v2/src/data/api/ApiConfig.dart';
import 'package:ecommerce_v2/src/domain/models/MercadoPagoCardTokenBody.dart';
import 'package:ecommerce_v2/src/domain/models/MercadoPagoCardTokenResponse.dart';
import 'package:ecommerce_v2/src/domain/models/MercadoPagoIdentificationType.dart';
import 'package:ecommerce_v2/src/domain/models/MercadoPagoInstallments.dart';
import 'package:ecommerce_v2/src/domain/models/MercadoPagoPaymentBody.dart';
import 'package:ecommerce_v2/src/domain/models/MercadoPagoPaymentResponse2.dart';
import 'package:ecommerce_v2/src/domain/utils/ListToString.dart';
import 'package:ecommerce_v2/src/domain/utils/Resource.dart';
import 'package:http/http.dart' as http;
import 'package:uuid/uuid.dart';

class MercadoPagoService {
  Future<String> token;

  MercadoPagoService(this.token);

  Future<Resource<List<MercadoPagoIdentificationType>>>
      getIdentificationTypes() async {
    try {
      Uri url =
          Uri.http(ApiConfig.API_ECOMMECE, '/mercadopago/identification_types');
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": await token
      };
      final response = await http.get(url, headers: headers);
      final data = json.decode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        List<MercadoPagoIdentificationType> identificationTypes =
            MercadoPagoIdentificationType.fromJsonList(data);
        return Success(identificationTypes);
      } else {
        // ERROR
        return Error(ListToString(data['message']));
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }
  }

  Future<Resource<MercadoPagoCardTokenResponse>> createCardToken(
      MercadoPagoCardTokenBody mercadoPagoCardTokenBody) async {
    try {
      Uri url = Uri.http(ApiConfig.API_ECOMMECE, '/mercadopago/card_token');
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": await token
      };
      String body = json.encode(mercadoPagoCardTokenBody.toJson());
      final response = await http.post(url, headers: headers, body: body);
      final data = json.decode(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        MercadoPagoCardTokenResponse mercadoPagoCardTokenResponse =
            MercadoPagoCardTokenResponse.fromJson(data);
        return Success(mercadoPagoCardTokenResponse);
      } else {
        // ERROR
        return Error(ListToString(data['message']));
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }
  }

  Future<Resource<MercadoPagoPaymentResponse2>> createPayment(
      MercadoPagoPaymentBody mercadoPagoPaymentBody) async {
    try {
      Uri url = Uri.http(ApiConfig.API_ECOMMECE, '/mercadopago/payments');
      final uuid = Uuid();
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": await token,
        'X-Idempotency-Key': uuid.v4()
      };

      String body = json.encode(mercadoPagoPaymentBody);

      final response = await http
          .post(url, headers: headers, body: body)
          .timeout(Duration(seconds: 120));
      print('Respuesta completa del servidor: ${response.body}');
      print('Longitud de la respuesta: ${response.body.length}');

      // Decodificar la respuesta JSON
      final data = json.decode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        print('ENTRO AL IF');
        final mercadoPagoPaymentResponse2 =
            MercadoPagoPaymentResponse2.fromJson(data);
        print('SUCCESS${mercadoPagoPaymentResponse2}');
        return Success(mercadoPagoPaymentResponse2);
      } else {
        // Manejar error estructurado
        final errorMessage = data['message'] ?? 'Error desconocido';
        print('Error desde el servidor: $errorMessage');
        return Error(errorMessage);
      }
    } catch (e) {
      print('Error al procesar la solicitud: $e');
      return Error('Error al procesar el pago: $e');
    }
  }

  Future<Resource<MercadoPagoInstallments>> getInstallments(
      String firstSixDigits, String amount) async {
    try {
      Uri url = Uri.http(ApiConfig.API_ECOMMECE,
          '/mercadopago/installments/$firstSixDigits/$amount');
      Map<String, String> headers = {
        "Content-Type": "application/json",
        "Authorization": await token
      };
      final response = await http.get(url, headers: headers);

      final data = json.decode(response.body);

      if (response.statusCode == 200 || response.statusCode == 201) {
        MercadoPagoInstallments mercadoPagoInstallments =
            MercadoPagoInstallments.fromJson(data);
        return Success(mercadoPagoInstallments);
      } else {
        // ERROR
        return Error(ListToString(data['message']));
      }
    } catch (e) {
      print('Error: $e');
      return Error(e.toString());
    }
  }
}
