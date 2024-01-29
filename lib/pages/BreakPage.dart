import 'package:flutter/material.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';
import '../widgets/timer_basic.dart';
import '../widgets/timer_frame.dart';
import 'HomePage.dart';
import '../common/strings.dart' as strings;

class BreakTimerPage extends StatelessWidget {
  /// The constructor takes the key parameter to identify the widget
  const BreakTimerPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 4,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// Logo
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                'FocusTrail.png',
                height: 50,
              ),
            ),

            /// Title
            Text(
              strings.appBarTitle,
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
        centerTitle: true,

        /// Center the title
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 20),
          Text(
            strings.breakScreenTitle,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),
          TimerFrame(
            description: strings.breakScrenDescription,
            timer: const TimerBasic(
              format: CountDownTimerFormat.hoursMinutesSeconds,
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
                (route) => false,

                /// Remove all previous routes from the stack
              );
            },
            child: Text(strings.breakScreenButton),
          ),
        ],
      ),
    );
  }
}
