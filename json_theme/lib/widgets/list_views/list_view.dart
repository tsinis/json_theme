import 'package:flutter/material.dart';

import '../paddings.dart';

class MyListView extends StatelessWidget {
  const MyListView({
    required this.children,
    this.shrinkwrap = false,
    this.physics,
    this.padding,
    Key? key,
  }) : super(key: key);

  final List<Widget> children;
  final EdgeInsets? padding;
  final ScrollPhysics? physics;
  final bool shrinkwrap;

  @override
  Widget build(BuildContext context) => ListView.separated(
        physics: physics,
        shrinkWrap: shrinkwrap,
        padding: padding,
        itemBuilder: (context, index) => children[index],
        separatorBuilder: (context, index) => const VerticalPadding(),
        itemCount: children.length,
      );
}
