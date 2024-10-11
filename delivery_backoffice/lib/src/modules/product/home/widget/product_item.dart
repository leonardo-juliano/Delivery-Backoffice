import 'package:flutter/material.dart';

import '../../../../core/env/env.dart';
import '../../../../core/extensions/formater_extensions.dart';
import '../../../../core/ui/styles/text_styles.dart';
import '../../../../models/product_model.dart';

class ProductItem extends StatelessWidget {
  final ProductModel product;
  const ProductItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        elevation: 10,
        child: LayoutBuilder(builder: (_, constraints) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: constraints.maxHeight * .6,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    image: DecorationImage(
                        image: NetworkImage(
                          '${Env.instance.get('backend_base_url')}${product.image}',
                        ),
                        fit: BoxFit
                            .cover //esticar imagem para cobrir o container
                        )),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Tooltip(
                  message: product.name,
                  child: Text(
                    product.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: context.textStyles.textRegular,
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(product.price.currencyPTBR),
                  ),
                  TextButton(onPressed: () {}, child: Text('Editar'))
                ],
              )
            ],
          );
        }));
  }
}
