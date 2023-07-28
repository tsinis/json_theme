import 'package:flutter/material.dart';

class SideBySide extends StatelessWidget {
  const SideBySide({required this.left, required this.right, Key? key})
      : super(key: key);
  final Widget left;
  final Widget right;

  @override
  Widget build(BuildContext context) => IntrinsicHeight(
        child: Row(
          children: [
            Expanded(child: left),
            const VerticalDivider(),
            Expanded(child: right),
          ],
        ),
      );
}
