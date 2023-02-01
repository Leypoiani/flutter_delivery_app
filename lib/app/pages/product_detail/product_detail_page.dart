import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_delivery_app/app/core/ui/helpers/size_extensions.dart';
import 'package:flutter_delivery_app/app/core/ui/styles/text_styles.dart';
import 'package:flutter_delivery_app/app/core/ui/widgets/delivery_appbar.dart';
import 'package:flutter_delivery_app/app/core/ui/widgets/delivery_increment_decrement_button.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DeliveryAppbar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: context.screenWidth,
            height: context.percentHeight(.4),
            decoration: const BoxDecoration(
              image:
                  DecorationImage(image: NetworkImage(''), fit: BoxFit.cover),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              'teste',
              style: context.textStyles.textExtraBold.copyWith(fontSize: 22),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: SingleChildScrollView(child: Text('descricao')),
            ),
          ),
          const Divider(color: Colors.black),
          Row(
            children: [
              Container(
                width: context.percentWidth(.5),
                height: 68,
                padding: const EdgeInsets.all(8),
                child: const DeliveryIncrementDecrementButton(),
                ),
              Container(
                width: context.percentWidth(.5),
                height: 68,
                padding: const EdgeInsets.all(8),
                child: ElevatedButton(
                  onPressed: () {},
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Text('Adicionar', 
                  style: context.textStyles.textExtraBold.copyWith(fontSize: 13),
                  ),
                  const SizedBox(
                    width: 10,
                    ),
                    Expanded(
                      child: AutoSizeText(r'R$ 6,99',
                        maxFontSize: 13,
                        minFontSize: 5,
                        maxLines: 1,
                        style: context.textStyles.textExtraBold
                      ),
                    ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
