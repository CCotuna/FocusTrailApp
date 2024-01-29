import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';

import '../pages/BreakPage.dart';
import '../common/strings.dart' as strings;

class TimerBasic extends StatefulWidget {
  final CountDownTimerFormat format;
  final bool inverted;

  const TimerBasic({
    required this.format,
    this.inverted = false,
    Key? key,
  }) : super(key: key);

  @override
  _TimerBasicState createState() => _TimerBasicState();
}

class _TimerBasicState extends State<TimerBasic> {
  Duration _selectedDuration = const Duration(minutes: 1);

  /// TextEditingController is used to get the value from the text field
  final TextEditingController _minutesController = TextEditingController();

  @override

  /// initState() is called when the widget is first created
  void initState() {
    super.initState();
  }

  @override

  /// dispose() is called when the widget is removed from the widget tree
  void dispose() {
    _minutesController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// Radio buttons for selecting the timer duration
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  /// Radio widget is used to create a radio button
                  Radio<Duration>(
                    value: const Duration(minutes: 1),
                    groupValue: _selectedDuration,
                    onChanged: (value) {
                      setState(() {
                        _selectedDuration = value!;
                      });
                    },
                  ),

                  /// Text widget is used to display text
                  Text(strings.timer1Minute,
                      style: const TextStyle(color: Colors.green)),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  /// Radio widget is used to create a radio button
                  Radio<Duration>(
                    value: const Duration(minutes: 5),
                    groupValue: _selectedDuration,
                    onChanged: (value) {
                      setState(() {
                        _selectedDuration = value!;
                      });
                    },
                  ),
                  Text(strings.timer5Minutes,
                      style: const TextStyle(color: Colors.green)),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  /// Radio widget is used to create a radio button
                  Radio<Duration>(
                    value: const Duration(minutes: 10),
                    groupValue: _selectedDuration,
                    onChanged: (value) {
                      setState(() {
                        _selectedDuration = value!;
                      });
                    },
                  ),
                  Text(strings.timer10Minutes,
                      style: const TextStyle(color: Colors.green)),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  /// Radio widget is used to create a radio button
                  Radio<Duration>(
                    value: const Duration(minutes: 25),
                    groupValue: _selectedDuration,
                    onChanged: (value) {
                      setState(() {
                        _selectedDuration = value!;
                      });
                    },
                  ),
                  Text(strings.timer25Minutes,
                      style: const TextStyle(color: Colors.green)),
                  const SizedBox(height: 20),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                children: [
                  /// Radio widget is used to create a radio button
                  Radio<Duration>(
                    value: const Duration(minutes: 60),
                    groupValue: _selectedDuration,
                    onChanged: (value) {
                      setState(() {
                        _selectedDuration = value!;
                      });
                    },
                  ),
                  Text(strings.timer1Hour,
                      style: const TextStyle(color: Colors.green)),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 200,

              /// TextField widget is used to create a text field
              child: TextField(
                controller: _minutesController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  filled: true,
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  labelText: strings.timerLabelText,
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 40),

            /// ElevatedButton widget is used to create a button
            /// onPressed() is called when the button is pressed
            ElevatedButton(
              onPressed: () {
                _setCustomTimer();
              }, // Apply white color
              style: ElevatedButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 214, 214, 214),
                backgroundColor:
                    const Color.fromARGB(255, 29, 56, 7), // Apply green color
              ),
              child: Text(strings.timerButton,
                  style: const TextStyle(color: Colors.white)),
            ),
          ],
        ),

        // Display timer countdown
        TimerCountdown(
          format: widget.format,
          endTime: DateTime.now().add(_selectedDuration),
          onEnd: () {
            print("Timer finished");
            _stopTimer();

            /// Navigator is used to navigate to a new page
            /// The page is defined in the MaterialPageRoute
            /// In this case, the page is BreakTimerPage
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const BreakTimerPage()),
            );
          },

          /// TextStyle is used to style the text
          /// timeTextStyle is used to style the time
          timeTextStyle: TextStyle(
            color: (widget.inverted)
                ? const Color.fromARGB(255, 218, 173, 28)
                : const Color.fromARGB(255, 74, 199, 67),
            fontWeight: FontWeight.w300,
            fontSize: 40,
            fontFeatures: const <FontFeature>[
              FontFeature.tabularFigures(),
            ],
          ),

          /// TextStyle is used to style the text
          /// colonsTextStyle is used to style the colons
          colonsTextStyle: TextStyle(
            color: (widget.inverted)
                ? const Color.fromARGB(255, 218, 173, 28)
                : const Color.fromARGB(255, 232, 232, 232),
            fontWeight: FontWeight.w300,
            fontSize: 40,
            fontFeatures: const <FontFeature>[
              FontFeature.tabularFigures(),
            ],
          ),

          /// TextStyle is used to style the text
          /// descriptionTextStyle is used to style the description
          descriptionTextStyle: TextStyle(
            color: (widget.inverted)
                ? const Color.fromARGB(255, 218, 173, 28)
                : const Color.fromARGB(255, 232, 232, 232),
            fontSize: 10,
            fontFeatures: const <FontFeature>[
              FontFeature.tabularFigures(),
            ],
          ),
          spacerWidth: 0,
          hoursDescription: strings.hoursDescription,
          minutesDescription: strings.minutesDescription,
          secondsDescription: strings.minutesDescription,
        ),
      ],
    );
  }

  void _setCustomTimer() {
    // Check if the text field is empty
    if (_minutesController.text.isNotEmpty) {
      /// int.tryParse() is used to convert a string to an integer
      int minutes = int.tryParse(_minutesController.text) ?? 0;

      /// setState() is used to update the state of the widget
      /// In this case, the state is updated to the selected duration
      setState(() {
        _selectedDuration = Duration(minutes: minutes);
      });
    }
  }

  /// _stopTimer() is called when the timer is stopped
  void _stopTimer() {
    setState(() {});
  }
}
