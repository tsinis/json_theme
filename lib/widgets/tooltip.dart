import 'package:flutter/material.dart';

import '../consts.dart';

class MyTooltip extends StatelessWidget {
  const MyTooltip({required this.child, Key? key, this.tooltip})
      : super(key: key);

  final Widget child;
  final String? tooltip;

  @override
  Widget build(BuildContext context) => tooltip != null
      ? Tooltip(
          message: tooltip,
          padding: const EdgeInsets.all(kMargin / 2),
          child: child,
        )
      : child;
}
