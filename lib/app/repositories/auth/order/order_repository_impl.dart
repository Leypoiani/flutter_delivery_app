// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_delivery_app/app/core/exceptions/repository_exception.dart';
import 'package:flutter_delivery_app/app/core/rest_client/custom_dio.dart';
import 'package:flutter_delivery_app/app/dto/order_dto.dart';
import 'package:flutter_delivery_app/app/models/payments_types_model.dart';

import './order_repository.dart';

class OrderRepositoryImpl implements OrderRepository {
  final CustomDio dio;

  OrderRepositoryImpl({
    required this.dio,
  });

  @override
  Future<List<PaymentsTypeModel>> getAllPaymentsTypes() async {
    try {
      final result = await dio.auth().get('/payment.types');
      return result.data
          .map<PaymentsTypeModel>((p) => PaymentsTypeModel.fromMap(p))
          .toList();
    } on DioError catch (e, s) {
      log('Erro ao buscar formas de pagamento', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao buscar formas de pagamento');
    }
  }

  @override
  Future<void> saveOrder(OrderDto orderDto) async {
    try {
  await dio.auth().post('/orders', data: {
    'products' : orderDto.products.map((e) => {
      'id': e.product.id,
      'amoun': e.amount,
      'total_price': e.totalPrice,
    }).toList(),
    'user_id': '#userAuthRef',
    'address': orderDto.address,
    'CPF': orderDto.document,
    'payment_method_id': orderDto.paymentMethodId
  });
} on DioError catch (e, s) {
      log('Erro ao registrar pedido', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao registrar pedido');
    }
  }
}
