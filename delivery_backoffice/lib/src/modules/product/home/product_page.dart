import 'package:flutter/material.dart';

import '../../../core/ui/widgets/base_header.dart';
import 'widget/product_item.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey[50],
        padding: const EdgeInsets.only(left: 40, top: 40, right: 40),
        child: Column(
          children: [
            BaseHeader(
                title: 'Admnistrar Produto',
                buttonLabel: 'Adicionar Produto',
                buttonPressed: () {},
            ),
            const SizedBox(
              height: 50,
            ),
            Expanded(
              child: GridView.builder(
                itemCount: 10,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  mainAxisExtent: 280,
                  mainAxisSpacing: 20,
                  maxCrossAxisExtent: 280,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                 return ProductItem();
                },
              ),
            ),
          ],
        ),
    );
  }
}
