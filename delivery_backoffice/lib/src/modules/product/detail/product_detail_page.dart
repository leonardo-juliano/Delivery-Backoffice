import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:validatorless/validatorless.dart';

import '../../../core/env/env.dart';
import '../../../core/ui/helpers/loader.dart';
import '../../../core/ui/helpers/messages.dart';
import '../../../core/ui/helpers/size_extensions.dart';
import '../../../core/ui/helpers/upload_html_helper.dart';
import '../../../core/ui/styles/text_styles.dart';
import 'product_detail_controller.dart';

class ProductDetailPage extends StatefulWidget {
  final int? productId;
  const ProductDetailPage({super.key, required this.productId});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage>
    with Loader, Messages {
  final controller = Modular.get<ProductDetailController>();
  final formKey = GlobalKey<FormState>();
  final nameEC = TextEditingController();
  final priceEC = TextEditingController();
  final descriptionEC = TextEditingController();

  @override
  void dispose() {
    nameEC.dispose();
    priceEC.dispose();
    descriptionEC.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      reaction((_) => controller.status, (status) {
        switch (status) {
          case ProductDetailsStateStatus.initial:
            break;
          case ProductDetailsStateStatus.loading:
            showLoader();
            break;
          case ProductDetailsStateStatus.loaded:
            hideLoader();
            break;
          case ProductDetailsStateStatus.error:
            hideLoader();
            showError(controller.errorMessage!);
            break;
          case ProductDetailsStateStatus.errorLoadProduct:
            showError(controller.errorMessage!);
            break;
          case ProductDetailsStateStatus.deleted:
            break;
          case ProductDetailsStateStatus.uploaded:
            hideLoader();
            break;
          case ProductDetailsStateStatus.saved:
            hideLoader();
            Navigator.pop(context);
            break;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final widthButtonAction = context.percentWidth(.4);

    return Container(
      color: Colors.grey[50],
      padding: const EdgeInsets.all(40),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '${widget.productId != null ? 'Alterar' : 'Adicionar'} Produto',
                      textAlign: TextAlign.center,
                      style: context.textStyles.textTitle.copyWith(
                        decoration: TextDecoration.underline,
                        decorationThickness: 2,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Observer(
                        builder: (_) {
                          if (controller.imagePath != null) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.network(
                                '${Env.instance.get('backend_base_url')}${controller.imagePath}',
                                width: 200,
                              ),
                            );
                          }
                          return const SizedBox.shrink();
                        },
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: TextButton(
                          onPressed: () {
                            UploadHtmlHelper()
                                .startUpload(controller.uploadImageProduct);
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.white.withOpacity(0.9),
                          ),
                          child: Observer(builder: (_) {
                            return Text(
                              '${controller.imagePath == null ? 'Adicionar' : 'Alterar'} Foto',
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        TextFormField(
                          controller: nameEC,
                          validator: Validatorless.required('Nome Obrigatório'),
                          decoration:
                              const InputDecoration(label: Text('Nome')),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          controller: priceEC,
                          validator:
                              Validatorless.required('Preço Obrigatório'),
                          decoration:
                              const InputDecoration(label: Text('Preço')),
                          // formatação para moeda
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            CentavosInputFormatter(moeda: true),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: descriptionEC,
                validator: Validatorless.required('Descrição Obrigatório'),
                minLines: 10,
                maxLines: null,
                keyboardType: TextInputType.multiline,
                decoration: const InputDecoration(
                  label: Text('Descrição'),
                  alignLabelWithHint: true,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  width: widthButtonAction,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: widthButtonAction / 2,
                        padding: const EdgeInsets.all(5),
                        height: 60,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.red),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Deletar',
                            style: context.textStyles.textBold
                                .copyWith(color: Colors.red),
                          ),
                        ),
                      ),
                      Container(
                        width: widthButtonAction / 2,
                        padding: const EdgeInsets.all(5),
                        height: 60,
                        child: ElevatedButton(
                          onPressed: () {
                            final valid =
                                formKey.currentState!.validate() ?? false;
                            if (valid) {
                              if (controller.imagePath == null) {
                                showWarning(
                                    'Imagem Obrigatorio, por favor clique em adicionar');
                                return;
                              }
                              controller.save(
                                  nameEC.text,
                                  UtilBrasilFields.converterMoedaParaDouble(
                                      priceEC.text),
                                  descriptionEC.text);
                            }
                          },
                          child: Text(
                            'Salvar',
                            style: context.textStyles.textBold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
