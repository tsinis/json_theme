import 'package:flutter/material.dart';

import '../paddings.dart';
import '../side_by_side.dart';

class SideBySideList extends StatelessWidget {
  const SideBySideList({required this.children, this.padding, Key? key})
      : super(key: key);

  static const _chunkSize = 2;

  final List<Widget> children;
  final EdgeInsets? padding;

  List<List<Widget>> _getChunks() {
    final chunks = <List<Widget>>[];
    for (var i = 0; i < children.length; i += _chunkSize) {
      chunks.add(
        children.sublist(
          i,
          i + _chunkSize > children.length ? children.length : i + _chunkSize,
        ),
      );
    }

    return chunks;
  }

  @override
  Widget build(BuildContext context) {
    final chunks = _getChunks();

    return ListView.separated(
      physics: const ScrollPhysics(),
      shrinkWrap: true,
      padding: padding,
      itemBuilder: (context, index) {
        final chunk = chunks[index];

        return chunk.length == _chunkSize
            ? SideBySide(left: chunk.first, right: chunk[1])
            : chunk.first;
      },
      separatorBuilder: (context, index) => const VerticalPadding(),
      itemCount: chunks.length,
    );
  }
}
