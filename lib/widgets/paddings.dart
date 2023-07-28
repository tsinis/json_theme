import 'package:flutter/material.dart';

import '../consts.dart';

enum PaddingSize { small, medium, normal, large, extraLarge }

class VerticalPadding extends StatelessWidget {
  const VerticalPadding({Key? key, this.size = PaddingSize.normal})
      : super(key: key);
  final PaddingSize size;

  @override
  Widget build(BuildContext context) => SizedBox(height: _getSize(size));
}

class HorizontalPadding extends StatelessWidget {
  const HorizontalPadding({Key? key, this.size = PaddingSize.normal})
      : super(key: key);
  final PaddingSize size;

  @override
  Widget build(BuildContext context) => SizedBox(width: _getSize(size));
}

double _getSize(PaddingSize paddingSize) {
  // ignore: avoid-late-keyword, it's just theme preview.
  late final double size;

  switch (paddingSize) {
    case PaddingSize.small:
      size = kMargin / 4;
      break;
    case PaddingSize.medium:
      size = kMargin / 2;
      break;
    case PaddingSize.large:
      size = kMargin * 2;
      break;
    case PaddingSize.extraLarge:
      size = kMargin * 4;
      break;
    // ignore: no_default_cases, just an example app.
    default:
      size = kMargin;
  }

  return size;
}
