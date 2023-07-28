import 'package:flutter/material.dart';

import '../../consts.dart';
import 'list_view.dart';

class NestedListView extends StatelessWidget {
  const NestedListView({required this.children, Key? key}) : super(key: key);
  final List<Widget> children;

  @override
  Widget build(BuildContext context) => MyListView(
        shrinkwrap: true,
        physics: const ScrollPhysics(),
        padding: kPaddingAll,
        children: children,
      );
}
