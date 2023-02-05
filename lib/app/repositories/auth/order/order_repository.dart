import 'package:flutter_delivery_app/app/dto/order_dto.dart';
import 'package:flutter_delivery_app/app/pages/order/widget/payment_types_field.dart';

import '../../../models/payments_types_model.dart';

abstract class OrderRepository {
  Future<List<PaymentsTypeModel>> getAllPaymentsTypes();
  Future<void> saveOrder(OrderDto orderDto);
}
