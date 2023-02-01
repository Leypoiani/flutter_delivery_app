import 'package:flutter/material.dart';
import 'package:flutter_delivery_app/app/core/provider/application_binding.dart';
import 'package:flutter_delivery_app/app/pages/splash/home/home_router.dart';
import 'package:flutter_delivery_app/app/pages/splash/splash_page.dart';

import 'core/ui/theme/theme_config.dart';

class DeliveryApp extends StatelessWidget {
  const DeliveryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ApplicationBinding(
      child: MaterialApp(
        title: 'Delivery App', 
        theme: ThemeConfig.theme,
        routes: {
        '/': (context) => const SplashPage(),
         '/home': (context) => HomeRouter.page ,
      }
      ),
    );
  }
}
