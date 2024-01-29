import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const Color timerColor = Color.fromARGB(255, 7, 56, 13);

class TimerFrame extends StatelessWidget {
  final String description;
  final Widget timer;
  final bool inverted;

  /// The constructor takes the description and timer as parameters
  /// The description is the text that is displayed above the timer
  /// The timer is the widget that displays the timer
  /// The inverted parameter is used to invert the colors of the timer
  /// The key parameter is used to identify the widget
  /// The super() method is used to call the constructor of the parent class
  const TimerFrame({
    required this.description,
    required this.timer,
    this.inverted = false,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      /// MediaQuery.of(context).size.width returns the width of the screen
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(
        vertical: inverted ? 30 : 40,
      ),

      /// BoxDecoration is used to add a border to the container
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: inverted ? CupertinoColors.white : timerColor,
        border: Border.all(
          color: inverted ? timerColor : Colors.transparent,
        ),
      ),
      child: Column(
        children: [
          /// Text widget is used to display text
          /// The text is passed as a parameter to the constructor
          /// In this case the text is the description of the timer
          Text(
            description,
            style: TextStyle(
              fontSize: 20,
              letterSpacing: 0,
              color: inverted ? timerColor : CupertinoColors.white,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          timer,
        ],
      ),
    );
  }
}
