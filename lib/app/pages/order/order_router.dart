import 'package:flutter/material.dart';
import 'package:flutter_delivery_app/app/pages/order/order_page.dart';
import 'package:flutter_delivery_app/app/repositories/auth/order/order_repository_impl.dart';
import 'package:provider/provider.dart';

import '../../repositories/auth/order/order_repository.dart';
import 'order_controller.dart';

class OrderRouter {
  OrderRouter._();

  static Widget get page => MultiProvider(
    providers: [
      Provider(create: (context) => OrderController(context.read()),
      ),
      Provider<OrderRepository>(create: (context) => OrderRepositoryImpl(dio: context.read()),
      ),
    ],
    child: const OrderPage(),
  );
}
