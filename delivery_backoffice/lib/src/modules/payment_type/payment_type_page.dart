import 'package:flutter/material.dart';

import 'widgets/payment_type_header.dart';
import 'widgets/payment_type_item.dart';

class PaymentTypePage extends StatelessWidget {
  const PaymentTypePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[50],
      padding: const EdgeInsets.only(left: 40, top: 40),
      child: Column(
        children: [
          const PaymentTypeHeader(),
          const SizedBox(
            height: 50,
          ),
          Expanded(
            child: GridView.builder(
              itemCount: 10,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                //define o tamanho do item sendo o maximo possivel
                mainAxisExtent: 120,
                mainAxisSpacing: 20, //espaçamento entre os itens
                crossAxisSpacing: 10,
                maxCrossAxisExtent: 680, //tamanho maximo do item
              ),
              itemBuilder: (context, index) {
                return Container(
                  color: Colors.white,
                  child: Center(
                    child: PaymentTypeItem(),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
