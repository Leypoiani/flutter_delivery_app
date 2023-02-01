import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_delivery_app/app/core/rest_client/custom_dio.dart';
import 'package:flutter_delivery_app/app/repositories/products/products_repository.dart';

import '../../core/exceptions/repository_exception.dart';
import '../../models/product_model.dart';

class ProductRepositoryImpl implements ProductRepository {
  final CustomDio customDio;
  ProductRepositoryImpl({
    required this.customDio,
  });

  @override
  Future<List<ProductModel>> findAllProducts() async {
    try {
      final result = await customDio.unauth().get('/products');
      return result.data
          .map<ProductModel>((p) => ProductModel.fromMap(p))
          .toList();
    } on DioError catch (e, s) {
      log('Erro ao buscar produtos', error: e, stackTrace: s);
      throw RepositoryException(message: 'Erro ao buscar produtos');
    }
  }
}
