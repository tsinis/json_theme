import 'package:flutter/material.dart';

import 'list_tile.dart';

class MySwitchListTile extends StatelessWidget {
  const MySwitchListTile({
    required this.title,
    required this.value,
    required this.onChanged,
    Key? key,
    this.tooltip,
    this.label,
  }) : super(key: key);
  final String title;
  final String? tooltip;
  final bool value;
  final ValueChanged<bool> onChanged;
  final String? label;

  @override
  Widget build(BuildContext context) => MyListTile(
        title: title,
        tooltip: tooltip,
        trailing: Row(
          children: [
            Switch(
              value: value,
              onChanged: onChanged,
              activeColor: Colors.blueGrey,
            ),
            if (label != null) Text(label!),
          ],
        ),
      );
}
