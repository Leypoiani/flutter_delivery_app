import 'package:flutter/material.dart';
import 'package:flutter_delivery_app/app/core/ui/helpers/size_extensions.dart';
import 'package:flutter_delivery_app/app/core/ui/styles/colors_app.dart';

import '../../core/ui/widgets/delivery_button.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.colors.primary;
    return Scaffold(
      appBar: AppBar(title: const Text('Splash')),
      body: ColoredBox(
        color: const Color(0XFF140E0E),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                  width: context.screenWidth,
                  height: context.screenHeight,
                  child: Image.asset('assets/Images/lanche.png',
                      fit: BoxFit.cover)),
            ),
            Center(
              child: Column(
                children: [
                  SizedBox(
                    height: context.percentHeight(.30),
                  ),
                  Image.asset('assets/Images/logo.png'),
                  const SizedBox(
                    height: 80,
                  ),
                  DeliveryButton(
                      widht: context.percentWidth(.6),
                      height: 35,
                      label: 'ACESSAR',
                      onPressed: () {
                        Navigator.of(context).popAndPushNamed('/home');
                      })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
