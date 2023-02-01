import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_delivery_app/app/core/ui/helpers/messages.dart';
import 'package:flutter_delivery_app/app/core/ui/widgets/delivery_appBar.dart';
import 'package:flutter_delivery_app/app/models/product_model.dart';
import 'package:flutter_delivery_app/app/pages/splash/home/home_controller.dart';
import 'package:flutter_delivery_app/app/pages/splash/home/home_state.dart';
import 'package:flutter_delivery_app/app/pages/splash/home/widgets/delivery_product_tile.dart';

import '../../../core/ui/base_state.dart';
import '../../../core/ui/helpers/loader.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage, HomeController> {

  @override
  void onReady() {
    controller.loadProducts();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppbar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showLoader();
          //tempo ou seila
          hideLoader();
        },
      ),
      body: BlocConsumer<HomeController, HomeState>(
        listener: (context, state) {
          // var matchAny = state.status.matchAny(
          //   any: () => hideLoader(),
          //   loading: () => showLoader(),
          // );
        },
        // buildWhen: (previous, current) => current.status.matchAny(
        //   any: () => false,
        //   initial: () => true,
        //   loaded: () => true,
        //   error: () => {
        //     hideLoader(),
        //     showError(state.errorMessage ?? 'Erro não informado')
        //   },
        // ),
        builder: (context, state) {
          return Column(children: [
            Expanded(
              child: ListView.builder(
                itemCount: state.products.length,
                itemBuilder: (BuildContext context, int index) {
                  final products = state.products[index];
                  return DeliveryProductTile(
                    product: products,
                  );
                },
              ),
            )
          ]);
        },
      ),
    );
  }
}