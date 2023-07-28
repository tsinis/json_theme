import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'tooltip.dart';

class MyTextFormField extends StatelessWidget {
  const MyTextFormField({
    required this.labelText,
    required this.onChanged,
    this.initialValue,
    this.enabled,
    this.controller,
    this.tooltip,
    this.allowNegative = false,
    Key? key,
  }) : super(key: key);

  final String labelText;
  final ValueChanged<String> onChanged;
  final String? initialValue;
  final bool? enabled;
  final TextEditingController? controller;
  final String? tooltip;
  final bool allowNegative;

  @override
  Widget build(BuildContext context) {
    final regex = allowNegative ? r'[\d/./-]' : r'[\d/.]';

    return MyTooltip(
      tooltip: tooltip,
      child: TextFormField(
        controller: controller,
        initialValue: initialValue,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        onChanged: onChanged,
        inputFormatters: [FilteringTextInputFormatter.allow(RegExp(regex))],
        enabled: enabled,
      ),
    );
  }
}
