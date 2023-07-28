import 'package:flutter/material.dart';

import '../paddings.dart';
import '../tooltip.dart';

class MyListTile extends StatelessWidget {
  const MyListTile({
    required this.title,
    this.titleColor,
    this.tooltip,
    this.subtitle,
    this.trailing,
    Key? key,
  }) : super(key: key);

  final String title;
  final Color? titleColor;
  final String? tooltip;
  final String? subtitle;
  final Widget? trailing;

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _Title(
                  title: title,
                  titleColor: titleColor,
                  tooltip: tooltip,
                ),
                const VerticalPadding(
                  size: PaddingSize.small,
                ),
                if (subtitle != null)
                  Text(
                    subtitle!,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                    ),
                  ),
              ],
            ),
          ),
          if (trailing != null) trailing!,
        ],
      );
}

class _Title extends StatelessWidget {
  const _Title({required this.title, Key? key, this.titleColor, this.tooltip})
      : super(key: key);

  final String title;
  final Color? titleColor;
  final String? tooltip;

  @override
  Widget build(BuildContext context) => MyTooltip(
        tooltip: tooltip,
        child: Text(
          title,
          style: TextStyle(
            color: titleColor,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
        ),
      );
}
