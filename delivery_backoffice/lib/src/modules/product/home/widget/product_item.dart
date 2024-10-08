import 'package:flutter/material.dart';

import '../../../../core/env/env.dart';
import '../../../../core/extensions/formater_extensions.dart';
import '../../../../core/ui/styles/text_styles.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({super.key});

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
                            '${Env.instance.get('backend_base_url')}/storage/mclumygt_jrs_1682022574279.jpg'),
                        fit: BoxFit
                            .cover //esticar imagem para cobrir o container
                        )),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  'X-Tudão',
                  style: context.textStyles.textRegular,
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(100.00.currencyPTBR),
                  ),
                  TextButton(onPressed: () {}, child: Text('Editar'))
                ],
              )
            ],
          );
        }));
  }
}
