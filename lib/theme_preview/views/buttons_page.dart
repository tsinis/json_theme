import 'package:flutter/material.dart';

import '../../consts.dart';
import '../../widgets/list_views/list_view.dart';
import '../../widgets/paddings.dart';
import 'preview_body.dart';

const _buttonIcon = Icon(Icons.favorite);

class ButtonsPage extends PreviewBody {
  const ButtonsPage({Key? key}) : super(key: key);

  @override
  IconData get icon => Icons.touch_app;

  @override
  String get label => 'Buttons';

  @override
  Widget build(BuildContext context) => MyListView(
        padding: kPaddingAll,
        children: [
          _ButtonsRow(
            children: [
              ElevatedButton(
                onPressed: () {},
                child: const Text('Elevated button'),
              ),
              const ElevatedButton(
                onPressed: null,
                child: Text('Disabled'),
              ),
            ],
          ),
          _ButtonsRow(
            children: [
              ElevatedButton.icon(
                onPressed: () {},
                icon: _buttonIcon,
                label: const Text('Elevated button icon'),
              ),
              ElevatedButton.icon(
                onPressed: null,
                icon: _buttonIcon,
                label: const Text('Disabled'),
              ),
            ],
          ),
          _ButtonsRow(
            children: [
              OutlinedButton(
                onPressed: () {},
                child: const Text('Outlined button'),
              ),
              const OutlinedButton(
                onPressed: null,
                child: Text('Disabled'),
              ),
            ],
          ),
          _ButtonsRow(
            children: [
              OutlinedButton.icon(
                onPressed: () {},
                icon: _buttonIcon,
                label: const Text('Outlined button icon'),
              ),
              OutlinedButton.icon(
                onPressed: null,
                icon: _buttonIcon,
                label: const Text('Disabled'),
              ),
            ],
          ),
          _ButtonsRow(
            children: [
              TextButton(
                onPressed: () {},
                child: const Text('Text button'),
              ),
              const TextButton(
                onPressed: null,
                child: Text('Disabled'),
              ),
            ],
          ),
          _ButtonsRow(
            children: [
              TextButton.icon(
                onPressed: () {},
                icon: _buttonIcon,
                label: const Text('Text button icon'),
              ),
              TextButton.icon(
                onPressed: null,
                icon: _buttonIcon,
                label: const Text('Disabled'),
              ),
            ],
          ),
          const Divider(),
          _IconButtons(),
          const SizedBox(height: 50),
        ],
      );
}

class _ButtonsRow extends StatelessWidget {
  const _ButtonsRow({required this.children, Key? key}) : super(key: key);
  final List<Widget> children;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 40,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) => children[index],
          separatorBuilder: (context, index) => const HorizontalPadding(),
          itemCount: children.length,
        ),
      );
}

class _IconButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final labelStyle = TextStyle(color: Theme.of(context).disabledColor);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Icon buttons',
          style: kListTileTitleStyle,
        ),
        Row(
          children: [
            Text(
              'Enabled',
              style: labelStyle,
            ),
            IconButton(
              onPressed: () {},
              icon: _buttonIcon,
            ),
            const HorizontalPadding(),
            Text(
              'Disabled',
              style: labelStyle,
            ),
            const IconButton(
              onPressed: null,
              icon: _buttonIcon,
            ),
          ],
        ),
      ],
    );
  }
}
