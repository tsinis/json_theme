import 'package:flutter/material.dart';

import '../../consts.dart';
import '../../widgets/list_tiles/list_tile.dart';
import '../../widgets/list_views/list_view.dart';
import 'preview_body.dart';

class SelectionsPage extends PreviewBody {
  const SelectionsPage({Key? key}) : super(key: key);

  @override
  IconData get icon => Icons.select_all;

  @override
  String get label => 'Selections';

  @override
  Widget build(BuildContext context) => MyListView(
        padding: kPaddingAll,
        children: [
          _SwitchEnabled(),
          _SwitchDisabled(),
          const Divider(height: 0),
          _CheckboxEnabled(),
          _CheckboxDisabled(),
          const Divider(height: 0),
          _Radio(),
          const Divider(height: 0),
          const Text(
            'Sliders',
            style: kListTileTitleStyle,
          ),
          _SliderEnabled(),
          _SliderEnabledDivisions(),
          _SliderDisabled(),
          const Divider(height: 0),
          _DatePicker(),
          _TimePicker(),
          const SizedBox(height: 50),
        ],
      );
}

class _SwitchEnabled extends StatefulWidget {
  @override
  _SwitchEnabledState createState() => _SwitchEnabledState();
}

class _SwitchEnabledState extends State<_SwitchEnabled> {
  bool _value = true;

  @override
  Widget build(BuildContext context) => MyListTile(
        title: 'Switch enabled',
        trailing: Switch(
          value: _value,
          onChanged: (value) => setState(() => _value = value),
        ),
      );
}

class _SwitchDisabled extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MyListTile(
        title: 'Switch disabled',
        titleColor: Theme.of(context).disabledColor,
        trailing: const Switch(
          value: true,
          onChanged: null,
        ),
      );
}

class _CheckboxEnabled extends StatefulWidget {
  @override
  _CheckboxEnabledState createState() => _CheckboxEnabledState();
}

class _CheckboxEnabledState extends State<_CheckboxEnabled> {
  bool? _value = true;

  @override
  Widget build(BuildContext context) => MyListTile(
        title: 'Checkbox enabled',
        trailing: Checkbox(
          value: _value,
          onChanged: (value) => setState(() => _value = value),
        ),
      );
}

class _CheckboxDisabled extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MyListTile(
        title: 'Checkbox disabled',
        titleColor: Theme.of(context).disabledColor,
        trailing: const Checkbox(
          value: true,
          onChanged: null,
        ),
      );
}

class _Radio extends StatefulWidget {
  @override
  _RadioState createState() => _RadioState();
}

class _RadioState extends State<_Radio> {
  int? _groupValue = 0;

  @override
  Widget build(BuildContext context) => Column(
        children: [0, 1, 2]
            .map(
              (value) => MyListTile(
                title: 'Radio ${value + 1}',
                trailing: Radio(
                  value: value,
                  groupValue: _groupValue,
                  onChanged: (int? newValue) => setState(() {
                    _groupValue = newValue;
                  }),
                ),
              ),
            )
            .toList()
          ..add(
            MyListTile(
              title: 'Radio disabled',
              titleColor: Theme.of(context).disabledColor,
              trailing: const Radio(
                value: null,
                groupValue: null,
                onChanged: null,
              ),
            ),
          ),
      );
}

class _SliderEnabled extends StatefulWidget {
  @override
  _SliderEnabledState createState() => _SliderEnabledState();
}

class _SliderEnabledState extends State<_SliderEnabled> {
  double _value = 20;

  @override
  Widget build(BuildContext context) => Slider(
        value: _value,
        onChanged: (value) => setState(() => _value = value),
        max: 100,
        label: _value.round().toString(),
      );
}

class _SliderEnabledDivisions extends StatefulWidget {
  @override
  _SliderEnabledDivisionsState createState() => _SliderEnabledDivisionsState();
}

class _SliderEnabledDivisionsState extends State<_SliderEnabledDivisions> {
  double _value = 20;

  @override
  Widget build(BuildContext context) => Slider(
        value: _value,
        onChanged: (value) => setState(() => _value = value),
        max: 100,
        divisions: 5,
        label: _value.round().toString(),
      );
}

class _SliderDisabled extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      const Slider(value: 20, onChanged: null, max: 100);
}

class _DatePicker extends StatefulWidget {
  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<_DatePicker> {
  final _firstDate = DateTime(2018, 12, 4);
  DateTime _dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) => MyListTile(
        title: 'Date picker',
        trailing: ElevatedButton(
          onPressed: () async {
            // ignore: prefer-correct-identifier-length, not important.
            final dt = await showDatePicker(
              context: context,
              initialDate: _dateTime,
              firstDate: _firstDate,
              lastDate: DateTime.now(),
            );

            if (context.mounted && dt != null) setState(() => _dateTime = dt);
          },
          child: const Text('Pick date'),
        ),
      );
}

class _TimePicker extends StatefulWidget {
  @override
  _TimePickerState createState() => _TimePickerState();
}

class _TimePickerState extends State<_TimePicker> {
  TimeOfDay timeDay = TimeOfDay.now();

  @override
  Widget build(BuildContext context) => MyListTile(
        title: 'Time picker: ${timeDay.format(context)}',
        trailing: ElevatedButton(
          onPressed: () async {
            final time =
                await showTimePicker(context: context, initialTime: timeDay);

            if (time != null && context.mounted) setState(() => timeDay = time);
          },
          child: const Text('Pick time'),
        ),
      );
}
