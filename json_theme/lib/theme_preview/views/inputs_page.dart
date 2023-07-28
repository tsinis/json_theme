import 'package:flutter/material.dart';

import '../../consts.dart';
import '../../widgets/list_views/list_view.dart';
import 'preview_body.dart';

class InputsPage extends PreviewBody {
  const InputsPage({Key? key}) : super(key: key);

  @override
  IconData get icon => Icons.keyboard;

  @override
  String get label => 'Inputs';

  @override
  Widget build(BuildContext context) => GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: MyListView(
          padding: kPaddingAll,
          children: [
            _TextFieldEnabled(),
            _TextFieldDisabled(),
            _TextFieldHintHelperCounter(),
            _TextFieldPrefixSuffix(),
            _TextFieldError(),
            const SizedBox(height: 50),
          ],
        ),
      );
}

class _TextFieldEnabled extends StatelessWidget {
  @override
  Widget build(BuildContext context) => const TextField(
        decoration: InputDecoration(labelText: 'Label'),
      );
}

class _TextFieldDisabled extends StatelessWidget {
  @override
  Widget build(BuildContext context) => const TextField(
        decoration: InputDecoration(labelText: 'Disabled'),
        enabled: false,
      );
}

class _TextFieldHintHelperCounter extends StatelessWidget {
  @override
  Widget build(BuildContext context) => const TextField(
        decoration: InputDecoration(
          helperText: 'Helper',
          hintText: 'Hint',
          counterText: 'Counter',
        ),
      );
}

class _TextFieldPrefixSuffix extends StatelessWidget {
  @override
  Widget build(BuildContext context) => TextFormField(
        initialValue: 'Input',
        decoration: const InputDecoration(
          prefixText: 'Prefix: ',
          suffixText: 'Suffix',
        ),
      );
}

class _TextFieldError extends StatelessWidget {
  @override
  Widget build(BuildContext context) => const TextField(
        decoration: InputDecoration(
          labelText: 'Label',
          errorText: 'Error',
        ),
      );
}
