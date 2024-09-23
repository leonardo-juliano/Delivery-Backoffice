import 'package:flutter/material.dart';

class BaseHeader extends StatelessWidget {
  final String title;
  final ValueChanged<String> searchchange;
  final String buttonLabel;
  final VoidCallback? buttonPressed;
  final bool addButton;
  final Widget? filterWidget;

  const BaseHeader(
      {super.key,
      required this.title,
      required this.searchchange,
      required this.buttonLabel,
      this.buttonPressed,
      required this.addButton,
      this.filterWidget});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constrains) {
      return Wrap(
        children: [Visibility(child: TextFormField())],
      );
    });
  }
}
