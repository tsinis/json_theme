import 'package:collection/collection.dart';
import 'package:flutter/material.dart';

import '../../consts.dart';
import '../tooltip.dart';

abstract class ExpansionPanelItem extends StatelessWidget {
  const ExpansionPanelItem({Key? key}) : super(key: key);
  String get header;
  String? get tooltip => null;
}

class MyExpansionPanelList extends StatefulWidget {
  MyExpansionPanelList({
    Key? key,
    List<ExpansionPanelItem>? items,
    ExpansionPanelItem? item,
    this.color,
    // ignore: prefer_asserts_with_message, not necessary.
  })  : assert(items != null || item != null),
        items = items ?? [item!],
        super(key: key);

  final List<ExpansionPanelItem> items;
  final Color? color;

  @override
  State<MyExpansionPanelList> createState() => _MyExpansionPanelListState();
}

class _MyExpansionPanelListState extends State<MyExpansionPanelList> {
  late final List<bool> _expandStates = List.filled(widget.items.length, false);

  @override
  Widget build(BuildContext context) => SingleChildScrollView(
        child: ExpansionPanelList(
          expansionCallback: (int index, bool isExpanded) =>
              setState(() => _expandStates[index] = !isExpanded),
          expandedHeaderPadding: EdgeInsets.zero,
          children: widget.items
              .mapIndexed(
                (index, item) => ExpansionPanel(
                  headerBuilder: (context, isExpanded) => _Header(item: item),
                  body: item,
                  isExpanded: _expandStates[index],
                  canTapOnHeader: true,
                  backgroundColor: widget.color,
                ),
              )
              .toList(),
        ),
      );
}

class _Header extends StatelessWidget {
  const _Header({required this.item, Key? key}) : super(key: key);
  final ExpansionPanelItem item;

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(
          vertical: kMargin * 1.5,
          horizontal: kMargin,
        ),
        child: MyTooltip(
          tooltip: item.tooltip,
          child: Text(
            item.header,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      );
}
