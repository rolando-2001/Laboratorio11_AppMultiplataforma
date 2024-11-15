import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class DatePickerScreen extends StatelessWidget {
  const DatePickerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('es', ''),
      ],
      locale: const Locale('es', ''), 
      home: const DatePickerComparison(),
    );
  }
}

class DatePickerComparison extends StatelessWidget {
  const DatePickerComparison({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Comparación de Selectores de Fecha'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Selector de Fecha Material',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: MaterialDatePickerExample()),
          Divider(),
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Selector de Fecha Cupertino',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(child: CupertinoDatePickerExample()),
        ],
      ),
    );
  }
}

class MaterialDatePickerExample extends StatefulWidget {
  const MaterialDatePickerExample({super.key, this.restorationId});

  final String? restorationId;

  @override
  State<MaterialDatePickerExample> createState() => _MaterialDatePickerExampleState();
}

class _MaterialDatePickerExampleState extends State<MaterialDatePickerExample>
    with RestorationMixin {
  @override
  String? get restorationId => widget.restorationId;

  final RestorableDateTime _selectedDate =
      RestorableDateTime(DateTime(2021, 7, 25));
  late final RestorableRouteFuture<DateTime?> _restorableDatePickerRouteFuture =
      RestorableRouteFuture<DateTime?>(
    onComplete: _selectDate,
    onPresent: (NavigatorState navigator, Object? arguments) {
      return navigator.restorablePush(
        _datePickerRoute,
        arguments: _selectedDate.value.millisecondsSinceEpoch,
      );
    },
  );

  @pragma('vm:entry-point')
  static Route<DateTime> _datePickerRoute(
    BuildContext context,
    Object? arguments,
  ) {
    return DialogRoute<DateTime>(
      context: context,
      builder: (BuildContext context) {
        return DatePickerDialog(
          restorationId: 'date_picker_dialog',
          initialEntryMode: DatePickerEntryMode.calendarOnly,
          initialDate: DateTime.fromMillisecondsSinceEpoch(arguments! as int),
          firstDate: DateTime(2021),
          lastDate: DateTime(2022),
        );
      },
    );
  }

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_selectedDate, 'selected_date');
    registerForRestoration(
        _restorableDatePickerRouteFuture, 'date_picker_route_future');
  }

  void _selectDate(DateTime? newSelectedDate) {
    if (newSelectedDate != null) {
      setState(() {
        _selectedDate.value = newSelectedDate;
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(
              'Seleccionado: ${_selectedDate.value.day}/${_selectedDate.value.month}/${_selectedDate.value.year}'),
        ));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: OutlinedButton(
        onPressed: () {
          _restorableDatePickerRouteFuture.present();
        },
        child: const Text('Abrir Selector de Fecha'),
      ),
    );
  }
}

class CupertinoDatePickerExample extends StatefulWidget {
  const CupertinoDatePickerExample({super.key});

  @override
  State<CupertinoDatePickerExample> createState() => _CupertinoDatePickerExampleState();
}

class _CupertinoDatePickerExampleState extends State<CupertinoDatePickerExample> {
  DateTime date = DateTime(2016, 10, 26);
  DateTime time = DateTime(2016, 5, 10, 22, 35);
  DateTime dateTime = DateTime(2016, 8, 3, 17, 45);

  void _showDialog(Widget child) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: TextStyle(
        color: CupertinoColors.label.resolveFrom(context),
        fontSize: 22.0,
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _DatePickerItem(
              children: <Widget>[
                const Text('Fecha'),
                CupertinoButton(
                  onPressed: () => _showDialog(
                    CupertinoDatePicker(
                      initialDateTime: date,
                      mode: CupertinoDatePickerMode.date,
                      use24hFormat: true,
                      showDayOfWeek: true,
                      onDateTimeChanged: (DateTime newDate) {
                        setState(() => date = newDate);
                      },
                    ),
                  ),
                  child: Text(
                    '${date.day}-${date.month}-${date.year}',
                    style: const TextStyle(
                      fontSize: 22.0,
                    ),
                  ),
                ),
              ],
            ),
            _DatePickerItem(
              children: <Widget>[
                const Text('Hora'),
                CupertinoButton(
                  onPressed: () => _showDialog(
                    CupertinoDatePicker(
                      initialDateTime: time,
                      mode: CupertinoDatePickerMode.time,
                      use24hFormat: true,
                      onDateTimeChanged: (DateTime newTime) {
                        setState(() => time = newTime);
                      },
                    ),
                  ),
                  child: Text(
                    '${time.hour}:${time.minute}',
                    style: const TextStyle(
                      fontSize: 22.0,
                    ),
                  ),
                ),
              ],
            ),
            _DatePickerItem(
              children: <Widget>[
                const Text('Fecha y Hora'),
                CupertinoButton(
                  onPressed: () => _showDialog(
                    CupertinoDatePicker(
                      initialDateTime: dateTime,
                      use24hFormat: true,
                      onDateTimeChanged: (DateTime newDateTime) {
                        setState(() => dateTime = newDateTime);
                      },
                    ),
                  ),
                  child: Text(
                    '${dateTime.day}-${dateTime.month}-${dateTime.year} ${dateTime.hour}:${dateTime.minute}',
                    style: const TextStyle(
                      fontSize: 22.0,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _DatePickerItem extends StatelessWidget {
  const _DatePickerItem({required this.children});

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: CupertinoColors.inactiveGray,
            width: 0.0,
          ),
          bottom: BorderSide(
            color: CupertinoColors.inactiveGray,
            width: 0.0,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: children,
        ),
      ),
    );
  }
}