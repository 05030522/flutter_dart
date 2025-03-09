import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: SafeArea(
        bottom: false,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              _Top(
                selectedDate: selectedDate,
                onPressed: () {
                  showCupertinoDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (BuildContext context) {
                      return Align(
                        alignment: Alignment.center,
                        child: Container(
                          color: Colors.white,
                          height: 300,
                          child: CupertinoDatePicker(
                            mode: CupertinoDatePickerMode.date,
                            initialDateTime: selectedDate,
                            maximumDate: DateTime.now(),
                            onDateTimeChanged: (DateTime date) {
                              setState(() {
                                selectedDate = date;
                              });
                            },
                            dateOrder: DatePickerDateOrder.ymd,
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
              const _Bottom(),
            ],
          ),
        ),
      ),
    );
  }
}

class _Top extends StatelessWidget {
  final DateTime selectedDate;
  final VoidCallback? onPressed;

  const _Top({
    super.key,
    required this.selectedDate,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final textTheme = Theme.of(context).textTheme;
    return Expanded(
      child: Container(
        child: Column(
          children: [
            const SizedBox(height: 30),
            Text(
              'U&I',
              style: textTheme.displayLarge,
            ),
            Text('공주 처음 만난날', style: textTheme.bodyLarge),
            Text(
                '${selectedDate.year}.${selectedDate.month}.${selectedDate.day}',
                style: textTheme.bodyMedium),
            IconButton(
              onPressed: onPressed,
              iconSize: 60,
              color: Colors.red[300],
              icon: const Icon(
                Icons.favorite,
              ),
            ),
            Text('D +${now.difference(selectedDate).inDays}',
                style: textTheme.displayMedium),
          ],
        ),
      ),
    );
  }
}

class _Bottom extends StatelessWidget {
  const _Bottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: Image.asset('asset/img/middle_image.png'),
      ),
    );
  }
}
