import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../core/ui/helpers/debouncer.dart';
import '../../../core/ui/helpers/loader.dart';
import '../../../core/ui/helpers/messages.dart';
import '../../../core/ui/widgets/base_header.dart';
import 'products_controller.dart';
import 'widget/product_item.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> with Loader, Messages {
  final controller = Modular.get<ProductsController>();
  late final ReactionDisposer statusDisposer;
  final debouncer = Debouncer(milliseconds: 500);

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      statusDisposer = reaction((_) => controller.status, (status) async {
        switch (status) {
          case ProductStateStatus.initial:
            break;
          case ProductStateStatus.loading:
            showLoader();
            break;
          case ProductStateStatus.loaded:
            hideLoader();
            break;
          case ProductStateStatus.error:
            hideLoader();
            showError('Erro ao buscar produtos');
            break;
          // case ProductStateStatus.addOrUpdateProduct:
          //   hideLoader();
          //   final productSelected = controller.productSelected;
          //   var uri = '/products/detail';

          //   if (productSelected != null) {
          //     uri += '?id=${productSelected.id}';
          //   }

          //   await Modular.to.pushNamed(uri);
          //   controller.loadProducts();
          //   break;
        }
      });
      controller.loadProducts();
    });
    super.initState();
  }

  @override
  void dispose() {
    statusDisposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[50],
      padding: const EdgeInsets.only(left: 40, top: 40, right: 40),
      child: Column(
        children: [
          BaseHeader(
            title: 'Admnistrar Produtos',
            buttonLabel: 'Adicionar Produtos',
            buttonPressed: () async {
              await Modular.to.pushNamed('/products/detail');
              controller.loadProducts();
            },
            searchchange: (value) {
              debouncer.call(() {
                controller.filterByName(value);
              });
            },
          ),
          const SizedBox(
            height: 50,
          ),
          Expanded(
            child: Observer(builder: (_) {
              return GridView.builder(
                itemCount: controller.products.length,
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  mainAxisExtent: 280,
                  mainAxisSpacing: 20,
                  maxCrossAxisExtent: 280,
                  crossAxisSpacing: 10,
                ),
                itemBuilder: (context, index) {
                  return ProductItem(product: controller.products[index]);
                },
              );
            }),
          ),
        ],
      ),
    );
  }
}
