import 'package:flutter/material.dart';

import 'app/core/config/env/env.dart';
import 'app/delivery_app.dart';

void main() async{
  await Env.instance.load();
  runApp(const DeliveryApp());
}
