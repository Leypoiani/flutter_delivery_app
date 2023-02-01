import 'package:flutter/material.dart';
import 'package:flutter_delivery_app/app/repositories/products/products_repository_impl.dart';
import 'package:provider/provider.dart';

import 'home_controller.dart';
import 'home_page.dart';

class HomeRouter {
  HomeRouter._();

  static Widget get page => MultiProvider(
        providers: [
          Provider<ProductRepositoryImpl>(
            create: (context) => ProductRepositoryImpl(
            customDio: context.read()
          )
          ),
          Provider<HomeController>(
            create: (context) => HomeController(context.read()),          
          )
        ],
        child: const HomePage(),
      );
}
