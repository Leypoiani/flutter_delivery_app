import 'package:flutter/material.dart';
import 'package:flutter_delivery_app/app/core/rest_client/custom_dio.dart';
import 'package:flutter_delivery_app/app/pages/splash/home/home_page.dart';
import 'package:provider/provider.dart';

class ApplicationBinding extends StatelessWidget {
  const ApplicationBinding({super.key, required MaterialApp child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
Provider(
  create: (context) => CustomDio(),
  child: const HomePage(),
    )
    ],
    );
  }
}
