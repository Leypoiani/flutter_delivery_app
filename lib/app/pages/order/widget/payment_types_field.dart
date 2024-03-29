// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_awesome_select/flutter_awesome_select.dart';

import 'package:flutter_delivery_app/app/core/ui/helpers/size_extensions.dart';
import 'package:flutter_delivery_app/app/core/ui/styles/text_styles.dart';

import '../../../models/payments_types_model.dart';

class PaymentTypesField extends StatelessWidget {
  final List<PaymentsTypeModel> listPaymentTypes;
  final ValueChanged<int> valueChange;
  final bool valid;
  final String valueSelected;

  const PaymentTypesField({
    super.key,
    required this.listPaymentTypes,
    required this.valueChange,
    required this.valid, 
    required this.valueSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Forma de pagamento',
            style: context.textStyles.textRegular.copyWith(fontSize: 16),
          ),
          SmartSelect<String>.single(
            title: '',
            selectedValue: valueSelected,
            modalType: S2ModalType.bottomSheet,
            onChange: (selected) {
              valueChange(int.parse(selected.value));
            },
            tileBuilder: (context, state) {
              return InkWell(
                onTap: state.showModal,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      width: context.screenWidth,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            state.selected.title ?? '',
                            style: context.textStyles.textRegular,
                          ),
                          const Icon(Icons.arrow_forward_ios_rounded)
                        ],
                      ),
                    ),
                    Visibility(
                      visible: !valid,
                      child: const Divider(color: Colors.red,),
                      ),
                      Visibility(
                      visible: !valid,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Text('Selecione uma forma de pagamento',
                        style: context.textStyles.textRegular.copyWith(
                          fontSize: 13, color: Colors.red),
                        ),
                      ),
                      ),
                  ],
                ),
              );
            },
            choiceItems: S2Choice.listFrom<String, Map<String, String>>(
              source: listPaymentTypes
                  .map((p) => {'value': p.id.toString(), 'title': p.name})
                  .toList(),
              // [
              //   {'value': 'VA', 'title': 'Vale Alimentação'},
              //   {'value': 'VR', 'title': 'Vale Refeição'},
              //   {'value': 'CC', 'title': 'Cartão de Crédito'},
              // ],
              title: (index, item) => item['title'] ?? '',
              value: (index, item) => item['value'] ?? '',
              group: (index, item) => 'Selecione uma forma de pagamento',
            ),
            choiceType: S2ChoiceType.radios,
            choiceGrouped: true,
            modalFilter: false,
            placeholder: '',
          )
        ],
      ),
    );
  }
}
