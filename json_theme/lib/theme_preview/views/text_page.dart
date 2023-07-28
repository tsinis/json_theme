import 'package:flutter/material.dart';

import '../../consts.dart';
import '../../widgets/list_views/list_view.dart';
import 'preview_body.dart';

class TextPage extends PreviewBody {
  const TextPage({Key? key}) : super(key: key);

  @override
  IconData get icon => Icons.text_fields;

  @override
  String get label => 'Text';

  @override
  Widget build(BuildContext context) => MyListView(
        padding: kPaddingAll,
        children: [
          Text(
            'Display large',
            style: Theme.of(context).textTheme.displayLarge,
          ),
          Text(
            'Display medium',
            style: Theme.of(context).textTheme.displayMedium,
          ),
          Text(
            'Display small',
            style: Theme.of(context).textTheme.displaySmall,
          ),
          Text(
            'Headline large',
            style: Theme.of(context).textTheme.headlineLarge,
          ),
          Text(
            'Headline medium',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Text(
            'Headline small',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          Text(
            'Title large',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text(
            'Title medium',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            'Title small',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          Text(
            'Label large',
            style: Theme.of(context).textTheme.labelLarge,
          ),
          Text(
            'Label medium',
            style: Theme.of(context).textTheme.labelMedium,
          ),
          Text(
            'Label small',
            style: Theme.of(context).textTheme.labelSmall,
          ),
          Text(
            'Body large',
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          Text(
            'Body medium',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Text(
            'Body small',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      );
}
