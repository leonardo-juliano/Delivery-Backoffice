import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:validatorless/validatorless.dart';

import '../../../../core/ui/helpers/size_extensions.dart';
import '../../../../core/ui/styles/text_styles.dart';
import '../../../../models/payment_type_model.dart';
import '../../payment_type_controller.dart';

class PaymentTypeFormModal extends StatefulWidget {
  final PaymentTypeController controller;
  final PaymentTypeModel? model;

  const PaymentTypeFormModal(
      {super.key, required this.model, required this.controller});

  @override
  State<PaymentTypeFormModal> createState() => _PaymentTypeFormModalState();
}

class _PaymentTypeFormModalState extends State<PaymentTypeFormModal> {
  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;

    final formKey = GlobalKey<FormState>();
    final nameEC = TextEditingController();
    final acronymEC = TextEditingController();
    var enabled = false;

    void _close_modal() => Navigator.of(context).pop();

    @override
    void initState() {
      if (widget.model != null) {
        nameEC.text = widget.model!.name;
        acronymEC.text = widget.model!.acronym;
        enabled = widget.model!.enabled;
      }
    }

    @override
    void dispose() {
      nameEC.dispose();
      acronymEC.dispose();
      super.dispose();
    }

    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(30),
        width: screenWidth * (screenWidth > 1200 ? .5 : .7),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Stack(
                children: [
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      '${widget.model == null ? 'Adicionar' : 'Editar'} forma de pagamento',
                      textAlign: TextAlign.center,
                      style: context.textStyles.textTitle,
                    ),
                  ),
                  Align(
                      alignment: Alignment.centerRight,
                      child: InkWell(
                        onTap: () => _close_modal(),
                        child: const Icon(Icons.close),
                      )),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: nameEC,
                validator: Validatorless.required('Nome Obrigatório'),
                decoration: const InputDecoration(labelText: 'Nome'),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: acronymEC,
                validator: Validatorless.required('Sigla Obrigatório'),
                decoration: const InputDecoration(labelText: 'Sigla'),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text('Ativo', style: context.textStyles.textRegular),
                  Switch(
                    value: enabled,
                    onChanged: (value) {
                      setState(() {
                        enabled = value;
                      });
                    },
                  ),
                  const Divider(),
                ],
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    height: 60,
                    padding: const EdgeInsets.all(8),
                    child: OutlinedButton(
                      onPressed: () {
                        _close_modal();
                      },
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.red),
                      ),
                      child: Text(
                        'Cancelar',
                        style: context.textStyles.textExtraBold
                            .copyWith(color: Colors.red),
                      ),
                    ),
                  ),
                  Container(
                    height: 60,
                    padding: const EdgeInsets.all(8),
                    child: ElevatedButton.icon(
                      onPressed: () {
                        final valid = formKey.currentState?.validate() ?? false;

                        if (valid) {
                          final name = nameEC.text;
                          final acronym = acronymEC.text;
                          widget.controller.savePayment(
                              id: widget.model?.id,
                              name: name,
                              acronym: acronym,
                              enabled: enabled);
                        }
                      },
                      icon: const Icon(Icons.save, color: Colors.white),
                      label: const Text('Salvar',
                          style: TextStyle(color: Colors.white),),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
