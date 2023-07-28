import 'package:flutter/material.dart';

import 'list_tile.dart';

class DropdownListTile extends StatelessWidget {
  const DropdownListTile({
    required this.title,
    required this.value,
    required this.values,
    required this.onChanged,
    Key? key,
    this.tooltip,
  }) : super(key: key);
  final String title;
  final String? tooltip;
  final String value;
  final List<String> values;
  final void Function(String?) onChanged;

  @override
  Widget build(BuildContext context) => MyListTile(
        title: title,
        tooltip: tooltip,
        trailing: DropdownButton(
          key: const Key('dropdownListTile_dropdownButton'),
          items: values
              .map(
                (String value) => DropdownMenuItem(
                  key: ValueKey(value),
                  value: value,
                  child: Text(value),
                ),
              )
              .toList(),
          value: value,
          onChanged: onChanged,
        ),
      );
}
